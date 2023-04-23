import 'package:get/get.dart';
import 'package:lifeaste_lt/manager/hiveManager.dart';
import 'package:lifeaste_lt/pages/advisor_detail/state.dart';
import 'package:lifeaste_lt/pages/advisor_list/logic.dart';

import '../../models/advisormodel.dart';
import '../../models/usermodel.dart';
import '../../routeConfig.dart';
import '../extension/logic.dart';

class AdvisorDetailLogic extends GetxController {
  final state = AdvisorDetailState();
  final logic1 = Get.find<AdvisorListLogic>();
  final state1 = Get.find<AdvisorListLogic>().state;

  @override
  void onInit() {
    // TODO: implement onReady
    var map = Get.arguments;
    state.advisor = map['msg'];
    state.liked = state.advisor.liked;
    update();
    super.onInit();
  }

  void reverseLikedState() {
    state.liked = !state.liked;
    update();
    logic1.updateLikedState(state1.advisorList.indexOf(state.advisor), state.liked);
    try {
      final logic2 = Get.find<ExtensionPageLogic>();
      logic2.updateLikedList(state.advisor);
    } catch (e) {}
  }

  @override
  void onClose() {
    // TODO: implement onClose
    if (state.liked) {
      User user = HiveManager.instance.userBox?.getAt(0);
      if (!user.likedList.contains(state.advisor)){
        user.likedList.add(state.advisor);
      }
      user.save();
    }
    /*logic.updateLikedState(state1.advisorList.indexOf(state.advisor), state.liked);
    print("updateLiked state on index ${state1.advisorList.indexOf(state.advisor)} to be ${state.liked}");*/
    super.onClose();
  }

  void toCreateOrderPage(Advisor advisor) {
    Get.toNamed(RouteConfig.createOrder, arguments: { 'msg' : advisor });
  }
}