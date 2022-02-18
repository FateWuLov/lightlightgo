
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lifeaste/common/size_config.dart';
import 'package:lifeaste/models/userModel.dart';

class UserProfileState {

  UserInfoModel userInfo = UserInfoModel.fromJson({});
  String? fromPage;
  String? attachPicturePath;

  final double minChanged = 80;
  final double coverHeight = SizeConfig.topMargin + getProportionateScreenWidth(135);

  final rootGId = 'rootGId';
  final serviceListGId = 'serviceListGId';
  final favoriteIconGId = 'favoriteIconGId';

  UserProfileState() {
    var args = Get.arguments;
    if (args != null && args is UserPageArgs) {
      userInfo = args.userModel;
      attachPicturePath = args.attachPicturePath;
      fromPage = args.fromPage;
    }
  }
}

class UserPageArgs {
  UserPageArgs(this.userModel, {this.fromPage, this.attachPicturePath});

  final UserInfoModel userModel;
  final String? fromPage;
  final String? attachPicturePath;
}