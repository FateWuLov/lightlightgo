
import 'package:lifeaste/common/strings.dart';
import 'package:lifeaste/common/tools.dart';
import 'package:lifeaste/common/typicalKeys.dart';
import 'package:lifeaste/logic/global.dart';
import 'package:lifeaste/manager/database/databaseMagager.dart';
import 'package:lifeaste/models/loginParams.dart';
import 'package:lifeaste/models/orderModel.dart';
import 'package:lifeaste/models/tarotModel.dart';
import 'package:lifeaste/models/userModel.dart';
import 'package:lifeaste/pages/star_list/state.dart';
import 'package:lifeaste/widgets/dialog/iconMsgDialog.dart';

import '../hiveManager.dart';
import 'networkRequest.dart';
import 'networkResultData.dart';

final apiManager = ApiManager();

class ApiManager {
  static String hostStr() {
    // return Config.getHostURL()
    return Global.logic().state.isDebugServer
        ? 'http://3.236.42.87:8018'
        : 'https://api.psych-scope.com';
  }

  Future<NetResultData> getStarList() async {
    return netRequest.getRequest('${hostStr()}/ranked/stars', null);
  }

  Future<List<UserInfoModel>?> getStarListOfPage(
      int page, int countPerPage, {int sort = StarSortType_Default}) async {
    Map<String, dynamic> params = {'countPerPage': countPerPage, 'page': page};
    if(sort > StarSortType_Default && sort <= StarSortType_TopRated) {
      params['sort'] = StarSortStrs[sort];
    }
    NetResultData data = await netRequest.getRequest(
        '${hostStr()}/stars', params);
    if (data.result) {
      List items = data.data['rows'];
      return items.map((e) => UserInfoModel.fromJson(e)).toList();
    } else {
      return null;
    }
  }

  // Future<NetResultData> filterStar(FilterModel model, {int sort = StarSortType_Default}) async {
  //   Map<String, dynamic> params = {
  //     'serviceType': model.serviceList(),
  //     'needOnline': model.needOnline,
  //     'canRush': model.canRush,
  //     'price': [model.minPrice, model.maxPrice]
  //   };
  //   if(sort > StarSortType_Default && sort <= StarSortType_TopRated) {
  //     params['sort'] = StarSortStrs[sort];
  //   }
  //   return netRequest.postRequest('${hostStr()}/filter/stars', params);
  // }

  ///拉取周推荐神婆
  Future<NetResultData> getDiscoverStars() async {
    NetResultData resultData = await netRequest.getRequest('${hostStr()}/user/ranked/stars', {
      'type': 'weeklyRecommend'
    });
    return resultData;
  }

  ///拉取tarot推荐神婆
  Future<NetResultData> getTarotStars() async {
    NetResultData resultData = await netRequest.getRequest('${hostStr()}/user/ranked/stars', {
      'type': 'tarotRecommend'
    });
    return resultData;
  }

  //用户相关
  Future<NetResultData> login(Map<String, dynamic> params) async {
    NetResultData resultData = await netRequest.postRequest('${hostStr()}/user/login', params);
    return resultData;
  }

  ///增加绑定用户逻辑，返回数据结构修改
  Future<NetResultData> loginV2(LoginParams params) async {
    params.uuid = Global.logic().state.uuid;
    LoginAfInfo afInfo = LoginAfInfo.fromJson({});
    String afAd = getAfAdFromPref();
    if (afAd.isNotEmpty) {
      afInfo.af_ad = afAd;
    }
    String campaign = getCampaignFromPref();
    if (campaign.isNotEmpty) {
      afInfo.campaign = campaign;
    }
    params.afInfo = afInfo;

    print('ccx loginV2 ${params.toJson().entries}');

    NetResultData resultData =
        await netRequest.postRequest('${hostStr()}/user/login2', params.toJson());
    return resultData;
  }

