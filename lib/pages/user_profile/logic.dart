
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lifeaste_lt/manager/hiveManager.dart';
import 'package:lifeaste_lt/pages/user_profile/state.dart';

import '../user/logic.dart';

class UserProfileLogic extends GetxController {
  final state = UserProfileState();
  final logic = Get.find<UserPageLogic>();

  @override
  void onInit() {
    // TODO: implement onInit
    state.user = HiveManager.instance.userBox?.getAt(0);
    state.myController1.value = TextEditingValue(
        text: state.user.name,
        selection: TextSelection.fromPosition(TextPosition(
            affinity: TextAffinity.downstream,
            offset: state.user.name.length)));
    state.myController2.value = TextEditingValue(
        text: state.user.bio,
        selection: TextSelection.fromPosition(TextPosition(
            affinity: TextAffinity.downstream, offset: state.user.bio.length)));
    state.myController3.value = TextEditingValue(
        text: state.user.about,
        selection: TextSelection.fromPosition(TextPosition(
            affinity: TextAffinity.downstream,
            offset: state.user.about.length)));
    super.onInit();
  }

  Future updateAvatar() async {
    var pickedFile = await state.picker.pickImage(source: ImageSource.gallery);
    state.imgPath = File(pickedFile?.path as String);
    state.user.avatar = state.imgPath.path;
    update([state.avatarGID]);
    print("update avatar successfully : ${state.imgPath.path} ");
  }

  void setGender(String gender) {
    state.user.gender = gender;
    update([state.genderGID]);
  }

  void saveUser() {
    state.user.name = state.myController1.text;
    state.user.bio = state.myController2.text;
    state.user.about = state.myController3.text;
    logic.updateUser(state.user);
    state.user.save();
    Get.back();
  }
}