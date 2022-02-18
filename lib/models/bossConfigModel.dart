
import 'package:json_annotation/json_annotation.dart';
import 'package:lifeaste/common/common.dart';
import 'package:lifeaste/manager/hiveManager.dart';

part 'bossConfigModel.g.dart';

@JsonSerializable()
class BossConfigModel {
  @JsonKey(fromJson: defaultAppInfoConfig, name: 'app_info_config')
  AppInfoConfig appInfoConfig;

  BossConfigModel(this.appInfoConfig);

  factory BossConfigModel.fromJson(Map<String, dynamic> json) =>
      _$BossConfigModelFromJson(json);

  Map<String, dynamic> toJson() => fixToJson(_$BossConfigModelToJson(this));
}

@JsonSerializable()
class AppInfoConfig {
  @JsonKey(defaultValue: [])
  List<String> limitWordsScene1;
  @JsonKey(defaultValue: [])
  List<String> limitWordsScene2;
  @JsonKey(fromJson: defaultEventSaleConfig)
  EventSaleConfig eventSaleConfig;
  @JsonKey(defaultValue: [])
  List<String> hotWordList;
  @JsonKey(defaultValue: '')
  String inviteReward;
  @JsonKey(defaultValue: '')
  String beInvitedReward;

  /// 出现邀请码需要小红花
  @JsonKey(defaultValue: false)
  bool inviteCodeNeedsFlower;

  @JsonKey(defaultValue: '')
  String webLinkNew;

  /// 网页端购买页链接
  @JsonKey(defaultValue: '')
  String webPackageLink;

  /// 领取奖励小助手消息
  @JsonKey(defaultValue: '')
  String levelUpLunaWebMsg;

  //宝箱奖励领取
  @JsonKey(defaultValue: '')
  String levelUpRewardGreet;
  @JsonKey(defaultValue: '')
  String discoverBannerTitleForOldUser;
  @JsonKey(defaultValue: '')
  String discoverBannerTitleForNewUser;
  @JsonKey(defaultValue: '')
  String discoverDialogTitleForOldUser;
  @JsonKey(defaultValue: '')
  String discoverDialogTitleForNewUser;

  /// 塔罗牌解锁价格
  @JsonKey(defaultValue: 0)
  int todayTarotPrice;
  @JsonKey(defaultValue: 20)
  int generalLoveTarotPrice;
  @JsonKey(defaultValue: 50)
  int newLoveTarotPrice;
  @JsonKey(defaultValue: 50)
  int loveFortuneTarotPrice;
  @JsonKey(defaultValue: 50)
  int relationshipTarotPrice;
  @JsonKey(defaultValue: 50)
  int yesNoTarotPrice;

  /// 回复模板
  @JsonKey(defaultValue: [])
  List<String> presetReplyWords;

  /// General Situation 最大字数
  @JsonKey(defaultValue: 1500)
  int generalSituationMaxWordNum;

  /// General Situation placeholder
  @JsonKey(defaultValue: '')
  String generalSituationPlaceholder;

  /// Specific Question 最大字数
  @JsonKey(defaultValue: 200)
  int specificQuestionMaxWordNum;

  /// Specific Question placeholder
  @JsonKey(defaultValue: '')
  String specificQuestionPlaceholder;

  /// 官号auto greeting
  @JsonKey(defaultValue: '')
  String newerGreet;

  /// 申请为顾问greeting文案
  @JsonKey(defaultValue: '')
  String becomeAnAdvisorGreet;

  /// 差评文案
  @JsonKey(defaultValue: '')
  String badRatingGreet;

  /// inviteNormalShareText
  @JsonKey(defaultValue: '')
  String inviteNormalShareText;

  @JsonKey(defaultValue: '')
  String invitePosterShareText;

  @JsonKey(defaultValue: '')
  String newInvitePosterShareText;

  @JsonKey(defaultValue: 20)
  int accuracyMinCount;

  /// 顾问主页显示免费聊天入口
  @JsonKey(defaultValue: false)
  bool showFreeChatEntranceInStarPage;

  ///  绑定游戏的奖励
  @JsonKey(defaultValue: 5)
  int bindedEmailReward;

  /// 免费聊天可发自定义消息
  @JsonKey(defaultValue: false)
  bool canChatFreely;

  /// 显示顾问排行榜入口
  @JsonKey(defaultValue: false)
  bool showStarLeaderboard;

  /// 顾问排行榜链接
  @JsonKey(defaultValue: '')
  String starLeaderboardLink;

  /// 显示签到入口
  @JsonKey(defaultValue: false)
  bool showDailySignIn;

  /// 签到网页链接
  @JsonKey(defaultValue: '')
  String dailyBounsLink;

  /// 首页顾问列表banner配置
  @JsonKey(defaultValue: [])
  List<BannerConfig> bannerList;

  /// 充值界面显示跳转网页banner
  @JsonKey(defaultValue: false)
  bool showToWebsiteBannerScreen;

  /// 购买弹窗显示跳转网页Banner
  @JsonKey(defaultValue: false)
  bool showToWebsiteBannerDialog;

  @JsonKey(defaultValue: '')
  String baseLink;

  /// 往下滑N个增值服务重复显示之前看过的数量
  @JsonKey(defaultValue: 10)
  int repeatPremiumSlideCount;

