import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';
import 'package:lifeaste/common/colors.dart';
import 'package:lifeaste/common/strings.dart';
import 'package:lifeaste/common/tools.dart';
import 'package:lifeaste/common/typicalKeys.dart';
import 'package:lifeaste/logic/global.dart';
import 'package:lifeaste/manager/BossManager.dart';

import 'userModel.dart';

part 'orderModel.g.dart';

enum ServiceType {
  serviceTypeNone,
  serviceTypeText,
  serviceTypeAudio,
  serviceTypeVideo,
  serviceTypeTextCall,
  serviceTypeAudioCall,
  serviceTypeVideoCall,
  serviceTypePremium,
}

const int OrderStatusPending = 0;
const int OrderStatusExpired = 1;
const int OrderStatusCancel = 2;
const int OrderStatusHasReplied = 3;
const int OrderStatusCompleted = 4;
const int OrderStatusRejected = 5;
const int OrderStatusDraft = 10;
const int OrderStatusAll = 100;

// 0 未加急、1 正在加急、2 加急完成、-1 加急超时
const int RushStatusNone = 0;
const int RushStatusIng = 1;
const int RushStatusDone = 2;
const int RushStatusExpired = -1;

@JsonSerializable()
class OrderInfoModel {
  @JsonKey(defaultValue: '')
  String orderId;
  @JsonKey(fromJson: _userInfo)
  UserInfoModel userInfo;
  @JsonKey(fromJson: _starInfo)
  UserInfoModel starInfo;
  @JsonKey(defaultValue: OrderStatusPending)
  int status;
  @JsonKey(defaultValue: false)
  bool userUnread;
  @JsonKey(defaultValue: false)
  bool starUnread;
  @JsonKey(defaultValue: 0)
  int createTime;
  @JsonKey(defaultValue: 0)
  int expireTime;
  @JsonKey(defaultValue: 0)
  int updateTime;
  @JsonKey(defaultValue: '')
  String question;
  @JsonKey(defaultValue: '')
  String situation;
  @JsonKey(defaultValue: '')
  String attachedPictureUrl;

  @JsonKey(fromJson: defaultAnswerModel)
  AnswerModel answer;

  @JsonKey(fromJson: defaultServiceModel)
  ServiceInfoModel service;

  CommentModel? comment;

  /// true时，评论编辑页出现准确度选项，评论接口增加accuracy参数
  @JsonKey(defaultValue: false)
  bool needAccuracy;

  ///follow-up的截止时间，userModel里也有一样的字段，值是一样的
  @JsonKey(defaultValue: 0)
  int followUpDeadline;

  @JsonKey(fromJson: defaultDiscountModel)
  DiscountModel discount;

  ///加急订单状态
  @JsonKey(defaultValue: RushStatusNone)
  int rushStatus;

  ///订单rush截止回复时间，ms
  @JsonKey(defaultValue: 0)
  int rushExpiredAt;

  ///各种打折后价格+rush附加[rushCost]
  @JsonKey(defaultValue: 0)
  int orderPrice;

  OrderInfoModel(
    this.orderId,
    this.userInfo,
    this.starInfo,
    this.status,
    this.userUnread,
    this.starUnread,
    this.createTime,
    this.expireTime,
    this.updateTime,
    this.question,
    this.situation,
    this.attachedPictureUrl,
    this.answer,
    this.service,
    this.comment,
    this.needAccuracy,
    this.followUpDeadline,
    this.discount,
    this.rushStatus,
    this.rushExpiredAt,
    this.orderPrice,
  );

  factory OrderInfoModel.fromJson(Map<String, dynamic> json) =>
      _$OrderInfoModelFromJson(json);

  Map<String, dynamic> toJson() => fixToJson(_$OrderInfoModelToJson(this));

  bool hasAdditionQuiz() {
    return answer.aq.length > 0;
  }

  ///订单正在加速中
  bool inRushMode() {
    return status == OrderStatusPending &&
        !service.isRealTime() &&
        rushStatus == RushStatusIng;
  }

  ///该订单能否加急
  ///条件1：距离订单完成剩余时间超过1小时
  ///条件2：该神婆此时还支持本服务加急
  bool canRush() {
    return status == OrderStatusPending &&
        rushStatus == RushStatusNone &&
        expireTime - DateTime.now().millisecondsSinceEpoch >
            Duration(hours: 1).inMilliseconds;
  }

// 隐藏部分orderId 只显示前后6位  111111****1111111
  String hiddenOrderIdStr() {
    if (orderId.length <= 12) {
      return orderId;
    }
    String prefix = orderId.substring(0, 5);
    String suffix = orderId.substring(orderId.length - 6, orderId.length - 1);
    return prefix + "****" + suffix;
  }