  /// loginType：新账号的登录方式
  /// loginId：新账号的loginId
  /// bindId：游客账号的userId
  Future<NetResultData> bind({String loginType = '', String loginId = '', String guestUserId = ''}) async {
    NetResultData resultData =
    await netRequest.postRequest('${hostStr()}/user/bind', {
      'loginId': loginId,
      'bindId': guestUserId,
      'loginType': loginType
    });
    return resultData;
  }

  Future<NetResultData> getMyInfo() async {
    NetResultData resultData =
        await netRequest.getRequest('${hostStr()}/user/me', null);
    if (resultData.result) {
      UserInfoModel userInfo = UserInfoModel.fromJson(resultData.data);
      Global.userLogic().updateLocalUserInfo(userInfo);
      // Global.xmppLogic().connect();
    }
    return resultData;
  }

  Future<NetResultData> updateMyInfo(Map<String, dynamic> params) async {
    return netRequest.postRequest('${hostStr()}/user/me', params);
  }

  // 获取Advisor的信息
  Future<NetResultData> getStarInfo(String userId) async {
    return getUserInfo(userId, isStar: true);
  }

  Future<NetResultData> getUserInfo(String userId,
      {bool isStar = false}) async {
    String identify =
        isStar ? TypicalKeys.roleIdentify_star : TypicalKeys.roleIdentify_user;
    NetResultData resultData = await netRequest.getRequest(
        '${hostStr()}/user/who',
        {'user_id': userId, 'user_identify': identify});
    if (resultData.result) {
      UserInfoModel model = UserInfoModel.fromJson(resultData.data);
      DatabaseManager.instance.updateUser(model);
    }
    return resultData;
  }

  Future<NetResultData> getUserComments({
    String userId = '',
    int page = 1,
    int countPerPage = 20,
    bool withText = true,
  }) async {
    return netRequest
        .getRequest('${hostStr()}/user/order/comments', {
          'userId': userId,
      'page': page,
      'countPerPage': countPerPage,
      'withTxt': withText? '1' : '0'
    });
  }

  Future<NetResultData> reportUser(String userId, String reason) async {
    return netRequest.getRequest(
        '${hostStr()}/user/report', {'targetId': userId, 'reason': reason});
  }

  Future<NetResultData> searchUser(String keyword,
      {bool isStar = false}) async {
    String identify =
        isStar ? TypicalKeys.roleIdentify_star : TypicalKeys.roleIdentify_user;
    return netRequest.postRequest('${hostStr()}/user/search', {
      'k': keyword,
      'identify': identify,
    });
  }

  Future<NetResultData> blockUser(String userId, String identify) async {
    NetResultData resultData = await netRequest.postRequest(
        '${hostStr()}/user/block',
        {'targetId': userId, 'targetIdentify': identify});
    if (resultData.result) {
      _updateBlockStatus(userId, true);
    }
    return resultData;
  }

  Future<NetResultData> unblockUser(String userId, String identify) async {
    NetResultData resultData = await netRequest.postRequest(
        '${hostStr()}/user/unblock',
        {'targetId': userId, 'targetIdentify': identify});
    if (resultData.result) {
      _updateBlockStatus(userId, false);
    }
    return resultData;
  }

  _updateBlockStatus(String userId, bool block) async {
    UserInfoModel? model = await DatabaseManager.instance.getUser(userId);
    if (model == null) return;
    model.isBlockingHim = block;
    DatabaseManager.instance.updateUser(model);
  }

  Future<NetResultData> favoriteUser(String userId) async {
    NetResultData resultData = await netRequest.postRequest(
        '${hostStr()}/user/favorite',
        {'starId': userId});
    if (resultData.result) {
      _updateFavoriteStatus(userId, true);
    }
    return resultData;
  }

  Future<NetResultData> unfavoriteUser(String userId) async {
    NetResultData resultData = await netRequest.postRequest(
        '${hostStr()}/user/unfavorite',
        {'starId': userId});
    if (resultData.result) {
      _updateFavoriteStatus(userId, false);
    }
    return resultData;
  }

