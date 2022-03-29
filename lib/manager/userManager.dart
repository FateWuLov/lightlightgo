import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lifeaste/common/common.dart';
import 'package:lifeaste/common/events.dart';
import 'package:lifeaste/common/fn_method_channel.dart';
import 'package:lifeaste/manager/analyticsManager.dart';
import 'package:lifeaste/manager/globalManager.dart';
import 'package:lifeaste/models/loginParams.dart';
import 'package:lifeaste/models/userModel.dart';
import 'package:lifeaste/pages/root_page/logic.dart';

import '../routeConfig.dart';
import 'database/databaseMagager.dart';
import 'hiveManager.dart';
import 'net/net.dart';

class UserManager {

  UserInfoModel user = UserInfoModel.fromJson({});

  RxBool completeGetMatch = false.obs;

  /// 首单优惠
  RxBool existFirstReadingOff = false.obs;

  /// 三分钟免费通话
  RxBool exist3MinFreeChat = false.obs;

  RxInt coins = 0.obs;
  
  static UserManager get instance => _getInstance();
  static UserManager? _instance;
  UserManager._();
  
  static UserManager _getInstance() {
    var obj = _instance ?? UserManager._();
    if (_instance == null) {
      _instance = obj;
    }
    return obj;
  }

  void resetUser(UserInfoModel? user) {
    if (user != null) {
      this.user = user;
      completeGetMatch.value = user.interestTags.isNotEmpty;
      existFirstReadingOff.value = user.nrtOrderCount <= 0;
      exist3MinFreeChat.value = canFreeChat3min();
      coins.value = user.coin;
      eventBus.fire(UserInfoChangedEvent());
    }
  }

  void addCoin(int count) {
    user.coin += count;
    resetUser(user);
  }

  void declineCoin(int count) {
    user.coin -= count;
    resetUser(user);
  }

  void updateCoin(int count) {
    user.coin = count;
    resetUser(user);
  }

  void didStartLiveTextCall() async {
    await setHasStartedLiveTextCall();
    exist3MinFreeChat.value = canFreeChat3min();
    eventBus.fire(StartLiveTextCallEvent());
  }

  initForLaunch() async {
    String xToken = HiveManager.instance.get(Info.requestSessionKey) ?? '';
    String userStr = HiveManager.instance.get(Info.userInfoKey) ?? '';
    print('initForLaunch xToken $xToken, userStr $userStr');
    if (userStr.isNotEmpty && xToken.isNotEmpty) {
      var userMap = json.decode(userStr);
      UserInfoModel userInfoModel = UserInfoModel.fromJson(userMap);
      await DatabaseManager.instance.initDb(userInfoModel.userId);
      resetUser(userInfoModel);
      print('initForLaunch resetUser done $user');
      _syncLocalInfoToService();
    }
  }

  /// 给登录后初始化用户用的
  initForNewLogin(UserInfoModel userInfoModel) async {
    await DatabaseManager.instance.initDb(userInfoModel.userId);
    updateLocalUserInfo(userInfoModel, newUser: true);
    _syncLocalInfoToService();
  }

  /// 新登录用户，直接更新
  /// 非登录更新，需要判断本地账号跟这个一致，null说明已退出登录，也不能更新
  bool updateLocalUserInfo(UserInfoModel userInfoModel, {bool newUser = false}) {
    if (newUser == true ||
        (hasLogin() && userInfoModel.userId == user.userId)) {
      resetUser(userInfoModel);
      String value = json.encode(userInfoModel.toJson());
      HiveManager.instance.set(Info.userInfoKey, value);
      return true;
    } else {
      return false;
    }
  }

  bool hasLogin() {
    return user.userId.isNotEmpty;
  }

