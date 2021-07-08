import 'package:json_annotation/json_annotation.dart';
import 'package:lifeaste/common/tools.dart';

part 'loginParams.g.dart';

@JsonSerializable()
class LoginParams {
  String? uuid;
  String? loginType;
  String? loginId;
  LoginUserInfo? userInfo;
  LoginAfInfo? afInfo;

  LoginParams(
    this.uuid,
    this.loginType,
    this.loginId,
    this.userInfo,
    this.afInfo,
  );

  factory LoginParams.fromJson(Map<String, dynamic> json) =>
      _$LoginParamsFromJson(json);

  Map<String, dynamic> toJson() => fixToJson(_$LoginParamsToJson(this));
}

@JsonSerializable()
class LoginUserInfo {
  String? name;
  String? avatar;

  /// 手机号登录专用
  String? phone;
  String? googleEmail;

  /// google登录专用
  String? googlePhone;
  String? iCloudAccount;

  LoginUserInfo(
    this.name,
    this.avatar,
    this.phone,
    this.googleEmail,
    this.googlePhone,
    this.iCloudAccount,
  );

  factory LoginUserInfo.fromJson(Map<String, dynamic> json) =>
      _$LoginUserInfoFromJson(json);

  Map<String, dynamic> toJson() => fixToJson(_$LoginUserInfoToJson(this));
}

@JsonSerializable()
class LoginAfInfo {
  String? af_ad;
  String? campaign;

  LoginAfInfo(
    this.af_ad,
    this.campaign,
  );

  factory LoginAfInfo.fromJson(Map<String, dynamic> json) =>
      _$LoginAfInfoFromJson(json);

  Map<String, dynamic> toJson() => fixToJson(_$LoginAfInfoToJson(this));
}
