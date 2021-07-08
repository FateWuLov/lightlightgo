// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginParams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginParams _$LoginParamsFromJson(Map<String, dynamic> json) {
  return LoginParams(
    json['uuid'] as String?,
    json['loginType'] as String?,
    json['loginId'] as String?,
    json['userInfo'] == null
        ? null
        : LoginUserInfo.fromJson(json['userInfo'] as Map<String, dynamic>),
    json['afInfo'] == null
        ? null
        : LoginAfInfo.fromJson(json['afInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LoginParamsToJson(LoginParams instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'loginType': instance.loginType,
      'loginId': instance.loginId,
      'userInfo': instance.userInfo,
      'afInfo': instance.afInfo,
    };

LoginUserInfo _$LoginUserInfoFromJson(Map<String, dynamic> json) {
  return LoginUserInfo(
    json['name'] as String?,
    json['avatar'] as String?,
    json['phone'] as String?,
    json['googleEmail'] as String?,
    json['googlePhone'] as String?,
    json['iCloudAccount'] as String?,
  );
}

Map<String, dynamic> _$LoginUserInfoToJson(LoginUserInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'avatar': instance.avatar,
      'phone': instance.phone,
      'googleEmail': instance.googleEmail,
      'googlePhone': instance.googlePhone,
      'iCloudAccount': instance.iCloudAccount,
    };

LoginAfInfo _$LoginAfInfoFromJson(Map<String, dynamic> json) {
  return LoginAfInfo(
    json['af_ad'] as String?,
    json['campaign'] as String?,
  );
}

Map<String, dynamic> _$LoginAfInfoToJson(LoginAfInfo instance) =>
    <String, dynamic>{
      'af_ad': instance.af_ad,
      'campaign': instance.campaign,
    };
