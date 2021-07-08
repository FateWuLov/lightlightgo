import 'package:get/get.dart';
import 'package:lifeaste/manager/net/apiManager.dart';
import 'package:lifeaste/manager/net/networkResultData.dart';
import 'package:lifeaste/models/userModel.dart';

import 'state.dart';

class StarListLogic extends GetxController {
  final state = StarListState();

  void onClickStar(UserInfoModel model) {

  }

  void onAskStar(UserInfoModel model) {

  }

  void _loadStars() async {
    var data = await apiManager.getStarListOfPage(1, 50);
    if (data != null) {
      state.dataList = data;
      update([state.dataListGID]);
    }
  }

  @override
  void onInit() {
    super.onInit();
    _loadStars();
  }
}
