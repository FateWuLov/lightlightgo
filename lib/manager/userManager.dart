
import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../models/usermodel.dart';
import 'hiveManager.dart';

class UserManager {

  static User user = HiveManager.instance.userBox?.getAt(0);

  static ImageProvider setAvatar (String path) {
    if (path.contains("http")) {
      return NetworkImage(path);
    }
    else {
      return FileImage(File(path));
    }
  }


}