
import 'dart:convert';

import 'package:dio/dio.dart';

import '../common/strings.dart';
import '../models/advisormodel.dart';

final apiManager = ApiManager();

class ApiManager {

  Future<List<Advisor>?> getAdvisorList(int count) async {
    Dio dio = Dio();
    List<Advisor> list = [];
    if (count < 10) {
      int i = 1;
      while ( i < count ) {
        Response response = await dio.get("${Strings.advisorUrl}01");
        Map<String, dynamic> jsonResponse = json.decode(response.toString());
        Advisor advisor = Advisor.fromJson(jsonResponse);
        list.add(advisor);
        i++;
      }
    } else {
      int i = 1;
      while ( i < 10 ) {
        Response response = await dio.get("${Strings.advisorUrl}01");
        Map<String, dynamic> jsonResponse = json.decode(response.toString());
        Advisor advisor = Advisor.fromJson(jsonResponse);
        list.add(advisor);
        i++;
      }
      while ( i < count ) {
        Response response = await dio.get("${Strings.advisorUrl}01");
        Map<String, dynamic> jsonResponse = json.decode(response.toString());
        Advisor advisor = Advisor.fromJson(jsonResponse);
        list.add(advisor);
        i++;
      }
    }
    return list;
  }
}