  _updateFavoriteStatus(String userId, bool block) async {
    UserInfoModel? model = await DatabaseManager.instance.getUser(userId);
    if (model == null) return;
    model.favorite = block;
    DatabaseManager.instance.updateUser(model);
  }

  Future<NetResultData> favoriteList(int page, int countPerPage) async {
    NetResultData resultData = await netRequest.getRequest(
        '${hostStr()}/user/favorites',
        {'page': page, 'countPerPage': countPerPage});
    return resultData;
  }

  ///向服务器同步特殊用户信息
  ///调用时机:
  ///1.启动app
  ///2.购买
  ///3.登录
  syncUserInfo() async {
    if (!Global.userLogic().hasLogin()) {
      return;
    }
    Map<String, dynamic> params = {};
    // String afId = await AnalyticsManager.instance.appsflyerSdk.getAppsFlyerUID();
    // if (afId.isNotEmpty) {
    //   params['afId'] = afId;
    // }
    if (Global.logic().state.uuid.isNotEmpty) {
      params['uuid'] = Global.logic().state.uuid;
    }
    if (Global.logic().state.locale != null) {
      String country = Global.logic().state.locale?.countryCode ?? '';
      if (country.isNotEmpty) {
        params['country'] = country;
      }
    }
    params['timezone'] = DateTime.now().timeZoneOffset.inSeconds;

    NetResultData resultData = await netRequest.postRequest('${hostStr()}/user/load', params);
    if (resultData.code == 400 && resultData.errorCode == 10005) {
      // 强制退出登录
      Global.userLogic().logout();
      if (resultData.errorMsg?.isNotEmpty == true) {
        Future.delayed(Duration(seconds: 1), () {
          showNormalDialog(
            barrierDismissible: Global.logic().isDebugEnv(),
            child: IconMsgDialog(
              message: resultData.errorMsg ?? '',
              buttonTitle: Strings.ok,
              needCloseIcon: false,
              buttonAction: () {},
            ),
          );
        });
      }
    } else if (resultData.code == 400 && resultData.errorCode == 10010) {
      setFlower(false);
    } else {
      // List<dynamic> abTest = resultData.data['abTest'] ?? [];
      // List<AbTestModel> abTestModels = abTest.map((e) => AbTestModel.fromJson(e)).toList();
      // Global.userLogic().handleAbTestVariant(abTestModels, fromLogin: false);
    }
  }

  //订单相关
  Future<NetResultData> getOrderList(int status, int type, int page) async {
    return netRequest.getRequest('${hostStr()}/order/sort/status',
        {
          'status': status.toString(),
          'type': type,
          'page': page.toString(),
        });
  }

  Future<NetResultData> createReadingOrder(Map<String, dynamic> params) async {
    return netRequest.postRequest('${hostStr()}/order/create', params);
  }

  Future<NetResultData> createOrder(Map<String, dynamic> params) async {
    return netRequest.postRequest('${hostStr()}/order/create', params);
  }

  Future<NetResultData> completeReadingOrder(String orderId) async {
    return netRequest
        .postRequest('${hostStr()}/order/finish', {'orderId': orderId});
  }

  Future<OrderInfoModel?> getOrderDetail(String orderId) async {
    NetResultData resultData = await netRequest
        .getRequest('${hostStr()}/order/one', {'orderId': orderId});
    if (resultData.result) {
      OrderInfoModel order = OrderInfoModel.fromJson(resultData.data);
      // DatabaseManager.instance.getOrderDao().update(order);
      return order;
    }
    return null;
  }

  Future<NetResultData> readOrder(String orderId) async {
    return netRequest
        .postRequest('${hostStr()}/order/read', {'orderId': orderId});
  }

