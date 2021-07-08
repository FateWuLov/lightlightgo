import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lifeaste/common/error.dart';
import 'package:lifeaste/common/events.dart';
import 'package:lifeaste/common/fn_method_channel.dart';
import 'package:lifeaste/common/strings.dart';
import 'package:lifeaste/common/tools.dart';
import 'package:lifeaste/common/typicalKeys.dart';
import 'package:lifeaste/manager/analyticsManager.dart';
import 'package:lifeaste/manager/database/databaseMagager.dart';
import 'package:lifeaste/manager/hiveManager.dart';
import 'package:lifeaste/manager/net/apiManager.dart';
import 'package:lifeaste/manager/net/networkResultData.dart';
import 'package:lifeaste/models/loginParams.dart';
import 'package:lifeaste/models/userModel.dart';
import 'package:lifeaste/pages/root_page/logic.dart';
import 'package:lifeaste/widgets/dialog/normalDialog.dart';
import '../../routeConfig.dart';
import '../global.dart';
import 'state.dart';

class UserLogic extends GetxController {
  final state = UserState();

  void resetUser(UserInfoModel? user) {
    if (user != null) {
      state.user = user;
      state.completeGetMatch.value = user.interestTags.isNotEmpty;
      state.existFirstReadingOff.value = user.nrtOrderCount <= 0;
      state.exist3MinFreeChat.value = canFreeChat3min();
      state.coins.value = user.coin;

      if (user.awards.isNotEmpty && user.assistantId.isNotEmpty) {
        _handleAssistantMsg();
      }
      eventBus.fire(UserInfoChangedEvent());
    }
  }

  void addCoin(int count) {
    state.user.coin += count;
    resetUser(state.user);
  }

  void declineCoin(int count) {
    state.user.coin -= count;
    resetUser(state.user);
  }

  void updateCoin(int count) {
    state.user.coin = count;
    resetUser(state.user);
  }

  void didStartLiveTextCall() async {
    await setHasStartedLiveTextCall();
    state.exist3MinFreeChat.value = canFreeChat3min();
    eventBus.fire(StartLiveTextCallEvent());
  }

  initForLaunch() async {
    String xToken = HiveManager.instance.get(TypicalKeys.requestSessionKey) ?? '';
    String userStr = HiveManager.instance.get(TypicalKeys.userInfoKey) ?? '';
    print('initForLaunch xToken $xToken, userStr $userStr');
    if (userStr.isNotEmpty && xToken.isNotEmpty) {
      var userMap = json.decode(userStr);
      UserInfoModel userInfoModel = UserInfoModel.fromJson(userMap);
      await DatabaseManager.instance.initDb(userInfoModel.userId);
      resetUser(userInfoModel);
      print('initForLaunch resetUser done ${state.user}');
      _syncLocalInfoToService();
    }
  }

  /// 给登录后初始化用户用的
  initForNewLogin(UserInfoModel userInfoModel) async {
    await DatabaseManager.instance.initDb(userInfoModel.userId);
    updateLocalUserInfo(userInfoModel, newUser: true);
    _syncLocalInfoToService();
    // TarotManager.instance.config();
    Future.delayed(Duration(seconds: 1), () {
      _handleGreetImMsg();
    });
  }

  /// 新登录用户，直接更新
  /// 非登录更新，需要判断本地账号跟这个一致，null说明已退出登录，也不能更新
  bool updateLocalUserInfo(UserInfoModel userInfoModel, {bool newUser = false}) {
    if (newUser == true ||
        (hasLogin() && userInfoModel.userId == state.user.userId)) {
      resetUser(userInfoModel);
      String value = json.encode(userInfoModel.toJson());
      HiveManager.instance.set(TypicalKeys.userInfoKey, value);
      return true;
    } else {
      return false;
    }
  }

  bool hasLogin() {
    return state.user.userId.isNotEmpty;
  }

  Future<bool> guestLogin({bool checkBefore = true}) async {
    bool didLoginBefore = HiveManager.instance.get(UD_DID_LOGIN_BEFORE) ?? false;
    if (checkBefore && didLoginBefore) {
      print('[LaunchApp] didLoginBefore');
      return Future.value(false);
    }
    print('[LaunchApp] start guestLogin');
    String guestId = Global.logic().state.guestId;
    if (guestId.isNotEmpty) {
      if (Global.logic().state.launchFinished) {
        showLoadingToast();
      }
      LoginParams params = LoginParams.fromJson({});
      params.loginType = TypicalKeys.loginType_guest;
      params.loginId = guestId;
      LoginUserInfo userInfo = LoginUserInfo.fromJson({});
      userInfo.name = 'Guest_' + randomUsername();
      userInfo.avatar = getMatchAvatar();
      params.userInfo = userInfo;

      return _loginWithUserInfo(params);
    }
    print('[LaunchApp] guest login failed');
    return false;
  }

