import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lifeaste_lt/pages/home/view.dart';
import 'package:lifeaste_lt/rootApp.dart';

import 'manager/hiveManager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  launchApp();
}

void launchApp() async {
  if (kDebugMode) {
    print('launch start');
  }
  // 先初始化hive，以便后续能读取本地记录
  await HiveManager.instance.commonInit();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  _showRootPage();
}

void _showRootPage() async {
  runApp(RootApp());
}


