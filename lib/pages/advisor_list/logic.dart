import 'package:get/get.dart';
import 'package:lifeaste_lt/manager/apiManager.dart';
import 'package:lifeaste_lt/pages/advisor_list/state.dart';

class AdvisorListLogic extends GetxController {
  final state = AdvisorListState();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _loadData();
  }

  void _loadData() async {
    int countPerPage = 50;
    var data = await apiManager.getAdvisorList(countPerPage);
    if (data != null) {
      state.advisorList = data;
      update([state.advisorListGID]);
      state.refreshController.refreshCompleted();
      state.refreshController.loadNoData();
    }
  }

  void headerRefresh() {
    state.refreshController.loadComplete();
    _loadData();
  }
}