import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lifeaste/pages/root_page/logic.dart';
import 'package:lifeaste/rootApp.dart';

import 'common/styles.dart';
import 'manager/analyticsManager.dart';
import 'manager/globalManager.dart';
import 'manager/hiveManager.dart';
import 'manager/net/apiManager.dart';
import 'manager/userManager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  launchApp();
}

void launchApp() async {
  print('launch start');
  // 先初始化hive，以便后续能读取本地记录
  await HiveManager.instance.commonInit();
  // 获取本地存储信息
  await GlobalManager.instance.loadNativeInfo();

  // 判断是否为开发环境
  if (GlobalManager.instance.isDebugEnv()) {
    showCatchError();
  }

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // 初始化本地用户信息
  await UserManager.instance.initForLaunch();

  _logLaunchEvent();
  _showRootPage();
}

void _showRootPage() async {
  if (!UserManager.instance.hasLogin()) {
    print('[LaunchApp] no login');
    // 未登录，先做游客登录逻辑，再进入app内
    bool result = await UserManager.instance.guestLogin();
    if (result) {
      AnalyticsManager.instance.logEvent(EventName_LaunchPage, parameters: {Param_Type: 'home'});
      runApp(RootApp(RootPageNameHome));
    } else {
      AnalyticsManager.instance.logEvent(EventName_LaunchPage, parameters: {Param_Type: 'login'});
      runApp(RootApp(RootPageNameLogin));
    }
  } else {
    print('[LaunchApp] did login');
    apiManager.getMyInfo();
    AnalyticsManager.instance.logEvent(EventName_LaunchPage, parameters: {Param_Type: 'home'});
    runApp(RootApp(RootPageNameHome));
  }
}

showCatchError() {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Text(
                    details.exception.toString(),
                    style: Styles.textStyle(12),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    details.stack.toString(),
                    style: Styles.textStyle(10),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  };
}

void _logLaunchEvent() {
  AnalyticsManager.instance.logEvent(EventName_LaunchApp);
  bool newLaunch = isNewLaunchApp();
  if (newLaunch) {
    print('----FirstLaunch----');
    AnalyticsManager.instance.logEvent(EventName_NewLaunchApp);
    setLoggedNewLaunchApp();
    //新安装，记录版本号
    setAppFirstLaunchVersion();
  }
}
