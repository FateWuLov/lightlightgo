// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bossConfigModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BossConfigModel _$BossConfigModelFromJson(Map<String, dynamic> json) {
  return BossConfigModel(
    defaultAppInfoConfig(json['app_info_config']),
  );
}

Map<String, dynamic> _$BossConfigModelToJson(BossConfigModel instance) =>
    <String, dynamic>{
      'app_info_config': instance.appInfoConfig,
    };

AppInfoConfig _$AppInfoConfigFromJson(Map<String, dynamic> json) {
  return AppInfoConfig(
    (json['limitWordsScene1'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    (json['limitWordsScene2'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    defaultEventSaleConfig(json['eventSaleConfig']),
    (json['hotWordList'] as List<dynamic>?)?.map((e) => e as String).toList() ??
        [],
    json['inviteReward'] as String? ?? '',
    json['beInvitedReward'] as String? ?? '',
    json['webLinkNew'] as String? ?? '',
    json['webPackageLink'] as String? ?? '',
    json['dailyBounsLink'] as String? ?? '',
    json['starLeaderboardLink'] as String? ?? '',
    json['levelUpLunaWebMsg'] as String? ?? '',
    json['levelUpRewardGreet'] as String? ?? '',
    json['discoverBannerTitleForOldUser'] as String? ?? '',
    json['discoverBannerTitleForNewUser'] as String? ?? '',
    json['discoverDialogTitleForOldUser'] as String? ?? '',
    json['discoverDialogTitleForNewUser'] as String? ?? '',
    json['todayTarotPrice'] as int? ?? 0,
    json['generalLoveTarotPrice'] as int? ?? 20,
    json['newLoveTarotPrice'] as int? ?? 50,
    json['relationshipTarotPrice'] as int? ?? 50,
    json['loveFortuneTarotPrice'] as int? ?? 50,
    json['yesNoTarotPrice'] as int? ?? 50,
    (json['presetReplyWords'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    json['specificQuestionMaxWordNum'] as int? ?? 200,
    json['specificQuestionPlaceholder'] as String? ?? '',
    json['generalSituationMaxWordNum'] as int? ?? 1500,
    json['generalSituationPlaceholder'] as String? ?? '',
    json['newerGreet'] as String? ?? '',
    json['becomeAnAdvisorGreet'] as String? ?? '',
    json['badRatingGreet'] as String? ?? '',
    json['invitePosterShareText'] as String? ?? '',
    json['inviteNormalShareText'] as String? ?? '',
    json['accuracyMinCount'] as int? ?? 20,
    json['showFreeChatEntranceInStarPage'] as bool? ?? false,
    json['bindedEmailReward'] as int? ?? 5,
    json['canChatFreely'] as bool? ?? false,
    json['showStarLeaderboard'] as bool? ?? false,
    json['showDailySignIn'] as bool? ?? false,
    (json['bannerList'] as List<dynamic>?)
            ?.map((e) => BannerConfig.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    json['showToWebsiteBannerScreen'] as bool? ?? false,
    json['showToWebsiteBannerDialog'] as bool? ?? false,
    json['newInvitePosterShareText'] as String? ?? '',
    json['iosOnlyWebsitePurchase'] as bool? ?? false,
    json['inviteCodeNeedsFlower'] as bool? ?? false,
    json['baseLink'] as String? ?? '',
    json['repeatPremiumSlideCount'] as int? ?? 10,
    json['showChatPurchaseBanner'] as bool? ?? false,
    json['logAppEvent'] as bool? ?? true,
  );
}

Map<String, dynamic> _$AppInfoConfigToJson(AppInfoConfig instance) =>
    <String, dynamic>{
      'limitWordsScene1': instance.limitWordsScene1,
      'limitWordsScene2': instance.limitWordsScene2,
      'eventSaleConfig': instance.eventSaleConfig,
      'hotWordList': instance.hotWordList,
      'inviteReward': instance.inviteReward,
      'beInvitedReward': instance.beInvitedReward,
      'inviteCodeNeedsFlower': instance.inviteCodeNeedsFlower,
      'webLinkNew': instance.webLinkNew,
      'webPackageLink': instance.webPackageLink,
      'levelUpLunaWebMsg': instance.levelUpLunaWebMsg,
      'levelUpRewardGreet': instance.levelUpRewardGreet,
      'discoverBannerTitleForOldUser': instance.discoverBannerTitleForOldUser,
      'discoverBannerTitleForNewUser': instance.discoverBannerTitleForNewUser,
      'discoverDialogTitleForOldUser': instance.discoverDialogTitleForOldUser,
      'discoverDialogTitleForNewUser': instance.discoverDialogTitleForNewUser,
      'todayTarotPrice': instance.todayTarotPrice,
      'generalLoveTarotPrice': instance.generalLoveTarotPrice,
      'newLoveTarotPrice': instance.newLoveTarotPrice,
      'loveFortuneTarotPrice': instance.loveFortuneTarotPrice,
      'relationshipTarotPrice': instance.relationshipTarotPrice,
      'yesNoTarotPrice': instance.yesNoTarotPrice,
      'presetReplyWords': instance.presetReplyWords,
      'generalSituationMaxWordNum': instance.generalSituationMaxWordNum,
      'generalSituationPlaceholder': instance.generalSituationPlaceholder,
      'specificQuestionMaxWordNum': instance.specificQuestionMaxWordNum,
      'specificQuestionPlaceholder': instance.specificQuestionPlaceholder,
      'newerGreet': instance.newerGreet,
      'becomeAnAdvisorGreet': instance.becomeAnAdvisorGreet,
      'badRatingGreet': instance.badRatingGreet,
      'inviteNormalShareText': instance.inviteNormalShareText,
      'invitePosterShareText': instance.invitePosterShareText,
      'newInvitePosterShareText': instance.newInvitePosterShareText,
      'accuracyMinCount': instance.accuracyMinCount,
      'showFreeChatEntranceInStarPage': instance.showFreeChatEntranceInStarPage,
      'bindedEmailReward': instance.bindedEmailReward,
      'canChatFreely': instance.canChatFreely,
      'showStarLeaderboard': instance.showStarLeaderboard,
      'starLeaderboardLink': instance.starLeaderboardLink,
      'showDailySignIn': instance.showDailySignIn,
      'dailyBounsLink': instance.dailyBounsLink,
      'bannerList': instance.bannerList,
      'showToWebsiteBannerScreen': instance.showToWebsiteBannerScreen,
      'showToWebsiteBannerDialog': instance.showToWebsiteBannerDialog,
      'baseLink': instance.baseLink,
      'repeatPremiumSlideCount': instance.repeatPremiumSlideCount,
      'iosOnlyWebsitePurchase': instance.iosOnlyWebsitePurchase,
      'showChatPurchaseBanner': instance.showChatPurchaseBanner,
      'logAppEvent': instance.logAppEvent,
    };

EventSaleConfig _$EventSaleConfigFromJson(Map<String, dynamic> json) {
  return EventSaleConfig(
    json['saleId'] as String? ?? '',
    json['title'] as String? ?? '',
    json['subTitle'] as String? ?? '',
    json['imageUrl'] as String? ?? '',
    json['startTime'] as int? ?? 0,
    json['endTime'] as int? ?? 0,
    (json['textOff'] as num?)?.toDouble() ?? 0.0,
    (json['audioOff'] as num?)?.toDouble() ?? 0.0,
    (json['videoOff'] as num?)?.toDouble() ?? 0.0,
    (json['textCallOff'] as num?)?.toDouble() ?? 0.0,
    (json['audioCallOff'] as num?)?.toDouble() ?? 0.0,
    (json['videoCallOff'] as num?)?.toDouble() ?? 0.0,
  );
}

Map<String, dynamic> _$EventSaleConfigToJson(EventSaleConfig instance) =>
    <String, dynamic>{
      'saleId': instance.saleId,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'imageUrl': instance.imageUrl,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'textOff': instance.textOff,
      'audioOff': instance.audioOff,
      'videoOff': instance.videoOff,
      'textCallOff': instance.textCallOff,
      'audioCallOff': instance.audioCallOff,
      'videoCallOff': instance.videoCallOff,
    };

BannerConfig _$BannerConfigFromJson(Map<String, dynamic> json) {
  return BannerConfig(
    json['type'] as String? ?? '',
    json['link'] as String? ?? '',
    json['webTitle'] as String? ?? '',
    json['imageUrl'] as String? ?? '',
    json['needFlower'] as bool? ?? false,
  );
}

Map<String, dynamic> _$BannerConfigToJson(BannerConfig instance) =>
    <String, dynamic>{
      'type': instance.type,
      'link': instance.link,
      'webTitle': instance.webTitle,
      'imageUrl': instance.imageUrl,
      'needFlower': instance.needFlower,
    };