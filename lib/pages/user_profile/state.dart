
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/usermodel.dart';

class UserProfileState {
  late User user;

  final avatarGID = "avatarGID";
  final genderGID = "genderGID";


  final picker = ImagePicker();
  late File imgPath;

  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
}