  @JsonKey(defaultValue: false)
  bool iosOnlyWebsitePurchase;
  @JsonKey(defaultValue: false)
  bool showChatPurchaseBanner;

  /// 是否向后台记录普通事件点
  @JsonKey(defaultValue: true)
  bool logAppEvent;

  AppInfoConfig(
    this.limitWordsScene1,
    this.limitWordsScene2,
    this.eventSaleConfig,
    this.hotWordList,
    this.inviteReward,
    this.beInvitedReward,
    this.webLinkNew,
    this.webPackageLink,
    this.dailyBounsLink,
    this.starLeaderboardLink,
    this.levelUpLunaWebMsg,
    this.levelUpRewardGreet,
    this.discoverBannerTitleForOldUser,
    this.discoverBannerTitleForNewUser,
    this.discoverDialogTitleForOldUser,
    this.discoverDialogTitleForNewUser,
    this.todayTarotPrice,
    this.generalLoveTarotPrice,
    this.newLoveTarotPrice,
    this.relationshipTarotPrice,
    this.loveFortuneTarotPrice,
    this.yesNoTarotPrice,
    this.presetReplyWords,
    this.specificQuestionMaxWordNum,
    this.specificQuestionPlaceholder,
    this.generalSituationMaxWordNum,
    this.generalSituationPlaceholder,
    this.newerGreet,
    this.becomeAnAdvisorGreet,
    this.badRatingGreet,
    this.invitePosterShareText,
    this.inviteNormalShareText,
    this.accuracyMinCount,
    this.showFreeChatEntranceInStarPage,
    this.bindedEmailReward,
    this.canChatFreely,
    this.showStarLeaderboard,
    this.showDailySignIn,
    this.bannerList,
    this.showToWebsiteBannerScreen,
    this.showToWebsiteBannerDialog,
    this.newInvitePosterShareText,
    this.iosOnlyWebsitePurchase,
    this.inviteCodeNeedsFlower,
    this.baseLink,
    this.repeatPremiumSlideCount,
    this.showChatPurchaseBanner,
    this.logAppEvent,
  );

  factory AppInfoConfig.fromJson(Map<String, dynamic> json) =>
      _$AppInfoConfigFromJson(json);

  Map<String, dynamic> toJson() => fixToJson(_$AppInfoConfigToJson(this));
}

@JsonSerializable()
class EventSaleConfig {
  @JsonKey(defaultValue: '')
  String saleId;
  @JsonKey(defaultValue: '')
  String title;
  @JsonKey(defaultValue: '')
  String subTitle;
  @JsonKey(defaultValue: '')
  String imageUrl;
  @JsonKey(defaultValue: 0)
  int startTime;
  @JsonKey(defaultValue: 0)
  int endTime;
  @JsonKey(defaultValue: 0.0)
  double textOff;
  @JsonKey(defaultValue: 0.0)
  double audioOff;
  @JsonKey(defaultValue: 0.0)
  double videoOff;
  @JsonKey(defaultValue: 0.0)
  double textCallOff;
  @JsonKey(defaultValue: 0.0)
  double audioCallOff;
  @JsonKey(defaultValue: 0.0)
  double videoCallOff;

  EventSaleConfig(
    this.saleId,
    this.title,
    this.subTitle,
    this.imageUrl,
    this.startTime,
    this.endTime,
    this.textOff,
    this.audioOff,
    this.videoOff,
    this.textCallOff,
    this.audioCallOff,
    this.videoCallOff,
  );

  factory EventSaleConfig.fromJson(Map<String, dynamic> json) =>
      _$EventSaleConfigFromJson(json);

  Map<String, dynamic> toJson() => fixToJson(_$EventSaleConfigToJson(this));
}

const String BannerConfigType_none = 'none';
const String BannerConfigType_openLinkInApp = 'openLinkInApp';
const String BannerConfigType_openLinkOutside = 'openLinkOutside';
const String BannerConfigType_toPremiumService = 'toPremiumService';
const String BannerConfigType_toPurchasePage = 'toPurchasePage';
const String BannerConfigType_toStoreRate = 'toStoreRate';
const String BannerConfigType_toStarLeaderboard = 'toStarLeaderboard';

///banner跳转链接里需要替换的部分
const String LinkPattern_session = '<==session==>';
const String LinkPattern_userInfo = '<==userInfo==>';

@JsonSerializable()
class BannerConfig {
  @JsonKey(defaultValue: '')
  String type;
  @JsonKey(defaultValue: '')
  String link;
  @JsonKey(defaultValue: '')
  String webTitle;
  @JsonKey(defaultValue: '')
  String imageUrl;
  @JsonKey(defaultValue: false)
  bool needFlower;

  BannerConfig(
      this.type, this.link, this.webTitle, this.imageUrl, this.needFlower);

  factory BannerConfig.fromJson(Map<String, dynamic> json) =>
      _$BannerConfigFromJson(json);

  Map<String, dynamic> toJson() => fixToJson(_$BannerConfigToJson(this));

  bool canAhead() {
    return !needFlower || getFlower();
  }
}

AppInfoConfig defaultAppInfoConfig(var value) {
  if (value == null) {
    return AppInfoConfig.fromJson({});
  }
  return AppInfoConfig.fromJson(value);
}

EventSaleConfig defaultEventSaleConfig(var value) {
  if (value == null) {
    return EventSaleConfig.fromJson({});
  }
  return EventSaleConfig.fromJson(value);
}
