import 'package:get/get.dart';
import 'package:lifeaste/models/userModel.dart';

class UserState {
  UserInfoModel user = UserInfoModel.fromJson({});

  RxBool completeGetMatch = false.obs;

  /// 首单优惠
  RxBool existFirstReadingOff = false.obs;

  /// 三分钟免费通话
  RxBool exist3MinFreeChat = false.obs;

  RxInt coins = 0.obs;

  UserState() {
    ///Initialize variables
    print('[GETX] UserState Initialize');
  }
}