  Future<NetResultData> commentOrder(String orderId, double rate, String text,
      {double? accuracy}) async {
    Map<String, dynamic> params = {'orderId': orderId, 'rate': rate.toInt(), 'txt': text};
    if (accuracy != null) {
      params['accuracy'] = accuracy.toString();
    }
    return netRequest.postRequest('${hostStr()}/order/comment', params);
  }

  Future<NetResultData> rewardOrder(String orderId, int credits) async {
    return netRequest.postRequest(
        '${hostStr()}/order/reward', {'orderId': orderId, 'credits': credits});
  }

  Future<NetResultData> cancelOrder(String orderId) async {
    return netRequest
        .postRequest('${hostStr()}/order/cancel', {'orderId': orderId});
  }

  Future<NetResultData> orderTimeout(String orderId) async {
    return netRequest
        .postRequest('${hostStr()}/order/timeout', {'orderId': orderId});
  }

  Future<NetResultData> orderTickPay(String orderId, int credits) async {
    return netRequest.postRequest(
        '${hostStr()}/order/tick', {'orderId': orderId, 'credits': credits});
  }

  Future<NetResultData> rushOrder(String orderId) async {
    return netRequest
        .postRequest('${hostStr()}/order/rush', {'orderId': orderId});
  }

  Future<NetResultData> getAgoraToken() async {
    return netRequest.getRequest('${hostStr()}/ag/signaling/key', null);
  }

  Future<NetResultData> makeAgoraCall(String mateId) async {
    return netRequest
        .getRequest('${hostStr()}/ag/channel/key', {"mateId": mateId});
  }

  ///购买
  ///ios response
  ///{"data":{"user":{"id":41,"userId":"6b74bd01-40b7-4b0b-88aa-5d3d3b661dbc","name":"Alice Guo","bio":"Thanks","about":"Thanks","interestTags":null,"avatar":"https://answerplanet.s3.amazonaws.com/upload/6b74bd01-40b7-4b0b-88aa-5d3d3b661dbc/objects/1597745723897_6b74bd01-40b7-4b0b-88aa-5d3d3b661dbc.jpg","gender":1,"birthday":"8-14-2010","email":"","platform":"ios","appVersion":"","identify":"user","isAdmin":false,"loginType":"facebook","loginId":"299440451324801","coin":0,"totalCost":0,"orderCount":3,"followerCount":0,"followingCount":1,"inviteCode":"","level":0,"assistantId":"","adChannel":""},"purchase":[{"msg":"target iap is not in purchase list","trans_id":"1000000710246909","isVaild":false}]},"meta":{"code":200}}
  ///android response
  ///{"data":{"user":{"id":15,"userId":"6635a620-f72f-48c9-b0ae-40b4b18d1e0e","name":"po","bio":"","about":"","interestTags":null,"avatar":"https://answerplanet.s3.amazonaws.com/upload/6635a620-f72f-48c9-b0ae-40b4b18d1e0e/objects/1597402473348_6635a620-f72f-48c9-b0ae-40b4b18d1e0e.jpg","gender":1,"birthday":"8-3-1999","email":"","platform":"android","appVersion":"","identify":"user","isAdmin":false,"loginType":"debugLogin","loginId":"po","coin":400,"totalCost":39.94,"orderCount":1,"followerCount":0,"followingCount":1,"inviteCode":"","level":0,"assistantId":"","adChannel":""},"purchase":{"orderId":"GPA.3368-5005-3219-45164"}},"meta":{"code":200}}
  Future<NetResultData> purchaseCoins(String receipt, String productId) async {
    syncUserInfo();
    return netRequest.postRequest('${hostStr()}/deal/purchase',
        {'receipt': receipt, 'productId': productId});
  }


  ///返回数据{'asset':'','url':''}
  ///用url上传数据，上传成功后用asset拉取数据
  Future<NetResultData> getUploadFileUrl(String extension) async {
    return netRequest
        .postRequest('${hostStr()}/media/url', {'media_extension': extension});
  }