  bool isGoToPremiumChatView() {
    // 增值服务只有pending  hasReplied  expire  finish
    return service.type == ServiceType.serviceTypePremium.index &&
        (status == OrderStatusPending || status == OrderStatusHasReplied);
  }

  String statusTitle() {
    switch (status) {
      case OrderStatusPending: return Strings.pending;
      case OrderStatusExpired: return Strings.expired;
      case OrderStatusCancel: return Strings.canceled;
      case OrderStatusHasReplied: return Strings.awaitingReceipt;
      case OrderStatusCompleted: return Strings.completed;
      case OrderStatusRejected: return Strings.declined;
      case OrderStatusDraft: return Strings.draft;
      default: {
        return '';
      }
    }
  }

  Color statusColor() {
    switch (status) {
      case OrderStatusPending: return GlobalColors.orderPending;
      case OrderStatusExpired: return GlobalColors.orderExpired;
      case OrderStatusCancel: return GlobalColors.orderCanceled;
      case OrderStatusHasReplied: return GlobalColors.orderAwaitingReceipt;
      case OrderStatusCompleted: return GlobalColors.orderCompleted;
      case OrderStatusRejected: return GlobalColors.orderDecline;
      case OrderStatusDraft: return GlobalColors.orderDraft;
      default: {
        return GlobalColors.orderCanceled;
      }
    }
  }
}

///老的订单数据里，userInfo字段和starInfo字段没有带上identify信息，序列化前补上
UserInfoModel _userInfo(var value) {
  if (value == null) {
    return UserInfoModel.fromJson({});
  }
  UserInfoModel model = UserInfoModel.fromJson(value);
  model.identify = TypicalKeys.roleIdentify_user;
  return model;
}

///老的订单数据里，userInfo字段和starInfo字段没有带上identify信息，序列化前补上
UserInfoModel _starInfo(var value) {
  if (value == null) {
    return UserInfoModel.fromJson({});
  }
  UserInfoModel model = UserInfoModel.fromJson(value);
  model.identify = TypicalKeys.roleIdentify_star;
  return model;
}

ServiceInfoModel serviceFromPremium(PremiumService model) {
  ServiceInfoModel service = ServiceInfoModel.fromJson({});
  service.type = ServiceType.serviceTypePremium.index;
  service.premiumService = model;
  service.price = model.price;
  service.availableHours = model.duration.toDouble();
  return service;
}

@JsonSerializable()
class ServiceInfoModel {
  @JsonKey(defaultValue: 0)
  int type;
  @JsonKey(defaultValue: 0)
  int price;
  @JsonKey(fromJson: fixAvailableHours)
  double availableHours;
  @JsonKey(defaultValue: false)
  bool canRush;
  @JsonKey(defaultValue: false)
  bool discountable;

  ///增值服务
  PremiumService? premiumService;

  ServiceInfoModel(
    this.type,
    this.price,
    this.availableHours,
    this.canRush,
    this.discountable,
    this.premiumService,
  );

  factory ServiceInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceInfoModelFromJson(json);

  Map<String, dynamic> toJson() => fixToJson(_$ServiceInfoModelToJson(this));

  String title() {
    switch (ServiceType.values[type]) {
      case ServiceType.serviceTypeText:
        {
          return Strings.textServiceTitle;
        }
      case ServiceType.serviceTypeAudio:
        {
          return Strings.audioServiceTitle;
        }
      case ServiceType.serviceTypeVideo:
        {
          return Strings.videoServiceTitle;
        }
      case ServiceType.serviceTypeTextCall:
        {
          return Strings.liveTextChat;
        }
      case ServiceType.serviceTypeAudioCall:
        {
          return Strings.liveAudioChat;
        }
      case ServiceType.serviceTypeVideoCall:
        {
          return Strings.liveVideoChat;
        }
      case ServiceType.serviceTypePremium:
        {
          return premiumService?.name ?? '';
        }
      default:
        return '';
    }
  }

