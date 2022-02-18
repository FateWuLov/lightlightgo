import 'package:get/get.dart';
import 'package:lifeaste/pages/home/logic.dart';
import 'package:lifeaste/pages/me/logic.dart';
import 'package:lifeaste/pages/order_list/logic.dart';
import 'package:lifeaste/pages/star_list/logic.dart';

import 'state.dart';

const String RootPageNameHome = 'home';
const String RootPageNameLogin = 'login';
const String RootPageNameLaunchGuide = 'launchGuide';

class RootPageLogic extends GetxController {
  final state = RootPageState();

  void setPage(String name) {
    if (state.name.value == name) return;
    print('[LaunchApp] RootPageLogic setPage $name');
    String oldValue = state.name.value;
    state.name.value = name;
    if (oldValue == RootPageNameHome) {
      Get.delete<HomeLogic>();
      Get.delete<MeLogic>();
      Get.delete<OrderListLogic>();
      Get.delete<StarListLogic>();
    }
  }
}
