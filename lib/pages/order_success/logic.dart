import 'package:get/get.dart';
import 'package:lifeaste/pages/order_detail/state.dart';
import 'package:lifeaste/routeConfig.dart';

import 'state.dart';

class OrderSuccessLogic extends GetxController {
  final state = OrderSuccessState();

  void onLeave() {
    Get.back();
  }

  void onViewDetail() {
    Get.back();
    Get.toNamed(
      RouteConfig.orderDetail,
      arguments: OrderDetailPageArgs(state.order),
    );
  }
}
