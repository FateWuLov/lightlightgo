import 'package:flutter/material.dart';
import 'package:lifeaste/common/size_config.dart';
import 'package:lifeaste/common/styles.dart';
import 'package:lifeaste/common/tools.dart';
import 'package:lifeaste/models/orderModel.dart';
import 'package:lifeaste/widgets/roundAvatar.dart';

import 'gestureContainer.dart';

class OrderCell extends StatelessWidget {
  final OrderInfoModel order;
  final VoidCallback? onTap;

  OrderCell(this.order, {this.onTap});

  ///下单用户进入详情页，将已回复状态，显示成complete
  int _seenOrderStatus() {
    int status = order.status;
    if(order.service.isPremium()) {
      return status;
    }
    if (status == OrderStatusHasReplied) {
      return OrderStatusCompleted;
    }
    return status;
  }

  String seenStatusTitle() {
    OrderInfoModel fadeModel = OrderInfoModel.fromJson({});
    fadeModel.status = _seenOrderStatus();
    return fadeModel.statusTitle();
  }

  Color seenStatusColor() {
    OrderInfoModel fadeModel = OrderInfoModel.fromJson({});
    fadeModel.status = _seenOrderStatus();
    return fadeModel.statusColor();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 170,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: getProportionateScreenWidth(335),
        child: Stack(
          children: [
            Positioned(
              top: 16,
              child: Container(
                height: 100,
                width: getProportionateScreenWidth(335),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: GlobalColors.subTheme,
                ),
              ),
            ),
            Positioned(
              top: 70,
              child: Container(
                height: 99,
                width: getProportionateScreenWidth(335),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: GlobalColors.darkThemeText,
                  boxShadow: [
                    BoxShadow(
                      color: GlobalColors.shadowColor,
                      blurRadius: 18,
                      offset: Offset(0, 8),
                    ),
                    BoxShadow(
                      color: GlobalColors.borderShadow,
                      blurRadius: 12,
                      offset: Offset(0, -6),
                    ),
                  ]
                ),
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(order.service.title(), style: textStyleNormal(16)),
                        Container(
                          width: 1,
                          height: 12,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          color: GlobalColors.themeLine,
                        ),
                        Text(
                          seenStatusTitle(),
                          style: textStyleBold(16)
                              .copyWith(color: seenStatusColor()),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text(
                      order.question,
                      style: textStyleNormal(14),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 12,
              right: 12,
              top: 0,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RoundAvatar(60, order.starInfo.avatar),
                        SizedBox(width: 7,),
                        Container(
                          margin: EdgeInsets.only(top: 7),
                          child: Text(
                            order.starInfo.name,
                            style: textStyleBold(18),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 7),
                      child: Text(stringFromTimestamp(order.createTime),
                          style: textStyleNormal(8).copyWith(color: GlobalColors.orderTimeColor)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}