import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../common/file_path_util.dart';
import '../models/advisormodel.dart';
import '../models/ordermodel.dart';
import '../models/servicemodel.dart';
import '../models/usermodel.dart';

class HiveManager {
  static HiveManager get instance => _getInstance();
  static HiveManager? _instance;

  Box? userBox;
  Box? advisorBox;
  Box? orderBox;
  Box? serviceBox;
  List<Advisor>? advisorList;

  static HiveManager _getInstance(){
    var obj = _instance ?? HiveManager();
    _instance ??= obj;
    return obj;
  }

  Future<void> commonInit() async {

    DateTime startTime = DateTime.now();
    if (kDebugMode) {
      print('hive commonInit start');
    }

    String userBoxName = 'userBox';
    String advisorBoxName = 'advisorBox';
    String orderBoxName = 'orderBox';
    String serviceBoxName = 'serviceBox';

    String userBoxPath = await getHivePath(userBoxName) ?? '';
    String advisorBoxPath = await getHivePath(advisorBoxName) ?? '';
    String orderBoxPath = await getHivePath(orderBoxName) ?? '';
    String serviceBoxPath = await getHivePath(serviceBoxName) ?? '';

    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(AdvisorAdapter());
    Hive.registerAdapter(OrderAdapter());
    Hive.registerAdapter(ServiceModelAdapter());

    if (userBoxPath.isNotEmpty) {
      userBox = await Hive.openBox(userBoxName, path: userBoxPath);
    }
    if (advisorBoxPath.isNotEmpty) {
      advisorBox = await Hive.openBox(advisorBoxName, path: advisorBoxPath);
    }
    if (orderBoxPath.isNotEmpty) {
      orderBox = await Hive.openBox(orderBoxName, path: orderBoxPath);
    }
    if (serviceBoxPath.isNotEmpty) {
      serviceBox = await Hive.openBox(serviceBoxName, path: serviceBoxPath);
    }

    int duration = DateTime.now().millisecondsSinceEpoch - startTime.millisecondsSinceEpoch;
    if (kDebugMode) {
      print('hive commonInit ended ${Duration(milliseconds: duration).toString()}');
    }

    initBox();

    return Future.value(true);
  }

  initBox() async {
    if (instance.userBox == null) return;

    Dio dio = Dio();
    Response response = await dio
        .get('https://c5qyslgwde.execute-api.us-east-1.amazonaws.com/prod/me');
    //print("DBUtil -- initBox -- dio获取用户数据时返回： " + response.toString());
    Map<String, dynamic> jsonResponse = json.decode(response.toString());
    //print("DBUtil -- initBox -- jsonResponse赋值：" + jsonResponse.toString());
    User defaultUser = User.fromJson(jsonResponse);
    print("DBUtil -- initBox -- dio获取用户数据解析后： ${defaultUser.name}");
    instance.userBox?.add(defaultUser);

/*    for (int i = 1; i < 10; i++) {
      Response response = await dio.get(
          'https://c5qyslgwde.execute-api.us-east-1.amazonaws.com/prod/advisor-detail?advisor_id=10000$i');
      //print("----------------------------------------------------------");
      //print("DBUtil -- initBox -- dio获取顾问数据时返回： " + response.toString());
      Map<String, dynamic> jsonResponse = json.decode(response.toString());
      //print("DBUtil -- initBox -- jsonResponse赋值：" + jsonResponse.toString());
      Advisor advisor = Advisor.fromJson(jsonResponse);
      print("DBUtil -- initBox -- dio获取顾问数据解析后： ${advisor.name}");
      instance.advisorBox?.add(advisor);
      advisorList?.add(advisor);
    }

    Response response1 = await dio.get(
        'https://c5qyslgwde.execute-api.us-east-1.amazonaws.com/prod/advisor-detail?advisor_id=100010');
    var jsonResponse1 = json.decode(response1.toString());
    Advisor advisor = Advisor.fromJson(jsonResponse1);
    await instance.advisorBox?.add(advisor);
    advisorList?.add(advisor);
    print(instance.advisorBox?.length);
    print(advisorList?.length);*/
  }
}