  Future<NetResultData> messageRegister(String token) async {
    return netRequest
        .postRequest('${hostStr()}/message/register', {'token': token});
  }

  Future<NetResultData> messageUnregister() async {
    return netRequest.postRequest('${hostStr()}/message/unregister', null);
  }

  //查询上一个订单的General Situation 和 Specific Question
  Future<NetResultData> getLastestOrderDescribe() async {
    return netRequest.getRequest('${hostStr()}/user/latest/order', null);
  }

  //用户回复神婆追问
  Future<NetResultData> replyAdditionanlQuiz(
      String orderId, String reply) async {
    return netRequest.postRequest(
        '${hostStr()}/order/user/reply', {'orderId': orderId, 'reply': reply});
  }

  /// 发送push
  /// 可选参数：target、targetIdentify、title、message、image、action、sound、iosLimitVersion、androidLimitVersion
  /// 接收方没有fcmToken的话会报参数错误
  // Future<NetResultData> messagePush(
  //     String message, PushActionModel model) async {
  //   Map param = {
  //     "message": message,
  //     "action": jsonEncode(model.toJson()).toString(),
  //     "target": model.receiverId,
  //     "targetIdentify": model.receiverIdentify,
  //   };
  //   if (model.senderAvatar.isNotEmpty) {
  //     param["image"] = model.senderAvatar;
  //   }
  //   if (model.sound.isNotEmpty) {
  //     param["sound"] = model.sound;
  //   }
  //   return netRequest.postRequest('${hostStr()}/message/push', param);
  // }

  // Future<List<StarTagsModel>> getAllTags() async {
  //   NetResultData resultData =
  //       await netRequest.getRequest('${hostStr()}/star/tags', null);
  //   if (resultData.result) {
  //     return (resultData.data as List).map((e) {
  //       return StarTagsModel.fromJson(e);
  //     }).toList();
  //   }
  //   return [];
  // }

  //获取推荐的神婆列
  Future<List<UserInfoModel>> getRecommendAdvisorList() async {
    NetResultData resultData =
        await netRequest.getRequest('${hostStr()}/user/recommend/stars', null);
    if (resultData.result) {
      return (resultData.data as List).map((e) {
        return UserInfoModel.fromJson(e);
      }).toList();
    }
    return [];
  }

  // Future<NetResultData> consumeUserAward(String awardId) async {
  //   Map param = {
  //     "awardId": awardId,
  //   };
  //   var result = await netRequest.postRequest('${hostStr()}/user/award', param);
  //   if (result.result) {
  //     RewardModel reward = RewardModel.fromJson(result.data);
  //     result.data = reward;
  //     Global.userLogic().addCoin(reward.count);
  //     Global.userLogic().state.user.awards.removeWhere((element) {
  //       return element.awardId == awardId;
  //     });
  //     apiManager.getMyInfo();
  //   }
  //   return result;
  // }

  Future<NetResultData> inputInviteCode(String code) async {
    Map<String, dynamic> param = {
      "code": code,
    };
    NetResultData resultData = await netRequest.postRequest('${hostStr()}/user/invite/code', param);
    if (resultData.result) {
      await getMyInfo();
    }
    return resultData;
  }

  // Future<List<InviteRecordModel>> inviteRecords(int page, int countPerPage) async {
  //   NetResultData resultData = await netRequest.getRequest('${hostStr()}/user/invite/records', {
  //     'countPerPage': countPerPage,
  //     'page': page,
  //   });
  //   if (resultData.result) {
  //     List items = resultData.data['rows'];
  //     return items.map((e) {
  //       InviteRecordModel element = InviteRecordModel.fromJson(e);
  //       if (element.awardCount == 0) {
  //         element.awardCount = int.parse(BossManager.instance.bossConfig?.appInfoConfig?.inviteReward ?? '0');
  //       }
  //       return element;
  //     }).toList();
  //   } else {
  //     return null;
  //   }
  // }

