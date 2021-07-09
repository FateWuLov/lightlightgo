import 'dart:ui';

import 'package:get/get.dart';
import 'package:lifeaste/common/common.dart';
import 'package:lifeaste/models/orderModel.dart';
import 'package:lifeaste/pages/create_order/state.dart';
import 'package:lifeaste/pages/create_order/view.dart';
import 'package:lifeaste/pages/user_profile/state.dart';

import '../../routeConfig.dart';
import 'state.dart';

class OrderDetailLogic extends GetxController {
  final state = OrderDetailState();

  void onBack() {
    Get.back();
  }

  void onAsk() {
    ServiceInfoModel service = ServiceInfoModel.fromJson({});
    service.type = ServiceType.serviceTypeText.index;
    showNormalDialog(
        arguments: CreateOrderPageArgs(state.starInfo, service),
        child: CreateOrderPage());
  }

  void onClickStar() {
    Get.toNamed(
      RouteConfig.user,
      arguments: UserPageArgs(state.starInfo),
    );
  }
}
