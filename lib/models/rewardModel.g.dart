// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rewardModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RewardModel _$RewardModelFromJson(Map<String, dynamic> json) {
  return RewardModel(
    json['awardId'] as String? ?? '',
    json['type'] as String? ?? '',
    json['count'] as int? ?? 0,
    json['isReceived'] as bool? ?? false,
    json['receivedTime'] as int? ?? 0,
  );
}

Map<String, dynamic> _$RewardModelToJson(RewardModel instance) =>
    <String, dynamic>{
      'awardId': instance.awardId,
      'type': instance.type,
      'count': instance.count,
      'isReceived': instance.isReceived,
      'receivedTime': instance.receivedTime,
    };