  Future<bool> guestLogin({bool checkBefore = true}) async {
    print('[LaunchApp] start guestLogin');
    String guestId = GlobalManager.instance.guestId;
    if (guestId.isNotEmpty) {
      if (GlobalManager.instance.launchFinished) {
        showLoadingToast();
      }
      LoginParams params = LoginParams.fromJson({});
      params.loginType = Info.loginType_guest;
      params.loginId = guestId;
      LoginUserInfo userInfo = LoginUserInfo.fromJson({});
      userInfo.name = randomUsername();
      userInfo.avatar = getMatchAvatar();
      params.userInfo = userInfo;

      return _loginWithUserInfo(params);
    }
    print('[LaunchApp] guest login failed');
    return false;
  }

  void debugLogin(String loginId, bool debugLogin) async {
    if (loginId.isEmpty) {
      return;
    }

    showLoadingToast();
    LoginParams params = LoginParams.fromJson({});
    params.loginType = Info.loginType_debug;
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
      var result = await Info.methodChannel
          .invokeMethod(methodNameAppleIdLoginStr);

      var loginId = result['loginId'];
      if (loginId == null || loginId.isEmpty) {
        showTipsToast(Strings.appleFailed);
        return;
      }

      showLoadingToast();
      LoginParams params = LoginParams.fromJson({});
      params.loginType = Info.loginType_apple;
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
      await Info.methodChannel.invokeMethod(methodNamePhoneLoginStr);

      var loginId = result['loginId'];
      if (loginId == null || loginId.isEmpty) {
        showTipsToast(Strings.phoneFailed);
      } else {
        LoginParams params = LoginParams.fromJson({});
        params.loginType = Info.loginType_phone;
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

  Future<void> logout() async {
    showLoadingToast();
    HiveManager.instance.set(Info.userInfoKey, '');
    HiveManager.instance.set(Info.requestSessionKey, '');

    await DatabaseManager.instance.closeDb();

    // Get.find<RootPageLogic>().setPage(RootPageNameLogin);
    // Get.until((route) => Get.currentRoute == RouteConfig.root);

    cleanAllToast();
  }

  //绑定afChannel
  void bindAdChannelIfNeeded() {
    if (!hasLogin() ||
        user.adChannel.isNotEmpty) {
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
        user.rtOrderCompleted <= 0;
  }

  Future<bool> _loginWithUserInfo(LoginParams params) async {
    // 测试时登录的账号，loginId增加test前缀，用于区分测试用户
    if (isDebug() ||
        GlobalManager.instance.isDebugEnv() ||
        params.loginType == Info.loginType_debug) {
      params.loginId = Info.loginIdTestPrefix + (params.loginId ?? '');
    }
    NetResultData resultData;
    // 当前登录的是游客帐号时，执行绑定账号操作，否则执行登录操作
    if (hasLogin() && user.isGuest()) {
      resultData = await apiManager.bind(
        loginType: params.loginType ?? '',
        loginId: params.loginId ?? '',
        guestUserId: user.userId,
      );
    } else {
      resultData = await apiManager.loginV2(params);
    }

    if (resultData.result) {
      UserInfoModel userInfo = UserInfoModel.fromJson(resultData.data['userInfo']);
      print('[LaunchApp] guest login success');
      await initForNewLogin(userInfo);

      AnalyticsManager.instance.logEvent(
        EventName_LoginSuccess,
        parameters: {
          Param_Type: params.loginType ?? 'N/A',
        },
      );
      AnalyticsManager.instance.logAfEvent(AFLogin);
      bindAdChannelIfNeeded();
      HiveManager.instance.set(UD_DID_LOGIN_BEFORE, true);
    }
    // 若没有启动完成，不需要显示提示语，不需要切换页面
    if (GlobalManager.instance.launchFinished) {
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

  //用户投放渠道确定
  bool _userChannelConfirmed() {
    String status = getAfStatusFromPref();
    return status == AF_USER_CHANNEL_STATUS_NON_ORGANIC || status == AF_USER_CHANNEL_STATUS_ORGANIC;
  }
}