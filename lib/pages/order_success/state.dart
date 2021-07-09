import 'package:get/get.dart';
import 'package:lifeaste/models/orderModel.dart';

class OrderSuccessState {
  OrderInfoModel order = OrderInfoModel.fromJson({});

  OrderSuccessState() {
    ///Initialize variables
    OrderSuccessPageArgs? args = Get.arguments;
    if (args != null) {
      order = args.order;
    }
  }
}

class OrderSuccessPageArgs {
  final OrderInfoModel order;

  OrderSuccessPageArgs(this.order);
}