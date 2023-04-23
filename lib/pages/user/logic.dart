
import 'package:get/get.dart';
import 'package:lifeaste_lt/manager/hiveManager.dart';
import 'package:lifeaste_lt/pages/user/state.dart';

import '../../models/usermodel.dart';

class UserPageLogic extends GetxController {
  final state = UserPageState();

  @override
  void onInit() {
    // TODO: implement onInit
    state.user = HiveManager.instance.userBox?.getAt(0);
    update();
    super.onInit();
  }

  void updateUser (User user) {
    state.user = user;
    update();
  }
}