  void debugLogin(String loginId, bool debugLogin) async {
    if (loginId.isEmpty) {
      showTipsToast(Strings.notNull);
      return;
    }

    showLoadingToast();
    LoginParams params = LoginParams.fromJson({});
    params.loginType = TypicalKeys.loginType_debug;
    params.loginId = loginId;
    LoginUserInfo userInfo = LoginUserInfo.fromJson({});
    userInfo.name = randomUsername();
    userInfo.avatar = getMatchAvatar();
    params.userInfo = userInfo;
    await _loginWithUserInfo(params);
  }

  void appleIdLogin() async {
    if (Platform.isAndroid) {
      showTipsToast(Strings.appleFailed);
      return;
    }
    try {
      var result = await TypicalKeys.methodChannel
          .invokeMethod(methodNameAppleIdLoginStr);

      var loginId = result['loginId'];
      if (loginId == null || loginId.isEmpty) {
        showTipsToast(Strings.appleFailed);
        return;
      }

      showLoadingToast();
      LoginParams params = LoginParams.fromJson({});
      params.loginType = TypicalKeys.loginType_apple;
      params.loginId = loginId;
      String uuidKey = 'uuid';
      if (result != null && result.containsKey(uuidKey)) {
        params.uuid = result['uuid'] ?? '';
      }
      LoginUserInfo userInfo = LoginUserInfo.fromJson({});
      userInfo.name = randomUsername();
      userInfo.avatar = getMatchAvatar();
      String iCloudKey = 'iCloudAccount';
      if (result != null && result.containsKey(iCloudKey)) {
        userInfo.iCloudAccount = result[iCloudKey];
      }
      params.userInfo = userInfo;
      await _loginWithUserInfo(params);
    } on PlatformException catch (e) {
      print(e.toString());
      showTipsToast(Strings.appleFailed);
    }
  }

  void firebaseLogin() async {
    try {
      var result =
      await TypicalKeys.methodChannel.invokeMethod(methodNamePhoneLoginStr);

      var loginId = result['loginId'];
      if (loginId == null || loginId.isEmpty) {
        showTipsToast(Strings.phoneFailed);
      } else {
        LoginParams params = LoginParams.fromJson({});
        params.loginType = TypicalKeys.loginType_phone;
        params.loginId = loginId;
        String uuidKey = 'uuid';
        if (result != null && result.containsKey(uuidKey)) {
          params.uuid = result['uuid'] ?? '';
        }

        LoginUserInfo userInfo = LoginUserInfo.fromJson({});
        userInfo.name = randomUsername();
        userInfo.avatar = getMatchAvatar();
        String phoneKey = 'phone';
        if (result != null && result.containsKey(phoneKey)) {
          userInfo.phone = result[phoneKey];
        }
        params.userInfo = userInfo;
        showLoadingToast();
        await _loginWithUserInfo(params);
      }
    } on PlatformException catch (e) {
      showTipsToast(Strings.phoneFailed);
      print(e.message);
    }
  }

  void googleLogin() async {

    // Trigger the authentication flow
    // final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    // if (googleUser == null) return;
    //
    // showLoadingToast();
    // // Obtain the auth details from the request
    // final GoogleSignInAuthentication googleAuth =
    // await googleUser.authentication;
    //
    // // Create a new credential
    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth.accessToken,
    //   idToken: googleAuth.idToken,
    // );
    //
    // print('googleLogin start');
    // // Once signed in, return the UserCredential
    // UserCredential userCredential =
    // await FirebaseAuth.instance.signInWithCredential(credential);
    // print('googleLogin back');
    // String loginId = userCredential?.user?.uid;
    // print('googleLogin user ${userCredential?.user?.toString()}');
    // if (loginId == null || loginId.isEmpty) {
    //   showTipsToast(Strings.googleFailed);
    // } else {
    //   LoginParams params = LoginParams();
    //   params.loginType = TypicalKeys.loginType_google;
    //   params.loginId = loginId;
    //   params.userInfo = LoginUserInfo();
    //   params.userInfo.name = userCredential?.user?.displayName ?? randomUsername();
    //   params.userInfo.avatar = userCredential?.user?.photoURL ?? getMatchAvatar();
    //   String email = userCredential?.user?.email;
    //   if (email != null && email.isNotEmpty) {
    //     params.userInfo.googleEmail = email;
    //   }
    //   String phoneNumber = userCredential?.user?.phoneNumber;
    //   if (phoneNumber != null && phoneNumber.isNotEmpty) {
    //     params.userInfo.googlePhone = phoneNumber;
    //   }
    //   await _loginWithUserInfo(params);
    // }
  }

