import 'package:get/get.dart';
import 'package:lifeaste/manager/userManager.dart';
import 'package:lifeaste/models/userModel.dart';

class MeState {
  Rx<UserInfoModel> userInfo = (UserManager.instance.user).obs;

  RxBool showLimitOfferBanner = false.obs;

  bool hasLoggedBannerShow = false;

  MeState() {
    ///Initialize variables
  }
}
