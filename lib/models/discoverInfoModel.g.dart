// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discoverInfoModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscoverInfoModel _$DiscoverInfoModelFromJson(Map<String, dynamic> json) {
  return DiscoverInfoModel(
    json['updateTimestamp'] as int? ?? 0,
    json['showTimestamp'] as int? ?? 0,
    json['duration'] as int? ?? 0,
    json['type'] as int? ?? 0,
  );
}

Map<String, dynamic> _$DiscoverInfoModelToJson(DiscoverInfoModel instance) =>
    <String, dynamic>{
      'updateTimestamp': instance.updateTimestamp,
      'showTimestamp': instance.showTimestamp,
      'duration': instance.duration,
      'type': instance.type,
    };
