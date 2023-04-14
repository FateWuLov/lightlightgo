import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'advisormodel.dart';

part 'ordermodel.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class Order extends HiveObject {
  @HiveField(0)
  Advisor advisor;
  @HiveField(1)
  String situation;
  @HiveField(2)
  String question;
  @HiveField(3)
  late DateTime date;


  Order(this.advisor, this.situation, this.question);

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}