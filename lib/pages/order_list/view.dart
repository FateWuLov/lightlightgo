import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifeaste/common/strings.dart';
import 'package:lifeaste/widgets/base/baseTabPage.dart';

import 'logic.dart';
import 'state.dart';

class OrderListPage extends StatelessWidget {
  final OrderListLogic logic = Get.put(OrderListLogic());
  final OrderListState state = Get.find<OrderListLogic>().state;

  @override
  Widget build(BuildContext context) {
    return BaseTabPage(
      title: Strings.order,
    );
  }
}