  Future<void> logout() async {
    showLoadingToast();
    // Global.pushLogic().unregister();
    HiveManager.instance.set(TypicalKeys.userInfoKey, '');
    HiveManager.instance.set(TypicalKeys.requestSessionKey, '');
    AnalyticsManager.instance.logInternalEvent(IEN_Logout);
    // xmppDisconnect();
    // Global.xmppLogic().updateConnect(false);

    await DatabaseManager.instance.closeDb();
    // MsgManager.getInstance().release();

    // Get.find<RootPageLogic>().setPage(RootPageNameLogin);
    // Get.until((route) => Get.currentRoute == RouteConfig.root);
    //
    // cleanAllToast();
    Get.delete<UserLogic>(force: true);
  }

  //绑定afChannel
  void bindAdChannelIfNeeded() {
    if (!hasLogin() ||
        state.user.adChannel.isNotEmpty) {
      return;
    }
    bool confirmed = _userChannelConfirmed();
    if (!confirmed) return;
    String channel = 'Organic';
    String status = getAfStatusFromPref();
    bool isNotEasyUser = status == AF_USER_CHANNEL_STATUS_NON_ORGANIC;
    if (isNotEasyUser) {
      channel = getAfChannelFromPref();
    }
    if (channel.isNotEmpty) {
      apiManager.updateMyInfo({'adChannel': channel});
    }
  }

  /// 可以三分钟免费聊天
  bool canFreeChat3min() {
    return hasLogin() &&
        !getHasStartedLiveTextCall() &&
        state.user.rtOrderCompleted <= 0;
  }

  ///没有人填过该用户邀请码，则每天弹出一次
  ///- 查看已完成订单详情，点击返回键时跳出
  ///- 通话完成时，关闭结束页时跳出
  bool showInviteDialogIfNeeded(String fromWhere) {
    // if (state.user.userId.isEmpty ||
    //     state.user.inviteCount > 0 ||
    //     !state.user.canShowInviteCode()) {
    //   return false;
    // }
    // String showKey = getPrefixKey(UD_showInviteDialogTime);
    // int time = HiveManager.instance.get(showKey) ?? 0;
    // // 一天一次
    // if (isSameDay(time, DateTime.now().millisecondsSinceEpoch)) {
    //   return false;
    // }
    // HiveManager.instance.set(showKey, DateTime.now().millisecondsSinceEpoch);
    // showNormalDialog(
    //   barrierDismissible: false,
    //   child: InviteFriendsDialog(fromWhere: fromWhere,),
    // );
    return true;
  }

  /// 当前是游客登录时，显示绑定账号弹窗
  void showBindSignInDialog() {
    // if (!state.user.isGuest()) return;
    // showNormalDialog(
    //   child: TwoBtnDialog(
    //     imageName: ImageNames.bindSignIn,
    //     message: Strings.bindSignInMessage,
    //     mainBtnTitle: Strings.linkAccount,
    //     subBtnTitle: Strings.maybeLater,
    //     mainAction: () async {
    //       AnalyticsManager.instance.logEvent(EventName_LogPopupLinkClick);
    //       Get.offNamed(RouteConfig.login, arguments: LoginPageArgs(forBinding: true));
    //     },
    //     subAction: () async {
    //       AnalyticsManager.instance.logEvent(EventName_LogPopupLaterClick);
    //       Get.back();
    //     },
    //   ),
    // );
  }

