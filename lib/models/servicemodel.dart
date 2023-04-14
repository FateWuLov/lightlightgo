
import 'package:json_annotation/json_annotation.dart';
part 'servicemodel.g.dart';

@JsonSerializable()
class ServiceModel {
  @JsonKey(name: 'service_name')
  String? name;

  @JsonKey(name: 'service_desc')
  String? desc;

  @JsonKey(name: 'service_price')
  int? price;

  ServiceModel({
    this.name,
    this.desc,
    this.price
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => _$ServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}
