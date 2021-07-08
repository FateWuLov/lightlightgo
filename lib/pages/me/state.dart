import 'package:get/get.dart';
import 'package:lifeaste/logic/global.dart';
import 'package:lifeaste/models/userModel.dart';

class MeState {
  Rx<UserInfoModel> userInfo = (Global.userLogic().state.user).obs;

  RxBool showLimitOfferBanner = false.obs;

  bool hasLoggedBannerShow = false;

  MeState() {
    ///Initialize variables
  }
}
