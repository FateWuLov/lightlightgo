import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/buy.dart';
import 'package:myapp/pages/edit.dart';
import 'package:myapp/pages/extension1.dart';
import 'package:myapp/pages/tabhelper.dart';
import 'package:myapp/pages/test.dart';
import 'package:myapp/pages/user.dart';
import 'common/dbutil.dart';
import 'models/advisormodel.dart';
import 'models/usermodel.dart';
import 'pages/advisor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBUtil.install();
  await DBUtil.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        "advisor": (context) => const FMAdvisorVC(),
        "user": (context) => const FMUserVC(),
        "edit": (context) => const FMEditVC(),
        "buy": (context) => const FMBuyVC(),
        "test": (context) => const TestPage(),
        "extension": (context) => const FMExtensionVC()
      },
      home: FutureBuilder(
          future: initBox(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Material(child: Center(
                  child: Text(snapshot.error.toString()),
                ),);
              } else {
                return const TabHelper();
              }
            }
            return const CircularProgressIndicator();
          }),
      /*MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      routes: {
        "/": (context) => const TabHelper(),
        "advisor": (context) => const FMAdvisorVC(),
        "user": (context) => const FMUserVC(),
        "edit": (context) => const FMEditVC(),
        "buy" : (context) => const FMBuyVC(),
        "test": (context) => const TestPage(),
        "extension": (context) => const FMExtensionVC()
      },
    )*/
    );
  }
}

initBox() async {
  if (DBUtil.instance.userBox.isNotEmpty) return;
  //instance.userBox.add(User("default","default","default",DateTime(1999,1,1),"default",'https://samantha2022.s3.amazonaws.com/1.png',[],[]));
  Dio dio = Dio();
  Response response = await dio
      .get('https://c5qyslgwde.execute-api.us-east-1.amazonaws.com/prod/me');
  //print("DBUtil -- initBox -- dio获取用户数据时返回： " + response.toString());
  Map<String, dynamic> jsonResponse = json.decode(response.toString());
  //print("DBUtil -- initBox -- jsonResponse赋值：" + jsonResponse.toString());
  User defaultUser = User.fromJson(jsonResponse);
  //print("DBUtil -- initBox -- dio获取用户数据解析后： ${defaultUser.name}");
  DBUtil.instance.userBox.add(defaultUser);

  for (int i = 1; i < 10; i++) {
    Response response = await dio.get(
        'https://c5qyslgwde.execute-api.us-east-1.amazonaws.com/prod/advisor-detail?advisor_id=10000$i');
    //print("----------------------------------------------------------");
    //print("DBUtil -- initBox -- dio获取顾问数据时返回： " + response.toString());
    Map<String, dynamic> jsonResponse = json.decode(response.toString());
    //print("DBUtil -- initBox -- jsonResponse赋值：" + jsonResponse.toString());
    Advisor advisor = Advisor.fromJson(jsonResponse);
    //print("DBUtil -- initBox -- dio获取顾问数据解析后： ${advisor.name}");
    await DBUtil.instance.advisorBox.add(advisor);
  }

  Response response1 = await dio.get(
      'https://c5qyslgwde.execute-api.us-east-1.amazonaws.com/prod/advisor-detail?advisor_id=100010');
  var jsonResponse1 = json.decode(response1.toString());
  Advisor advisor = Advisor.fromJson(jsonResponse1);
  await DBUtil.instance.advisorBox.add(advisor);
  print(DBUtil.instance.advisorBox.length);
}
