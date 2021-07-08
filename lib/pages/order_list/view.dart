import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifeaste/common/images.dart';
import 'package:lifeaste/common/strings.dart';
import 'package:lifeaste/models/orderModel.dart';
import 'package:lifeaste/widgets/base/baseTabPage.dart';
import 'package:lifeaste/widgets/loading.dart';
import 'package:lifeaste/widgets/orderCell.dart';

import 'logic.dart';
import 'state.dart';

class OrderListPage extends StatelessWidget {
  final OrderListLogic logic = Get.put(OrderListLogic());
  final OrderListState state = Get.find<OrderListLogic>().state;

  @override
  Widget build(BuildContext context) {
    return BaseTabPage(
      title: Strings.order,
      child: GetBuilder<OrderListLogic>(
        id: state.dataListGID,
        builder: (logic) {
          return _mainContent();
        },
      ),
    );
  }

  Widget _mainContent() {
    if (!state.loadFinished) {
      return Expanded(child: Center(
        child: LoadingView(),
      ));
    }
    if (state.dataList.isNotEmpty) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            if (index >= state.dataList.length) return Container();
            OrderInfoModel model = state.dataList[index];
            return OrderCell(
              model,
              onTap: () {
                logic.onClickOrder(model);
              },
            );
          },
          itemCount: state.dataList.length,
        ),
      );
    }
    return Expanded(child: Center(
      child: _emptyPlaceholder(),
    ));
  }

  Widget _emptyPlaceholder() {
    return Container(
      child: Image.asset(
        ImageNames.ordersIllustration
      ),
    );
  }
}
