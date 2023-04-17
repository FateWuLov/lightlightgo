
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:myapp/models/servicemodel.dart';

part 'advisormodel.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class Advisor extends HiveObject{

  @JsonKey(name: 'advisor_name')
  @HiveField(0)
  String name;

  @JsonKey(name: 'advisor_avatar')
  @HiveField(1)
  String avatar;

  @JsonKey(name: 'advisor_desc')
  @HiveField(2)
  String introduction;

  @JsonKey(defaultValue: "Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about Advisor's default about ")
  @HiveField(3)
  String about;

  @JsonKey(defaultValue: false)
  @HiveField(4, defaultValue: false)
  bool liked;

  @HiveField(5, defaultValue: [])
  @_ServiceModelConverter()
  List<ServiceModel> services;

  Advisor(this.name, this.introduction, this.about, this.avatar, this.liked, this.services);

  factory Advisor.fromJson(Map<String, dynamic> json) => _$AdvisorFromJson(json);
  Map<String, dynamic> toJson() => _$AdvisorToJson(this);
}

class _ServiceModelConverter implements JsonConverter<List<ServiceModel>?, String?> {
  const _ServiceModelConverter();

  @override
  List<ServiceModel>? fromJson(String? value) {
    final List<ServiceModel> models = [];
    if ((value?.isNotEmpty == true)) {
      final json = jsonDecode(value!);
      if (json is List) {
        /// 格式不对的数据剔除掉
        for (final element in json) {
          if (element is Map<String, dynamic>) {
            models.add(ServiceModel.fromJson(element));
          }
        }
      }
    }
    return models;
  }

  @override
  String? toJson(List<ServiceModel>? object) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}