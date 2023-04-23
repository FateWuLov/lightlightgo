import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifeaste_lt/routeConfig.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'common/info.dart';


RouteObserver<PageRoute> routeObserver = MyObserver();

class MyObserver extends RouteObserver<PageRoute> {

}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('[LaunchApp] RootApp build');
    }
    routeObserver = MyObserver();
    return RefreshConfiguration(
      headerBuilder: () => const ClassicHeader(
        refreshStyle: RefreshStyle.Follow,
      ),
      footerBuilder: () => const ClassicFooter(),
      headerTriggerDistance: 80,
      springDescription:
      const SpringDescription(stiffness: 170, damping: 16, mass: 1.9),
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
          if (kDebugMode) {
            print('[LaunchApp] RootApp GetMaterialApp onInit');
          }
        },
      ),
    );
  }
}