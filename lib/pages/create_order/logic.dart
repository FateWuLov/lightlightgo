
import 'package:get/get.dart';
import 'package:lifeaste_lt/manager/hiveManager.dart';
import 'package:lifeaste_lt/pages/create_order/state.dart';
import 'package:lifeaste_lt/pages/order_list/logic.dart';

import '../../models/ordermodel.dart';

class CreateOrderLogic extends GetxController {
  final state = CreateOrderState();
  final logic = Get.find<OrderListLogic>();

  @override
  void onInit() {
    // TODO: implement onInit
    var map = Get.arguments;
    state.advisor = map['msg'];
    state.user = HiveManager.instance.userBox?.getAt(0);
    update();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    state.myController1.dispose();
    state.myController2.dispose();
    super.onClose();
  }

  void createOrder() {
    Order order = Order(state.advisor, state.myController1.value.text, state.myController2.value.text);
    order.date = DateTime.now();
    HiveManager.instance.orderBox?.add(order);
    logic.orderCreated();
    Get.back();
  }
}