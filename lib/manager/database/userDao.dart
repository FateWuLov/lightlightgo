import 'dart:convert';

import 'package:lifeaste/models/userModel.dart';
import 'package:sqflite/sqflite.dart';

import 'databaseMagager.dart';

class UserDao {
  final String _table = DatabaseTable.user;

  final Database? _database;

  UserDao(this._database);

  Future<bool> insert(UserInfoModel model) async {
    if (_database?.isOpen != true) return Future.value(false);
    var result = await _database?.insert(_table, _toJson(model),
        conflictAlgorithm: ConflictAlgorithm.replace) ?? 0;
    return result > 0;
  }

  Future<bool> update(UserInfoModel model) async {
    if (_database?.isOpen != true) return Future.value(false);
    var oldModel = await query(model.userId);
    if (oldModel == null) {
      return await insert(model);
    } else {
      if (_database?.isOpen != true) return Future.value(false);
      var result = await _database?.update(_table, _toJson(model),
          where: 'userId = ?', whereArgs: [model.userId]) ?? 0;
      return result > 0;
    }
  }

  Future<bool> delete(String userId) async {
    if (_database?.isOpen != true) return Future.value(false);
    var result = await _database?.delete(_table, where: 'userId = ?', whereArgs: [userId]) ?? 0;
    return result > 0;
  }

  Future<UserInfoModel?> query(String userId) async {
    if (_database?.isOpen != true) return Future.value(null);
    var result = await _database?.query(_table, where: 'userId = ?', whereArgs: [userId]);
    if (result?.isEmpty != false) return null;
    dynamic obj = result?.first;
    return _fromJson(obj);
  }

  Map<String, dynamic> _toJson(UserInfoModel model) {
    var map = model.toJson();
    map['isAdmin'] = map['isAdmin'] ? 1 : 0;
    map['isBlockingHim'] = map['isBlockingHim'] ? 1 : 0;
    map['isBlockingMe'] = map['isBlockingMe'] ? 1 : 0;
    map['dailyBonus'] = map['dailyBonus'] ? 1 : 0;
    map['favorite'] = map['favorite'] ? 1 : 0;
    map['availableService'] = jsonEncode(map['availableService']);
    map['premiumServices'] = jsonEncode(map['premiumServices']);
    map['goodAtCategories'] = jsonEncode(map['goodAtCategories']);
    map['interestTags'] = jsonEncode(map['interestTags']);
    map['interestCategories'] = jsonEncode(map['interestCategories']);
    map['awards'] = jsonEncode(map['awards']?? []);
    map['avgDeliverTime'] = jsonEncode(map['avgDeliverTime']);
    map['quickReadingMode'] = jsonEncode(map['quickReadingMode']);
    //没有做数据库升级，暂时先不存储以下字段
    map.remove('level');
    map.remove('hot');
    map.remove('pearl');
    map.remove('email');
    return map;
  }

  UserInfoModel _fromJson(Map<String, dynamic> map) {
    var result = Map.of(map);
    result['isAdmin'] = map['isAdmin'] == 1;
    result['isBlockingHim'] = map['isBlockingHim'] == 1;
    result['isBlockingMe'] = map['isBlockingMe'] == 1;
    result['dailyBonus'] = map['dailyBonus'] == 1;
    result['favorite'] = map['favorite'] == 1;
    result['availableService'] = jsonDecode(map['availableService']);
    result['goodAtCategories'] = jsonDecode(map['goodAtCategories']);
    result['interestTags'] =  jsonDecode(map['interestTags']?? '[]');
    result['interestCategories'] =  jsonDecode(map['interestCategories']?? '[]');
    result['awards'] = map['awards'] ==  null? [] : jsonDecode(map['awards']);
    result['avgDeliverTime'] = map['avgDeliverTime'] != null ? jsonDecode(map['avgDeliverTime']) : [0, 0];
    result['quickReadingMode'] = map['quickReadingMode'] != null ? jsonDecode(map['quickReadingMode']) : [];
    result['premiumServices'] = map['premiumServices'] != null ? jsonDecode(map['premiumServices']) : [];
    return UserInfoModel.fromJson(result);
  }
}
