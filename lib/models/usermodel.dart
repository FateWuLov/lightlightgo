
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'advisormodel.dart';

part 'usermodel.g.dart';


@HiveType(typeId: 0)
@JsonSerializable()
class User extends HiveObject{

  @JsonKey(name: 'name')
  @HiveField(0)
  String name;

  @JsonKey(name: 'bio')
  @HiveField(1)
  String bio;

  @JsonKey(defaultValue: "Male")
  @HiveField(2, defaultValue: "Male")
  String gender;

  @JsonKey(defaultValue: null)
  @HiveField(3)
  DateTime birth;

  @JsonKey(name: 'aboutMe')
  @HiveField(4)
  String about;

  @JsonKey(defaultValue: 'assets/3.0x/defaultAvatar.png')
  @HiveField(5, defaultValue: "assets/3.0x/defaultAvatar.png")
  String avatar;

  @JsonKey(defaultValue: [])
  @HiveField(6, defaultValue: [])
  List<Advisor> likedList;

  @JsonKey(defaultValue: [])
  @HiveField(7, defaultValue: [])
  List<Advisor> orders;

  User(this.name, this.bio, this.gender, this.birth, this.about, this.avatar, this.likedList, this.orders);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}