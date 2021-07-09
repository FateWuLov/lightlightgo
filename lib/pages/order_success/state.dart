import 'package:get/get.dart';
import 'package:lifeaste/models/orderModel.dart';

class OrderSuccessState {
  OrderInfoModel order = OrderInfoModel.fromJson({});

  OrderSuccessState() {
    ///Initialize variables
    var args = Get.arguments;
    if (args != null && args is OrderSuccessPageArgs) {
      order = args.order;
    }
  }
}

class OrderSuccessPageArgs {
  final OrderInfoModel order;

  OrderSuccessPageArgs(this.order);
}