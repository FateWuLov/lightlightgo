
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:get/get.dart';
import 'package:lifeaste/pages/root_page/logic.dart';
import 'package:lifeaste/routeConfig.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'common/info.dart';
import 'manager/globalManager.dart';

RouteObserver<PageRoute> routeObserver = MyObserver();

class MyObserver extends RouteObserver<PageRoute> {
  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
  }
}

class RootApp extends StatelessWidget {
  RootApp(this.page);
  final String page;

  @override
  Widget build(BuildContext context) {
    GlobalManager.instance.finishLaunching();
    print('[LaunchApp] RootApp build');
    Get.lazyPut(() => RootPageLogic());
    routeObserver = MyObserver();
    return RefreshConfiguration(
      headerBuilder: () => ClassicHeader(
        refreshStyle: RefreshStyle.Follow,
      ),
      footerBuilder: () => ClassicFooter(),
      headerTriggerDistance: 80,
      springDescription:
      SpringDescription(stiffness: 170, damping: 16, mass: 1.9),
      hideFooterWhenNotFull: true,
      enableBallisticLoad: false,
      child: GetMaterialApp(
        title: Info.appName,
        debugShowCheckedModeBanner: false,
        builder: BotToastInit(),
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: RouteConfig.root,
        getPages: RouteConfig.getPages,
        navigatorObservers: [routeObserver, BotToastNavigatorObserver()],
        onInit: () {
          Get.find<RootPageLogic>().setPage(page);
          print('[LaunchApp] RootApp GetMaterialApp onInit');
        },
      ),
    );
  }
}