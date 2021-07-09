import 'dart:ui';

import 'package:get/get.dart';
import 'package:lifeaste/common/common.dart';
import 'package:lifeaste/models/orderModel.dart';
import 'package:lifeaste/models/userModel.dart';

class OrderDetailState {
  OrderInfoModel order = OrderInfoModel.fromJson({});
  UserInfoModel starInfo = UserInfoModel.fromJson({});

  OrderDetailState() {
    ///Initialize variables
    var args = Get.arguments;
    if (args != null && args is OrderDetailPageArgs) {
      order = args.order;
    }
    starInfo = order.starInfo;
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

  String startTimeTitle() {
    if (order.service.isRealTime()) {
      return Strings.startTime;
    } else {
      return Strings.orderTime;
    }
  }

  String endTimeTitle() {
    if (order.service.isRealTime() || order.service.isPremium()) {
      return Strings.endTime;
    } else {
      int orderStatus = order.status;
      String string = Strings.dueTime;
      if (orderStatus == OrderStatusCompleted ||
          orderStatus == OrderStatusHasReplied) {
        string = Strings.deliveryTime;
      } else if (orderStatus == OrderStatusCancel ||
          orderStatus == OrderStatusExpired) {
        string = Strings.endTime;
      }
      return string;
    }
  }

  String endTimestampStr() {
    if (endTimeTitle() == Strings.deliveryTime) {
      int time = order.updateTime;
      if (!order.service.isRealTime() &&
          order.answer.timestamp > 0) {
        time = order.answer.timestamp;
      }
      return stringFromTimestamp(time);
    } else {
      int time = order.expireTime;
      if (time == 0 || order.service.isPremium()) {
        time = (order.createTime +
            order.service.availableHours * 3600 * 1000).toInt();
      }
      return stringFromTimestamp(time);
    }
  }

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

  bool hasReply() {
    if (order.service.isRealTime() ||
        order.service.type == ServiceType.serviceTypePremium.index) {
      return true;
    } else {
      if (order.service.type == ServiceType.serviceTypeText.index) {
        return order.answer.text.length > 0;
      } else {
        return order.answer.url.length > 0;
      }
    }
  }
}

class OrderDetailPageArgs {
  final OrderInfoModel order;

  OrderDetailPageArgs(this.order);
}