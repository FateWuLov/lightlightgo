// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inviteRecordModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InviteRecordModel _$InviteRecordModelFromJson(Map<String, dynamic> json) {
  return InviteRecordModel(
    json['awardId'] as String? ?? '',
    json['createTime'] as int? ?? 0,
    json['awardCount'] as int? ?? 0,
    json['isReceived'] as bool? ?? false,
    json['rewardStatus'] as int? ?? 0,
    json['avatar'] as String? ?? '',
    json['name'] as String? ?? '',
    json['userId'] as String? ?? '',
  );
}

Map<String, dynamic> _$InviteRecordModelToJson(InviteRecordModel instance) =>
    <String, dynamic>{
      'awardId': instance.awardId,
      'createTime': instance.createTime,
      'rewardStatus': instance.rewardStatus,
      'awardCount': instance.awardCount,
      'name': instance.name,
      'userId': instance.userId,
      'avatar': instance.avatar,
      'isReceived': instance.isReceived,
    };
