import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/advisormodel.dart';
import '../models/usermodel.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TestPageState();
  }
}

class TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    Dio dio = Dio();
    // TODO: implement build
    return Material(
      child: FutureBuilder(
          future: dio.get(
              "https://c5qyslgwde.execute-api.us-east-1.amazonaws.com/prod/advisor-detail?advisor_id=100001",
              //"https://c5qyslgwde.execute-api.us-east-1.amazonaws.com/prod/me",
              //"https://c5qyslgwde.execute-api.us-east-1.amazonaws.com/prod/advisor-list"
          ),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            //请求完成
            if (snapshot.connectionState == ConnectionState.done) {
              //Response response = snapshot.data;
              //发生错误
              print(snapshot.data.toString());
               return Center(child: Text(snapshot.data.toString()),);
              /*if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()),);
              }
              else {
                var response = snapshot.data;
                var jsonResponse = json.decode(response.toString());
                Advisor advisor = Advisor.fromJson(jsonResponse);
                //请求成功，通过项目信息构建用于显示项目名称的ListView
                return Center(
                  child: ListView(
                    children: [
                      Text(advisor.name),
                      Text(advisor.introduction),
                      Text(advisor.avatar),
                      Text(advisor.services[0].desc as String)
                    ],
                  ),
                );
              }*/
            }
            //请求未完成时弹出loading
            return CircularProgressIndicator();
          }),
    );
  }
}
