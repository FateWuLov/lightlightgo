
import 'package:get/get.dart';
import 'package:lifeaste_lt/manager/hiveManager.dart';
import 'package:lifeaste_lt/pages/order_list/state.dart';

class OrderListLogic extends GetxController {
  final state = OrderListState();

  @override
  void onInit() {
    // TODO: implement onInit
    state.list = HiveManager.instance.orderBox?.toMap().values.toList();
    update();
    super.onInit();
  }

  void orderCreated() {
    state.list = HiveManager.instance.orderBox?.toMap().values.toList();
    update();
  }
}