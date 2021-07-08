import 'package:lifeaste/common/tools.dart';
import 'package:json_annotation/json_annotation.dart';

part 'inviteRecordModel.g.dart';

@JsonSerializable()
class InviteRecordModel {
  @JsonKey(defaultValue: '')
  String awardId; //如果没有awardId，说明没有达到发放奖励条件
  @JsonKey(defaultValue: 0)
  int createTime;
  @JsonKey(defaultValue: 0)
  int rewardStatus;
  @JsonKey(defaultValue: 0)
  int awardCount;
  @JsonKey(defaultValue: '')
  String name;
  @JsonKey(defaultValue: '')
  String userId;
  @JsonKey(defaultValue: '')
  String avatar;
  @JsonKey(defaultValue: false)
  bool isReceived; //发放奖励之后有没有被领取

  InviteRecordModel(
    this.awardId,
    this.createTime,
    this.awardCount,
    this.isReceived,
    this.rewardStatus,
    this.avatar,
    this.name,
    this.userId,
  );

  factory InviteRecordModel.fromJson(Map<String, dynamic> json) =>
      _$InviteRecordModelFromJson(json);

  Map<String, dynamic> toJson() => fixToJson(_$InviteRecordModelToJson(this));
}
