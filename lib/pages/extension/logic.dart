
import 'package:get/get.dart';
import 'package:lifeaste_lt/manager/hiveManager.dart';
import 'package:lifeaste_lt/manager/userManager.dart';
import 'package:lifeaste_lt/pages/extension/state.dart';

import '../../models/advisormodel.dart';
import '../../routeConfig.dart';
import '../advisor_list/logic.dart';

class ExtensionPageLogic extends GetxController {
  final state = ExtensionPageState();
  final logic = Get.find<AdvisorListLogic>();

  @override
  void onInit() {
    // TODO: implement onInit
    state.advisorList = logic.state.advisorList;
    state.user = logic.state.user;
    super.onInit();
  }

  void jumpToAdvisorDetailPage(Advisor advisor) {
    Get.toNamed(RouteConfig.advisorDetail, arguments: { 'msg' : advisor});
  }

  void updateLikedList (Advisor advisor) {
    update([state.likedListGID]);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    state.user.save();
    super.onClose();
  }
}