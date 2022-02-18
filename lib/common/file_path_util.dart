
import 'dart:io';
import 'dart:async';
import 'package:lifeaste/manager/userManager.dart';
import 'package:path_provider/path_provider.dart';

Future<File> getLocalStarListFilePath() async{
  String dir = (await getApplicationDocumentsDirectory()).path;
  return File('$dir/starList.json');
}

Future<File> getLocalRecommendFilePath() async{
  String dir = (await getApplicationDocumentsDirectory()).path;
  return File('$dir/${UserManager.instance.user.userId}_recommend_list.json');
}

Future<File> getRecordAudioFilePath() async {
  String dir = (await getApplicationDocumentsDirectory()).path;
  return File('$dir/recordAudio.mp3');
}

Future<String?> getChatImageFilePath(String name) async {
  String dir = (await getApplicationDocumentsDirectory()).path;
  Directory directory = Directory('$dir/chat/image');
  try {
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
      if (!directory.existsSync()) {
        return null;
      }
    }
    return directory.path + '$name';
  } on Exception catch (e) {
    print('getChatImageFilePath Exception ${e.toString()}');
    return null;
  }
}

Future<File> getDownloadFilePath(String filename) async {
  String dir = (await getApplicationDocumentsDirectory()).path;
  return File('$dir/$filename');
}

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
    return directory.path + '$filename';
  } on Exception catch (e) {
    print('getChatImageFilePath Exception ${e.toString()}');
    return null;
  }
}