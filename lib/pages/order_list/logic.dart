import 'package:get/get.dart';
import 'package:lifeaste/manager/net/apiManager.dart';
import 'package:lifeaste/manager/net/networkResultData.dart';
import 'package:lifeaste/models/orderModel.dart';

import 'state.dart';

class OrderListLogic extends GetxController {
  final state = OrderListState();

  void onClickOrder(OrderInfoModel model) {

  }

  void _loadData() async {
    NetResultData resultData = await apiManager.getOrderList(OrderStatusAll, 1, 50);
    if (resultData.result) {
      state.loadFinished = true;
      List items = resultData.data['rows'];
      state.dataList = items.map((e) => OrderInfoModel.fromJson(e)).toList();
      update([state.dataListGID]);
    }
  }

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }
}
