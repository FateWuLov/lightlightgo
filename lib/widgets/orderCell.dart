import 'package:flutter/material.dart';
import 'package:lifeaste/common/styles.dart';
import 'package:lifeaste/common/tools.dart';
import 'package:lifeaste/models/orderModel.dart';
import 'package:lifeaste/widgets/roundAvatar.dart';

import 'gestureContainer.dart';

class OrderCell extends StatelessWidget {
  final OrderInfoModel order;
  final VoidCallback? onTap;

  OrderCell(this.order, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 228,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: GlobalColors.lightTheme, blurRadius: 18, offset: Offset(0, 8))
          ]
      ),
      child: GestureContainer(
        onTap: onTap,
        child: Column(
          children: [
            Row(
              children: [
                RoundAvatar(74, order.starInfo.avatar),
                Text(order.starInfo.name, style: textStyleBold(16),),
              ],
            ),
            Text(order.question, style: textStyleBold(16),),
          ],
        ),
      ),
    );
  }
}