// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderInfoModel _$OrderInfoModelFromJson(Map<String, dynamic> json) {
  return OrderInfoModel(
    json['orderId'] as String? ?? '',
    _userInfo(json['userInfo']),
    _starInfo(json['starInfo']),
    json['status'] as int? ?? 0,
    json['userUnread'] as bool? ?? false,
    json['starUnread'] as bool? ?? false,
    json['createTime'] as int? ?? 0,
    json['expireTime'] as int? ?? 0,
    json['updateTime'] as int? ?? 0,
    json['question'] as String? ?? '',
    json['situation'] as String? ?? '',
    json['attachedPictureUrl'] as String? ?? '',
    defaultAnswerModel(json['answer']),
    defaultServiceModel(json['service']),
    json['comment'] == null
        ? null
        : CommentModel.fromJson(json['comment'] as Map<String, dynamic>),
    json['needAccuracy'] as bool? ?? false,
    json['followUpDeadline'] as int? ?? 0,
    defaultDiscountModel(json['discount']),
    json['rushStatus'] as int? ?? 0,
    json['rushExpiredAt'] as int? ?? 0,
    json['orderPrice'] as int? ?? 0,
  );
}

Map<String, dynamic> _$OrderInfoModelToJson(OrderInfoModel instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'userInfo': instance.userInfo,
      'starInfo': instance.starInfo,
      'status': instance.status,
      'userUnread': instance.userUnread,
      'starUnread': instance.starUnread,
      'createTime': instance.createTime,
      'expireTime': instance.expireTime,
      'updateTime': instance.updateTime,
      'question': instance.question,
      'situation': instance.situation,
      'attachedPictureUrl': instance.attachedPictureUrl,
      'answer': instance.answer,
      'service': instance.service,
      'comment': instance.comment,
      'needAccuracy': instance.needAccuracy,
      'followUpDeadline': instance.followUpDeadline,
      'discount': instance.discount,
      'rushStatus': instance.rushStatus,
      'rushExpiredAt': instance.rushExpiredAt,
      'orderPrice': instance.orderPrice,
    };

ServiceInfoModel _$ServiceInfoModelFromJson(Map<String, dynamic> json) {
  return ServiceInfoModel(
    json['type'] as int? ?? 0,
    json['price'] as int? ?? 0,
    fixAvailableHours(json['availableHours']),
    json['canRush'] as bool? ?? false,
    json['discountable'] as bool? ?? false,
    json['premiumService'] == null
        ? null
        : PremiumService.fromJson(
            json['premiumService'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ServiceInfoModelToJson(ServiceInfoModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'price': instance.price,
      'availableHours': instance.availableHours,
      'canRush': instance.canRush,
      'discountable': instance.discountable,
      'premiumService': instance.premiumService,
    };

PremiumService _$PremiumServiceFromJson(Map<String, dynamic> json) {
  return PremiumService(
    json['serviceId'] as String? ?? '',
    json['name'] as String? ?? '',
    json['desc'] as String? ?? '',
    json['price'] as int? ?? 0,
    json['duration'] as int? ?? 0,
    json['remarks'] as String? ?? '',
    json['pictureUrl'] as String? ?? '',
    json['approved'] as int? ?? 0,
    json['status'] as int? ?? 0,
    json['updateTime'] as int? ?? 0,
    json['starInfo'] == null
        ? null
        : UserInfoModel.fromJson(json['starInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PremiumServiceToJson(PremiumService instance) =>
    <String, dynamic>{
      'serviceId': instance.serviceId,
      'name': instance.name,
      'desc': instance.desc,
      'price': instance.price,
      'duration': instance.duration,
      'remarks': instance.remarks,
      'pictureUrl': instance.pictureUrl,
      'approved': instance.approved,
      'status': instance.status,
      'updateTime': instance.updateTime,
      'starInfo': instance.starInfo,
    };

AddionalQuiz _$AddionalQuizFromJson(Map<String, dynamic> json) {
  return AddionalQuiz(
    json['text'] as String? ?? '',
    json['type'] as String? ?? '',
    json['timestamp'] as int? ?? 0,
  );
}

Map<String, dynamic> _$AddionalQuizToJson(AddionalQuiz instance) =>
    <String, dynamic>{
      'text': instance.text,
      'type': instance.type,
      'timestamp': instance.timestamp,
    };

AnswerModel _$AnswerModelFromJson(Map<String, dynamic> json) {
  return AnswerModel(
    json['text'] as String? ?? '',
    json['url'] as String? ?? '',
    json['duration'] as int? ?? 0,
    json['timestamp'] as int? ?? 0,
    (json['aq'] as List<dynamic>?)
            ?.map((e) => AddionalQuiz.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$AnswerModelToJson(AnswerModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'url': instance.url,
      'duration': instance.duration,
      'timestamp': instance.timestamp,
      'aq': instance.aq,
    };

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) {
  return CommentModel(
    json['txt'] as String? ?? '',
    (json['rate'] as num?)?.toDouble() ?? -1,
    json['createTime'] as int? ?? 0,
    (json['accuracy'] as num?)?.toDouble() ?? 0,
    json['withAccuracy'] as bool? ?? false,
    json['reply'] as String? ?? '',
    json['replyTime'] as int? ?? 0,
    json['replyStatus'] as int? ?? 0,
    json['orderInfo'] == null
        ? null
        : OrderInfoModel.fromJson(json['orderInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'txt': instance.txt,
      'rate': instance.rate,
      'createTime': instance.createTime,
      'accuracy': instance.accuracy,
      'withAccuracy': instance.withAccuracy,
      'reply': instance.reply,
      'replyTime': instance.replyTime,
      'replyStatus': instance.replyStatus,
      'orderInfo': instance.orderInfo,
    };

DiscountModel _$DiscountModelFromJson(Map<String, dynamic> json) {
  return DiscountModel(
    (json['eventDiscount'] as num?)?.toDouble() ?? 1.0,
    json['threeMinutesFree'] as int? ?? 0,
    (json['liveChatCoupon'] as num?)?.toDouble() ?? 1.0,
  );
}

Map<String, dynamic> _$DiscountModelToJson(DiscountModel instance) =>
    <String, dynamic>{
      'eventDiscount': instance.eventDiscount,
      'threeMinutesFree': instance.threeMinutesFree,
      'liveChatCoupon': instance.liveChatCoupon,
    };
