// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servicemodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) => ServiceModel(
      name: json['service_name'] as String?,
      desc: json['service_desc'] as String?,
      price: json['service_price'] as int?,
    );

Map<String, dynamic> _$ServiceModelToJson(ServiceModel instance) =>
    <String, dynamic>{
      'service_name': instance.name,
      'service_desc': instance.desc,
      'service_price': instance.price,
    };