  String subTitle() {
    switch (ServiceType.values[type]) {
      case ServiceType.serviceTypeText:
      case ServiceType.serviceTypeAudio:
      case ServiceType.serviceTypeVideo:
        {
          return Strings.readingServiceSubTitle;
        }
      case ServiceType.serviceTypePremium:
        {
          return Strings.duration +
              ': ' +
              (premiumService?.durationStr() ?? '');
        }
      default:
        return '';
    }
  }

  bool isRealTime() {
    var serviceType = ServiceType.values[type];
    if (serviceType == ServiceType.serviceTypeTextCall ||
        serviceType == ServiceType.serviceTypeAudioCall ||
        serviceType == ServiceType.serviceTypeVideoCall) {
      return true;
    } else {
      return false;
    }
  }

  bool shouldDiscount() {
    if (isRealTime()) {
      return false;
    }
    return discountable;
  }

  int discountPrice(UserInfoModel star) {
    double num = price.toDouble();
    //非实时订单特有的折扣
    if (!isRealTime()) {
      //followUp折扣
      if (star.isFollowUpPeriod()) {
        num = num / 2;
      }
      //首单折扣
      if (Global.userLogic().state.existFirstReadingOff.value) {
        num = num * 0.7;
      }
    } else if (type == ServiceType.serviceTypeTextCall.index) {
      // 文字订单实时折扣
      num = num * star.textCallCoupon();
    }
    //主题折扣
    if (BossManager.instance.hasDiscount(serviceType: type)) {
      double discount =
          BossManager.instance.eventSaleDiscount(serviceType: type);
      num = num * discount;
    }

    return num.ceil();
  }

  //打点类型名字
  String eventName() {
    switch (ServiceType.values[type]) {
      case ServiceType.serviceTypeText:
        {
          return 'text';
        }
      case ServiceType.serviceTypeAudio:
        {
          return 'audio';
        }
      case ServiceType.serviceTypeVideo:
        {
          return 'video';
        }
      case ServiceType.serviceTypeTextCall:
        {
          return 'live_text';
        }
      case ServiceType.serviceTypeAudioCall:
        {
          return 'live_audio';
        }
      case ServiceType.serviceTypeVideoCall:
        {
          return 'live_video';
        }
      case ServiceType.serviceTypePremium:
        {
          return 'premium_service';
        }
      default:
        return '';
    }
  }

  bool isPremium() {
    return type == ServiceType.serviceTypePremium.index;
  }
}

double fixAvailableHours(var value) {
  double defaultValue = 24.0;
  if (value == null) {
    return defaultValue;
  }
  if (value is double) {
    return value;
  }
  if (value is int) {
    return value.toDouble();
  }
  return defaultValue;
}

const int PremiumServiceApproveStatus_UnApproval = 0;
const int PremiumServiceApproveStatus_Approval = 1;
const int PremiumServiceApproveStatus_Decline = 2;

///0 关闭、1 打开、2 因为超时被关停
const int PremiumServiceStatus_Off = 0;
const int PremiumServiceStatus_On = 1;
const int PremiumServiceStatus_Punish = 2;

@JsonSerializable()
class PremiumService {
  /// id
  @JsonKey(defaultValue: '')
  String serviceId;

  ///名称
  @JsonKey(defaultValue: '')
  String name;

  ///描述
  @JsonKey(defaultValue: '')
  String desc;

  ///价格
  @JsonKey(defaultValue: 0)
  int price;

  ///服务持续时长，hour
  @JsonKey(defaultValue: 0)
  int duration;

  ///开场白
  @JsonKey(defaultValue: '')
  String remarks;

  ///图片
  @JsonKey(defaultValue: '')
  String pictureUrl;

  ///审核状态
  @JsonKey(defaultValue: PremiumServiceApproveStatus_UnApproval)
  int approved;

  ///是否开启服务
  @JsonKey(defaultValue: PremiumServiceStatus_Off)
  int status;

  ///更新时间戳，ms，修改之后更新，后台用来排序的
  @JsonKey(defaultValue: 0)
  int updateTime;

  /// 神婆信息，用于增值服务列表
  UserInfoModel? starInfo;

  PremiumService(
    this.serviceId,
    this.name,
    this.desc,
    this.price,
    this.duration,
    this.remarks,
    this.pictureUrl,
    this.approved,
    this.status,
    this.updateTime,
    this.starInfo,
  );

  factory PremiumService.fromJson(Map<String, dynamic> json) =>
      _$PremiumServiceFromJson(json);

  Map<String, dynamic> toJson() => fixToJson(_$PremiumServiceToJson(this));

