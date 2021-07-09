import 'package:get/get.dart';
import 'package:lifeaste/manager/net/apiManager.dart';
import 'package:lifeaste/manager/net/networkResultData.dart';
import 'package:lifeaste/models/orderModel.dart';
import 'package:lifeaste/pages/order_detail/state.dart';

import '../../routeConfig.dart';
import 'state.dart';

class OrderListLogic extends GetxController {
  final state = OrderListState();

  void onClickOrder(OrderInfoModel model) {
    Get.toNamed(
      RouteConfig.orderDetail,
      arguments: OrderDetailPageArgs(model),
    );
  }

  void headerRefresh() {
    state.refreshController.loadComplete();
    state.nextPage = 1;
    state.loadFinished = false;
    _loadData(true);
  }

  void _loadData(bool fromHeader) async {
    int countPerPage = 50;

    NetResultData resultData = await apiManager.getOrderList(
        page: state.nextPage, countPerPage: countPerPage);
    if (resultData.result) {
      state.loadFinished = true;
      List items = resultData.data['rows'];
      state.dataList = items.map((e) => OrderInfoModel.fromJson(e)).toList();
      update([state.dataListGID]);

      state.nextPage++;
      bool hasMore = items.length >= countPerPage;
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

  @override
  void onInit() {
    super.onInit();
    _loadData(true);
  }
}
