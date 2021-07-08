import 'package:get/get.dart';
import 'package:lifeaste/logic/user/logic.dart';

import 'global/logic.dart';

/// 定义需要持久化的logic
/// - 若logic未定义，直接使用Get.find时会异常，需要使用Get.put
/// - 若每次都使用Get.put的话，state会跟随put每次调用都初始化一遍
/// - 使用Get.lazyPut的话可以避免上面的问题，但是没有permanent参数
/// 所以统一定义做去重处理
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