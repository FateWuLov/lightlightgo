
import 'package:get/get.dart';

import '../advisor_list/logic.dart';
import 'state.dart';

class HomeLogic extends GetxController {
  final state = HomeState();

  @override
  void onInit() {
    super.onInit();
    Get.lazyPut(() => AdvisorListLogic());
  }

  void setPageCount(int count) {
    state.pageCount = count;
  }

  void changeIndex(int index) {
    if (index >= state.pageCount) {
      state.index.value = state.pageCount - 1;
    } else {
      state.index.value = index;
    }
  }
}