import 'package:json_annotation/json_annotation.dart';
import 'package:lifeaste/common/common.dart';

part 'discoverInfoModel.g.dart';

const int DiscoverListTypeNewUser = 0;
const int DiscoverListTypeNormal = 1;

@JsonSerializable()
class DiscoverInfoModel {
  ///榜单更新时间，有变化时重置显示时间
  @JsonKey(defaultValue: 0)
  int updateTimestamp;

  ///榜单出现的时间
  @JsonKey(defaultValue: 0)
  int showTimestamp;

  ///榜单持续时间，ms
  @JsonKey(defaultValue: 0)
  int duration;

  ///榜单类型
  @JsonKey(defaultValue: DiscoverListTypeNewUser)
  int type;

  DiscoverInfoModel(
    this.updateTimestamp,
    this.showTimestamp,
    this.duration,
    this.type,
  );

  factory DiscoverInfoModel.fromJson(Map<String, dynamic> json) =>
      _$DiscoverInfoModelFromJson(json);

  Map<String, dynamic> toJson() => fixToJson(_$DiscoverInfoModelToJson(this));
}
