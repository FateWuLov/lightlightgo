import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

Future<String?> getHivePath(String filename) async {
  String dir = (await getApplicationDocumentsDirectory()).path;
  Directory directory = Directory('$dir/hive');
  try {
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
      if (!directory.existsSync()) {
        return null;
      }
    }
    return '${directory.path}$filename';
  } on Exception catch (e) {
    if (kDebugMode) {
      print('getChatImageFilePath Exception ${e.toString()}');
    }
    return null;
  }
}