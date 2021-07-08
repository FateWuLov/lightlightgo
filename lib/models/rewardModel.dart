

import 'package:lifeaste/common/tools.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rewardModel.g.dart';

//被邀请奖励
const String REWARD_TYPE_BE_INVITED = 'BE_INVITED_AWARD';
//邀请他人得奖励
const String REWARD_TYPE_INVITE_USER = 'INVITE_USER_AWARD';
//升级奖励
const String REWARD_LEVEL_UP_REWARD = 'LEVEL_UP_REWARD';
//管理员手动发放奖励
const String REWARD_LEVEL_UP_MANUALLY_REWARD = 'LEVEL_UP_MANUALLY_REWARD';
//超级潜力用户奖励
const String REWARD_SUPER_POTENTIAL_AWARD = 'SUPER_POTENTIAL_AWARD';
//普通潜力用户奖励
const String REWARD_COMMEN_POTENTIAL_AWARD = 'COMMEN_POTENTIAL_AWARD';

@JsonSerializable()
class RewardModel {
  @JsonKey(defaultValue: '')
  String awardId;
  @JsonKey(defaultValue: '')
  String type;
  @JsonKey(defaultValue: 0)
  int count;
  @JsonKey(defaultValue: false)
  bool isReceived;
  @JsonKey(defaultValue: 0)
  int receivedTime;

  RewardModel(
    this.awardId,
    this.type,
    this.count,
    this.isReceived,
    this.receivedTime,
  );

  factory RewardModel.fromJson(Map<String, dynamic> json) =>
      _$RewardModelFromJson(json);
  Map<String, dynamic> toJson() => fixToJson(_$RewardModelToJson(this));

}
