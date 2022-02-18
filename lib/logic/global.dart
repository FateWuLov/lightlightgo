import 'package:get/get.dart';
import 'package:lifeaste/logic/user/logic.dart';

import 'global/logic.dart';

class Global {
  static GlobalLogic logic() {
    if (Get.isRegistered<GlobalLogic>()) {
      return Get.find<GlobalLogic>();
    }
    return Get.put(GlobalLogic(), permanent: true);
  }

  static UserLogic userLogic() {
    if (Get.isRegistered<UserLogic>()) {
      return Get.find<UserLogic>();
    }
    return Get.put(UserLogic(), permanent: true);
  }
}