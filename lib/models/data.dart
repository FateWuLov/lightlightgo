import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  Data();

  late String v;
  late num fr;
  late num ip;
  late num op;
  late num w;
  late num h;
  late String nm;
  late num ddd;
  late List assets;
  late List layers;
  
  factory Data.fromJson(Map<String,dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
