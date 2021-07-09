
import 'package:get/get.dart';
import 'package:lifeaste/models/orderModel.dart';
import 'package:lifeaste/models/userModel.dart';

class CreateOrderState {
  UserInfoModel star = UserInfoModel.fromJson({});
  ServiceInfoModel service = ServiceInfoModel.fromJson({});

  CreateOrderState() {
    ///Initialize variables
    var args = Get.arguments;
    if (args != null && args is CreateOrderPageArgs) {
      star = args.star;
      service = args.service;
    }
  }
}

class CreateOrderPageArgs {
  final UserInfoModel star;
  final ServiceInfoModel service;

  CreateOrderPageArgs(this.star, this.service);
}