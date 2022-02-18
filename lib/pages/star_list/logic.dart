import 'package:get/get.dart';
import 'package:lifeaste/common/common.dart';
import 'package:lifeaste/manager/net/apiManager.dart';
import 'package:lifeaste/manager/net/networkResultData.dart';
import 'package:lifeaste/models/orderModel.dart';
import 'package:lifeaste/models/userModel.dart';
import 'package:lifeaste/pages/create_order/state.dart';
import 'package:lifeaste/pages/create_order/view.dart';
import 'package:lifeaste/pages/user_profile/state.dart';
import 'package:lifeaste/routeConfig.dart';

import 'state.dart';

class StarListLogic extends GetxController {
  final state = StarListState();

  @override
  void onInit() {
    super.onInit();
    _loadData(true);
  }

  @override
  void onClose() {
    state.refreshController.dispose();
    super.onClose();
  }

  void onClickStar(UserInfoModel model) {
    Get.toNamed(
      RouteConfig.user,
      arguments: UserPageArgs(model),
    );
  }

  void onAskStar(UserInfoModel model) {
    ServiceInfoModel service = ServiceInfoModel.fromJson({});
    service.type = ServiceType.serviceTypeText.index;
    showNormalDialog(
        arguments: CreateOrderPageArgs(model, service),
        child: CreateOrderPage());
  }

  void headerRefresh() {
    state.refreshController.loadComplete();
    state.nextPage = 1;
    _loadData(true);
  }

  void _loadData(bool fromHeader) async {
    int countPerPage = 50;
    var data = await apiManager.getStarListOfPage(state.nextPage, countPerPage);
    if (data != null) {
      state.dataList = data;
      update([state.dataListGID]);
      state.nextPage++;
      bool hasMore = data.length >= countPerPage;
      if (!hasMore) {
        state.refreshController.refreshCompleted();
        state.refreshController.loadNoData();
      } else {
        if (fromHeader) {
          state.refreshController.refreshCompleted();
          state.refreshController.resetNoData();
        } else {
          state.refreshController.loadComplete();
        }
      }
    } else {
      if (fromHeader) {
        state.refreshController.refreshFailed();
      } else {
        state.refreshController.loadFailed();
      }
    }
  }
}
