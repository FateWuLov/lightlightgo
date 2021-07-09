import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lifeaste/common/common.dart';
import 'package:lifeaste/logic/global.dart';
import 'package:lifeaste/manager/net/apiManager.dart';
import 'package:lifeaste/manager/net/networkResultData.dart';
import 'package:lifeaste/models/orderModel.dart';
import 'package:lifeaste/models/userModel.dart';
import 'package:lifeaste/pages/order_list/logic.dart';
import 'package:lifeaste/pages/order_success/state.dart';
import 'package:lifeaste/pages/order_success/view.dart';

import 'state.dart';

class CreateOrderLogic extends GetxController {
  final state = CreateOrderState();

  void onLeave() {
    Get.back();
  }

  void onTapBg() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void onQuestionChange(String text) {
    state.canSubmit.value = state.questionEditController.text.isNotEmpty;
  }

  void onSubmit() async {
    if (state.questionEditController.text.isEmpty) {
      showTipsToast(Strings.inputQuestionTips);
      return;
    }
    FocusManager.instance.primaryFocus?.unfocus();
    Map<String, dynamic> params = {
      'starId': state.star.userId,
      'type': state.service.type,
      'price': state.service.price,
      'availableHours': state.service.availableHours.toInt(),
      'isRealTime': false,
      'bossName': Global.userLogic().state.user.name,
      'birthday': stringFromDate(DateTime(1991, 1, 1)),
      'gender': Global.userLogic().state.user.gender,
      'situation': 'test situation ${DateTime.now().toString()}',
      'question': state.questionEditController.text,
      'rush': false,
      'attachedPictureUrl': ''
    };
    showLoadingToast();
    NetResultData resultData = await apiManager.createReadingOrder(params);
    if (resultData.result) {
      //更新个人信息
      UserInfoModel userInfoModel = UserInfoModel.fromJson(resultData.data['user']);
      Global.userLogic().updateLocalUserInfo(userInfoModel);
      cleanAllToast();
      Get.back();

      OrderInfoModel resultOrder = OrderInfoModel.fromJson(resultData.data['order']);
      showNormalDialog(
        arguments: OrderSuccessPageArgs(resultOrder),
        child: OrderSuccessPage()
      );

      Get.find<OrderListLogic>().headerRefresh();

    } else {
      showHttpErrorToast(resultData);
    }
  }
}
