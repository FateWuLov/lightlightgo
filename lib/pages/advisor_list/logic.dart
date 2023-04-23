import 'package:get/get.dart';
import 'package:lifeaste_lt/manager/apiManager.dart';
import 'package:lifeaste_lt/manager/userManager.dart';
import 'package:lifeaste_lt/pages/advisor_list/state.dart';

import '../../models/advisormodel.dart';
import '../../routeConfig.dart';

class AdvisorListLogic extends GetxController {
  final state = AdvisorListState();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    state.user = UserManager.user;
    _loadData();
  }

  void _loadData() async {
    int countPerPage = 10;
    var data = await apiManager.getAdvisorList(countPerPage);
    if (data != null) {
      state.advisorList = data;
      update([state.advisorListGID]);
    }
  }

  void updateLikedState(int index, bool liked) {
    if (state.advisorList[index].liked != liked) {
      state.advisorList[index].liked = liked;
      update([state.advisorListGID]);
    }
    if (liked) {
      if (state.user.likedList.contains(state.advisorList[index])) {

      } else {
        state.user.likedList.add(state.advisorList[index]);
      }
    } else {
      if (state.user.likedList.contains(state.advisorList[index])) {
        state.user.likedList.remove(state.advisorList[index]);
      }
    }
    state.user.save();
  }
  
  void jumpToAdvisorDetailPage(Advisor advisor) {
    Get.toNamed(RouteConfig.advisorDetail, arguments: { 'msg' : advisor});
  }

  void jumpToExtensionPage() {
    Get.toNamed(RouteConfig.extension);
  }
}