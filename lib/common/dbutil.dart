/// ./lib/utils/db_util.dart
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/models/advisormodel.dart';
import 'package:myapp/models/ordermodel.dart';
import 'package:path_provider/path_provider.dart';

import '../models/usermodel.dart';

/// Hive 数据操作
class DBUtil{
  /// 实例
  static late DBUtil instance;

  ///
  late Box userBox;
  late Box advisorBox;
  late Box orderBox;

  /// 初始化，需要在 main.dart 调用
  /// <https://docs.hivedb.dev/>
  static Future<void> install() async {
    /// 初始化数据库地址
    Directory document = await getApplicationDocumentsDirectory();
    Hive.init(document.path);

    /// 注册自定义对象（实体）
    /// <https://docs.hivedb.dev/#/custom-objects/type_adapters>
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(AdvisorAdapter());
    Hive.registerAdapter(OrderAdapter());
  }

  /// 初始化 Box
  static Future<DBUtil> getInstance() async {
    instance = DBUtil();
    await Hive.initFlutter();
    instance.advisorBox = await Hive.openBox('advisorBox');
    instance.userBox = await Hive.openBox('userBox');
    instance.orderBox = await Hive.openBox('orderBox');
    initBox();
    return instance;
  }
  static initBox() {
    instance.userBox.add(User("default", "default bio", "default", DateTime(1999,1,1), "default about", "assets/3.0x/defaultAvatar.png", [], []));
    final advisorNames = [
      'Rose',
      'Emily',
      'Lindy',
      'Cindy',
      'Mike',
      'Carl',
      'Andy',
      'Paul',
      'Queen',
      'King'
    ];
    final advisorIntroduction = [
      'Rose introduction',
      'Emily introduction',
      'Lindy introduction',
      'Cindy introduction',
      'Mike introduction',
      'Carl introduction',
      'Andy introduction',
      'Paul introduction',
      'Queen introduction',
      'King introduction'
    ];
    final advisorAbout = [
      'Rose b',
      'Emily b',
      'Lindy b',
      'Cindy b',
      'Mike b',
      'Carl b',
      'Andy b',
      'Paul b',
      'Queen b',
      'King b'
    ];
    final advisorAvatar = [
      "assets/images/photo03.jpg",
      "assets/images/photo04.jpg",
      "assets/images/photo05.jpg",
      "assets/images/photo06.jpg",
      "assets/images/photo07.jpg",
      "assets/images/photo08.jpg",
      "assets/images/photo09.jpg",
      "assets/images/photo10.jpg",
      "assets/images/photo01.png",
      "assets/images/photo02.HEIC",
    ];
    int i = 0;
    while (i < advisorNames.length) {
      instance.advisorBox.add(Advisor(advisorNames[i], advisorIntroduction[i], advisorAbout[i], advisorAvatar[i], false, []));
      i++;
    }
  }
}