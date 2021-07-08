
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
    ///Initialize variables
  }
}

class UserPageArgs {
  UserPageArgs(this.userModel, {this.fromPage, this.attachPicturePath});

  final UserInfoModel userModel;
  final String? fromPage;
  final String? attachPicturePath;
}