  int day() {
    return duration ~/ 24;
  }

  String durationStr() {
    int count = day();
    return '$count ${Strings.day(count)}';
  }
}

const String AdditionalQuizTypeAsk = 'ask';
const String AdditionalQuizTypeReply = 'reply';

@JsonSerializable()
class AddionalQuiz {
  @JsonKey(defaultValue: '')
  String text;
  @JsonKey(defaultValue: '')
  String type;
  @JsonKey(defaultValue: 0)
  int timestamp;

  AddionalQuiz(this.text, this.type, this.timestamp);

  factory AddionalQuiz.fromJson(Map<String, dynamic> json) =>
      _$AddionalQuizFromJson(json);

  Map<String, dynamic> toJson() => fixToJson(_$AddionalQuizToJson(this));

  bool isAsk() {
    return type == AdditionalQuizTypeAsk;
  }

  bool isReply() {
    return type == AdditionalQuizTypeReply;
  }
}

@JsonSerializable()
class AnswerModel {
  @JsonKey(defaultValue: '')
  String text; //文字订单答案
  @JsonKey(defaultValue: '')
  String url; //视频、语音的链接
  @JsonKey(defaultValue: 0)
  int duration; //视频、语音的时长
  @JsonKey(defaultValue: 0)
  int timestamp;
  @JsonKey(defaultValue: [])
  List<AddionalQuiz> aq;

  AnswerModel(this.text, this.url, this.duration, this.timestamp, this.aq);

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);

  Map<String, dynamic> toJson() => fixToJson(_$AnswerModelToJson(this));
}

///神婆回复评论的审核状态，0：未回复，1：未审核，2：审核通过，3: 审核不通过
const int COMMENT_REPLY_STATUS_NO_REPLY = 0;
const int COMMENT_REPLY_STATUS_UNCHECK = 1;
const int COMMENT_REPLY_STATUS_APPROVED = 2;
const int COMMENT_REPLY_STATUS_DISAPPROVED = 3;

@JsonSerializable()
class CommentModel {
  @JsonKey(defaultValue: '')
  String txt;
  @JsonKey(defaultValue: -1)
  double rate;
  @JsonKey(defaultValue: 0)
  int createTime;

  @JsonKey(defaultValue: 0)
  double accuracy;

  /// true时，评论详情显示准确度，取值是accuracy
  @JsonKey(defaultValue: false)
  bool withAccuracy;

  ///神婆给评论的回复
  @JsonKey(defaultValue: '')
  String reply;

  ///神婆回复评论的时间
  @JsonKey(defaultValue: 0)
  int replyTime;

  ///回复的审核状态
  @JsonKey(defaultValue: COMMENT_REPLY_STATUS_NO_REPLY)
  int replyStatus;

  OrderInfoModel? orderInfo;

  CommentModel(
    this.txt,
    this.rate,
    this.createTime,
    this.accuracy,
    this.withAccuracy,
    this.reply,
    this.replyTime,
    this.replyStatus,
    this.orderInfo,
  );

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  Map<String, dynamic> toJson() => fixToJson(_$CommentModelToJson(this));
}

AnswerModel defaultAnswerModel(var value) {
  if (value == null) {
    return AnswerModel.fromJson({});
  }
  return AnswerModel.fromJson(value);
}

ServiceInfoModel defaultServiceModel(var value) {
  if (value == null) {
    return ServiceInfoModel.fromJson({});
  }
  return ServiceInfoModel.fromJson(value);
}

@JsonSerializable()
class DiscountModel {
  @JsonKey(defaultValue: 1.0)
  double eventDiscount; //主题打折

  @JsonKey(defaultValue: 0)
  int threeMinutesFree; //三分钟免费

  @JsonKey(defaultValue: 1.0)
  double liveChatCoupon; //实时文字折扣券

  DiscountModel(
    this.eventDiscount,
    this.threeMinutesFree,
    this.liveChatCoupon,
  );

  factory DiscountModel.fromJson(Map<String, dynamic> json) =>
      _$DiscountModelFromJson(json);

  Map<String, dynamic> toJson() => fixToJson(_$DiscountModelToJson(this));

  bool is3Free() {
    return threeMinutesFree == 1;
  }
}

DiscountModel defaultDiscountModel(var value) {
  if (value == null) {
    return DiscountModel.fromJson({});
  }
  return DiscountModel.fromJson(value);
}