  Future<List<UserInfoModel>?> searchStars(
      String key, int page, int countPerPage) async {
    Map<String, String> param = {
      'key': key,
      'page': page.toString(),
      'countPerPage': countPerPage.toString(),
    };

    NetResultData resultData =
        await netRequest.getRequest('${hostStr()}/search/stars', param);
    // print(resultData);
    if (resultData.result) {
      List items = resultData.data['rows'];
      return items.map((e) => UserInfoModel.fromJson(e)).toList();
    } else {
      return null;
    }
  }

  Future<List<UserInfoModel>?> getCategoryStars(
      String category, int page, int countPerPage) async {
    Map<String, String> param = {
      'category': category,
      'page': page.toString(),
      'countPerPage': countPerPage.toString(),
    };

    NetResultData resultData =
    await netRequest.postRequest('${hostStr()}/search/stars', param);
    if (resultData.result) {
      List items = resultData.data['rows'];
      print('categoryStarsLength: ${items.length}');
      return items.map((e) => UserInfoModel.fromJson(e)).toList();
    } else {
      return null;
    }
  }

  Future<NetResultData> userNotification(String starId, int type) async {
    Map<String, dynamic> param = {
      'starId': starId,
      'type': type.toString(),
    };
    var resultData =
        await netRequest.postRequest('${hostStr()}/user/notification', param);
    return resultData;
  }

  Future<NetResultData> appEvent(String name, Map<String, String>? info) async {
    if (name.isEmpty || !Global.userLogic().hasLogin()) return Future.value(null);
    Map<String, dynamic> param = {
      'eventType': name,
      'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
      'eventInfo': info ?? {}
    };
    return netRequest.postRequest('${hostStr()}/app/event', param);
  }

  /// 塔罗牌付费
  /// useTicket为true的时候，price传0，使用免费次数，免费次数不足，报免费次数不足
  Future<NetResultData> unlockTarot(int price, bool useTicket, TarotType type) async {
    Map<String, dynamic> param = {
      'price': price,
      'type': type.index,
      'useTicket': useTicket
    };
    return netRequest.postRequest('${hostStr()}/tarot/unlock', param);
  }

  Future<NetResultData> emailValidate(String email) async {
    Map<String, dynamic> params = {
      'address' : email
    };
    return netRequest.postRequest('${hostStr()}/email/validate', params);
  }

  Future<NetResultData> emailBind(String email, String code) {
    Map<String, dynamic> params = {
      'address': email,
      'code': code,
    };
    return netRequest.postRequest('${hostStr()}/email/bind', params);
  }

  Future<NetResultData> emailUnBind() {
    return netRequest.postRequest('${hostStr()}/email/unbind', {});
  }

  Future<NetResultData> onlineStars(String excludeId) {
    Map<String, dynamic> params = {
      'excludeId' : excludeId,
    };
    return netRequest.getRequest('${hostStr()}/online/stars', params);
  }

  Future<NetResultData> premiumServices(int page, {int countPerPage = 20}) {
    Map<String, dynamic> params = {
      'page' : page,
      'countPerPage': countPerPage
    };
    return netRequest.getRequest('${hostStr()}/premium/services', params);
  }

  Future<NetResultData> orderSearch(String key, int page) async {
    return netRequest.getRequest('${hostStr()}/order/search',
        {'k': key, 'page': page, 'countPerPage': 10});
  }

  Future<NetResultData> premiumServiceSearch(String key, int page) async {
    return netRequest.getRequest('${hostStr()}/search/premium/services',
        {'k': key, 'page': page, 'countPerPage': 10});
  }

  /// 返回结果中isGuestDevice字段，true表示单纯游客设备，false表示有非游客账号登录过
  Future<NetResultData> deviceCheck() async {
    Map<String, dynamic> params = {
      'deviceId' : Global.logic().state.uuid,
    };
    return netRequest.postRequest('${hostStr()}/user/device', params);
  }
}
