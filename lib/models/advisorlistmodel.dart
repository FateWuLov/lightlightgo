import 'package:flutter/material.dart';

class AdvisorModel {
  static List<String> advisorNames = [
    'Rose',
    'Emily',
    'Lindy',
    'Cindy',
    'a',
    'b',
    'c',
    'd',
    'e',
    'f'
  ];

  Advisor getById(int id) => Advisor(id, advisorNames[id % advisorNames.length]);

  Advisor getByName(String name) {
    return getById(advisorNames.indexOf(name));
  }
}

class Advisor {
  final int id;
  final String name;
  final String introduction;
  final String about;
  final bool liked;

  Advisor(this.id, this.name, this.introduction, this.about, this.liked);

  @override
  // TODO: implement hashCode
  int get hashCode => id;

  @override
  bool operator == (Object other) => other is Advisor && other.id == id;
}