  Future<bool> _loginWithUserInfo(LoginParams params) async {
    NetResultData resultData;
    // 当前登录的是游客帐号时，执行绑定账号操作，否则执行登录操作
    if (Global.userLogic().hasLogin() && Global.userLogic().state.user.isGuest()) {
      resultData = await apiManager.bind(
        loginType: params.loginType ?? '',
        loginId: params.loginId ?? '',
        guestUserId: Global.userLogic().state.user.userId,
      );
    } else {
      resultData = await apiManager.loginV2(params);
    }

    // 绑定账号报错
    if (!resultData.result && resultData.errorCode == ERROR_CODE_USER_BIND_REPEAT) {
      cleanAllToast();
      // 提示绑定错误
      showNormalDialog(
        child: NormalDialog(
          content: Strings.bindAccountFailMsg,
          mainTitle: Strings.tryAgain,
          subTitle: Strings.contactUs,
          needCloseBtn: true,
          rightPrefer: true,
          mainAction: () async {
            AnalyticsManager.instance.logEvent(EventName_LinkFailTryClick);
          },
          subAction: () async {
            AnalyticsManager.instance.logEvent(EventName_LinkFailContactClick);
            // ConversationModel conversationModel = officialConversationModel();
            // Get.offNamed(RouteConfig.imChat, arguments: ImChatPageArgs(conversationModel));
          },
          closeAction: () {
            AnalyticsManager.instance.logEvent(EventName_LinkFailCloseClick);
            // 弹窗已经关闭，此处关闭登录页
            Get.back();
          },
        ),
      );
      return false;
    }

    if (resultData.result) {
      UserInfoModel userInfo = UserInfoModel.fromJson(resultData.data['userInfo']);
      print('[LaunchApp] guest login success');
      await Global.userLogic().initForNewLogin(userInfo);

      // List<dynamic> abTest = resultData.data['abTest'] ?? [];
      // List<AbTestModel> abTestModels = abTest.map((e) => AbTestModel.fromJson(e)).toList();
      // await Global.userLogic().handleAbTestVariant(abTestModels, fromLogin: true);
      //
      // PushState pushState = Global.pushLogic().state;
      // if (pushState.fcmToken.isNotEmpty) {
      //   apiManager.messageRegister(pushState.fcmToken.value);
      // }
      AnalyticsManager.instance.logEvent(
        EventName_LoginSuccess,
        parameters: {
          Param_Type: params.loginType ?? 'N/A',
        },
      );
      AnalyticsManager.instance.logAfEvent(AFLogin);
      Global.userLogic().bindAdChannelIfNeeded();
      if (userInfo.xmppPwd.isNotEmpty) {
        // xmppLogin();
      }
      HiveManager.instance.set(UD_DID_LOGIN_BEFORE, true);
    }
    // 若没有启动完成，不需要显示提示语，不需要切换页面
    if (Global.logic().state.launchFinished) {
      if (resultData.result) {
        cleanAllToast();
        Get.find<RootPageLogic>().setPage(RootPageNameHome);
        Get.until((route) => Get.currentRoute == RouteConfig.root);
      } else {
        showHttpErrorToast(resultData);
      }
    }
    return resultData.result;
  }

  void _syncLocalInfoToService() async {
    if (hasLogin()) {
      apiManager.syncUserInfo();
    }
  }

  void _handleGreetImMsg() {
    // if (state.user.isOfficialSupport()) return;
    // bool hasShown = hasShownGreetImMsg();
    // if (!hasShown) {
    //   //官号向新用户打招呼
    //   UserInfoModel officialModel = UserInfoModel.fromJson({});
    //   officialModel.userId = TypicalKeys.officialAccountUserId;
    //   officialModel.avatar = TypicalKeys.officialAccountAvatar;
    //   officialModel.name = TypicalKeys.officialAccountName;
    //   XMPPMessageModel message =
    //   xmppTextMessageFromUser(BossManager.instance.bossConfig.appInfoConfig.newerGreet, officialModel);
    //   message.easyMsg = true;
    //   message.didRead = false;
    //   message.showTime = true;
    //   xmppHandleReceiveNormalMsg(message);
    //   setShownGreetImMsg();
    // }
  }

  void _handleAssistantMsg() async {
    // if (state.user.isAssistantIdSupport()) return;
    // bool hasShown = hasShownAssistantImMsg();
    // if (!hasShown) {
    //   //小助手向用户打招呼
    //   XMPPMessageModel message = xmppTextMessageFromUser(
    //       Strings.assistentGreet.replaceAll("%s", state.user.name),
    //       assistantUserInfoModel());
    //   message.easyMsg = true;
    //   message.didRead = false;
    //   message.showTime = true;
    //   xmppHandleReceiveNormalMsg(message);
    //   setShownAssistantImMsg();
    // }
    //
    // //升级奖励才需要发小助手消息
    // for (RewardModel model in state.user.levelUpRewards()) {
    //   bool flag = await MsgManager.getInstance().isSendRewardMessage(model);
    //   if (!flag) {
    //     XMPPMessageModel message = xmppTextMessageFromUser(
    //         BossManager.instance.bossConfig.appInfoConfig.levelUpRewardGreet
    //             .replaceAll('%s', state.user.name),
    //         assistantUserInfoModel());
    //     message.easyMsg = true;
    //     message.didRead = false;
    //     message.showTime = (await MsgManager.getInstance()
    //         .isMessageNeedShowTime(message));
    //     message.orderId = "rewardId_" + model.awardId;
    //     await xmppHandleReceiveNormalMsg(message, needNewMsgEvent: true);
    //
    //     //发送网站提醒消息
    //     XMPPMessageModel websiteMessage = xmppTextMessageFromUser(Strings.moreSurprisesInWebsite, assistantUserInfoModel());
    //     websiteMessage.easyMsg = true;
    //     websiteMessage.didRead = false;
    //     websiteMessage.showTime = (await MsgManager.getInstance().isMessageNeedShowTime(websiteMessage));
    //     await xmppHandleReceiveNormalMsg(websiteMessage, needNewMsgEvent: true);
    //   }
    // }
  }

  //用户投放渠道确定
  bool _userChannelConfirmed() {
    String status = getAfStatusFromPref();
    return status == AF_USER_CHANNEL_STATUS_NON_ORGANIC || status == AF_USER_CHANNEL_STATUS_ORGANIC;
  }
}
