/// ./lib/utils/db_util.dart
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/models/advisormodel.dart';
import 'package:myapp/models/ordermodel.dart';
import 'package:myapp/models/servicemodel.dart';
import 'package:path_provider/path_provider.dart';

import '../models/usermodel.dart';

/// Hive 数据操作
class DBUtil {
  /// 实例
  static late DBUtil instance;

  ///
  late Box userBox;
  late Box advisorBox;
  late Box orderBox;
  late Box serviceBox;

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
    Hive.registerAdapter(ServiceModelAdapter());
  }

  /// 初始化 Box
  static Future<DBUtil> getInstance() async {
    instance = DBUtil();
    await Hive.initFlutter();
    instance.advisorBox = await Hive.openBox('advisorBox');
    instance.userBox = await Hive.openBox('userBox');
    instance.orderBox = await Hive.openBox('orderBox');
    return instance;
  }
}
