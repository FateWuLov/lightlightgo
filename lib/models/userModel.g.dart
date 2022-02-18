// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) {
  return UserInfoModel(
    json['isAdmin'] as bool? ?? false,
    json['followUpDeadline'] as int? ?? 0,
    (json['interestCategories'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    json['autoMessage'] as String? ?? '',
    json['starExperience'] as int? ?? -1,
    json['threeMinutesTickets'] as int?,
    (json['interestTags'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    json['expressionWay'] as int? ?? -1,
    json['identify'] as String? ?? '',
    json['userId'] as String? ?? '',
    json['assistantId'] as String? ?? '',
    json['avatar'] as String? ?? '',
    json['name'] as String? ?? '',
    json['bio'] as String? ?? '',
    json['about'] as String? ?? '',
    json['coverImage'] as String? ?? '',
    json['birthday'] as String? ?? '',
    json['gender'] as int? ?? 0,
    json['orderInstruction'] as String? ?? '',
    json['realName'] as String? ?? '',
    json['appVersion'] as String? ?? '',
    json['platform'] as String? ?? '',
    json['product'] as String? ?? '',
    (json['availableService'] as List<dynamic>?)
            ?.map((e) => ServiceInfoModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    (json['premiumServices'] as List<dynamic>?)
            ?.map((e) => PremiumService.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    (json['accuracy'] as num?)?.toDouble() ?? 0,
    json['accuracyCount'] as int? ?? 0,
    (json['rate'] as num?)?.toDouble() ?? 5.0,
    json['orderCount'] as int? ?? 0,
    json['orderCompleted'] as int? ?? 0,
    json['orderExpired'] as int? ?? 0,
    json['commentCount'] as int? ?? 0,
    json['coin'] as int? ?? 0,
    (json['totalCost'] as num?)?.toDouble() ?? 0.0,
    json['loveTarotTickets'] as int? ?? 0,
    json['newLoveTarotTickets'] as int? ?? 0,
    json['loveFortuneTarotTickets'] as int? ?? 0,
    json['relationshipTarotTickets'] as int? ?? 0,
    json['yesOrNoTarotTickets'] as int? ?? 0,
    json['loginType'] as String? ?? '',
    json['lastLoginType'] as String? ?? '',
    json['loginId'] as String? ?? '',
    json['xmppPwd'] as String? ?? '',
    json['createTime'] as int? ?? 0,
    json['approved'] as int? ?? 0,
    (json['goodAtCategories'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    json['level'] as int? ?? 0,
    json['hot'] as int? ?? 0,
    json['pearl'] as int? ?? 0,
    json['workStatus'] as int? ?? 0,
    json['liveStatus'] as int? ?? 0,
    json['email'] as String? ?? '',
    json['coverVideo'] as String? ?? '',
    json['featureCover'] as String? ?? '',
    (json['awards'] as List<dynamic>?)
            ?.map((e) => RewardModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    json['nrtOrderCount'] as int? ?? 0,
    json['rtOrderCompleted'] as int? ?? 0,
    json['adChannel'] as String? ?? '',
    json['showRank'] as int? ?? 0,
    json['notifyType'] as int? ?? 0,
    json['inviterId'] as String? ?? '',
    json['inviteCode'] as String? ?? '',
    json['inviteCount'] as int? ?? 0,
    (json['avgDeliverTime'] as List<dynamic>?)?.map((e) => e as int).toList() ??
        [0, 0],
    (json['quickReadingMode'] as List<dynamic>?)
            ?.map((e) => e as int)
            .toList() ??
        [],
    json['dailyBonus'] as bool? ?? true,
    json['isBlockingHim'] as bool? ?? false,
    json['isBlockingMe'] as bool? ?? false,
    json['favorite'] as bool? ?? false,
    json['liveAutoMessage'] as String? ?? '',
  );
}

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) =>
    <String, dynamic>{
      'identify': instance.identify,
      'isAdmin': instance.isAdmin,
      'loginType': instance.loginType,
      'lastLoginType': instance.lastLoginType,
      'loginId': instance.loginId,
      'userId': instance.userId,
      'createTime': instance.createTime,
      'avatar': instance.avatar,
      'name': instance.name,
      'bio': instance.bio,
      'about': instance.about,
      'birthday': instance.birthday,
      'gender': instance.gender,
      'realName': instance.realName,
      'xmppPwd': instance.xmppPwd,
      'email': instance.email,
      'dailyBonus': instance.dailyBonus,
      'interestTags': instance.interestTags,
      'interestCategories': instance.interestCategories,
      'expressionWay': instance.expressionWay,
      'starExperience': instance.starExperience,
      'nrtOrderCount': instance.nrtOrderCount,
      'rtOrderCompleted': instance.rtOrderCompleted,
      'assistantId': instance.assistantId,
      'showRank': instance.showRank,
      'adChannel': instance.adChannel,
      'appVersion': instance.appVersion,
      'platform': instance.platform,
      'product': instance.product,
      'coin': instance.coin,
      'totalCost': instance.totalCost,
      'awards': instance.awards,
      'pearl': instance.pearl,
      'loveTarotTickets': instance.loveTarotTickets,
      'loveFortuneTarotTickets': instance.loveFortuneTarotTickets,
      'newLoveTarotTickets': instance.newLoveTarotTickets,
      'relationshipTarotTickets': instance.relationshipTarotTickets,
      'yesOrNoTarotTickets': instance.yesOrNoTarotTickets,
      'threeMinutesTickets': instance.threeMinutesTickets,
      'isBlockingHim': instance.isBlockingHim,
      'isBlockingMe': instance.isBlockingMe,
      'favorite': instance.favorite,
      'inviterId': instance.inviterId,
      'inviteCode': instance.inviteCode,
      'inviteCount': instance.inviteCount,
      'orderInstruction': instance.orderInstruction,
      'coverImage': instance.coverImage,
      'autoMessage': instance.autoMessage,
      'coverVideo': instance.coverVideo,
      'featureCover': instance.featureCover,
      'liveAutoMessage': instance.liveAutoMessage,
      'hot': instance.hot,
      'level': instance.level,
      'approved': instance.approved,
      'availableService': instance.availableService,
      'premiumServices': instance.premiumServices,
      'goodAtCategories': instance.goodAtCategories,
      'accuracy': instance.accuracy,
      'accuracyCount': instance.accuracyCount,
      'rate': instance.rate,
      'orderCount': instance.orderCount,
      'orderCompleted': instance.orderCompleted,
      'orderExpired': instance.orderExpired,
      'commentCount': instance.commentCount,
      'avgDeliverTime': instance.avgDeliverTime,
      'quickReadingMode': instance.quickReadingMode,
      'followUpDeadline': instance.followUpDeadline,
      'workStatus': instance.workStatus,
      'liveStatus': instance.liveStatus,
      'notifyType': instance.notifyType,
    };
