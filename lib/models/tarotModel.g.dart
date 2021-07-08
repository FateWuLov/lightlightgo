// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tarotModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TarotModel _$TarotModelFromJson(Map<String, dynamic> json) {
  return TarotModel(
    json['displayName'] as String? ?? '',
    json['imgName'] as String? ?? '',
    (json['results'] as List<dynamic>?)
            ?.map((e) => TarotResultModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    json['timestamp'] as int? ?? 0,
  );
}

Map<String, dynamic> _$TarotModelToJson(TarotModel instance) =>
    <String, dynamic>{
      'imgName': instance.imgName,
      'displayName': instance.displayName,
      'results': instance.results,
      'timestamp': instance.timestamp,
    };

TarotResultModel _$TarotResultModelFromJson(Map<String, dynamic> json) {
  return TarotResultModel()
    ..type = json['type'] as String? ?? ''
    ..keywords = json['keywords'] as String? ?? ''
    ..actions = json['actions'] as String? ?? ''
    ..explanations = (json['explanations'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [];
}

Map<String, dynamic> _$TarotResultModelToJson(TarotResultModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'keywords': instance.keywords,
      'actions': instance.actions,
      'explanations': instance.explanations,
    };
