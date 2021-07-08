import 'dart:core';
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lifeaste/common/colors.dart';
import 'package:lifeaste/common/strings.dart';
import 'package:lifeaste/common/tools.dart';
import 'package:lifeaste/common/typicalKeys.dart';
import 'package:lifeaste/logic/global.dart';
import 'package:lifeaste/manager/BossManager.dart';
import 'package:lifeaste/manager/hiveManager.dart';
import 'package:lifeaste/models/rewardModel.dart';
import 'package:lifeaste/models/tarotModel.dart';

import 'orderModel.dart';

part 'userModel.g.dart';

//flutter packages pub run build_runner watch
//flutter packages pub run build_runner build

//flutter packages pub run build_runner build --delete-conflicting-outputs

const int GenderTypeUnknown = 0;
const int GenderTypeMale = 1;
const int GenderTypeFemale = 2;

const int OnlineModeOffline = 0;
const int OnlineModeOnline = 1;
const int OnlineModeBusy = 2;

const int StarStatusUnchecked = 0;
const int StarStatusApproved = 1;
const int StarStatusDisapproved = 2;

const int WorkStatusAbsent = 0; //休假状态，自己可修改
const int WorkStatusAvailable = 1; //可接单状态
const int WorkStatusPunished = 2; //被惩罚状态，自己无法修改

const String AppProductStar = 'answer-star';
const String AppProductLifeaste = 'genescope';
// const String AppProductLifeaste = 'lifeaste';

const String UserPlatformAndroid = 'android';
const String UserPlatformIos = 'ios';

const int NotifyNever = 0;
const int NotifyOnlyOneTime = 1;
const int NotifyAlways = 2;

//用户信息
@JsonSerializable()
class UserInfoModel {
  //身份信息
  @JsonKey(defaultValue: '')
  String identify;
  @JsonKey(defaultValue: false)
  bool isAdmin;

  /// loginType字段在绑定账号时不会改变
  /// 游客登录的时候 loginType=guestLogin ，然后用apple登录绑定了一个真实账号，返回的用户信息里 loginType 还是 guestLogin
  /// logout之后，用这个apple账号重新登录，loginType会恢复，loginType=Apple
  /// 增加lastLoginType来记录最新登录方式，只有新的绑定账号才会有这个字段，其他情况还是使用loginType
  @JsonKey(defaultValue: '')
  String loginType;
  @JsonKey(defaultValue: '')
  String lastLoginType;

  @JsonKey(defaultValue: '')
  String loginId;
  @JsonKey(defaultValue: '')
  String userId;

  @JsonKey(defaultValue: 0)
  int createTime;

  //用户基本展示信息
  @JsonKey(defaultValue: '')
  String avatar;
  @JsonKey(defaultValue: '')
  String name;
  @JsonKey(defaultValue: '')
  String bio;
  @JsonKey(defaultValue: '')
  String about;
  @JsonKey(defaultValue: '')
  String birthday;
  @JsonKey(defaultValue: GenderTypeUnknown)
  int gender;

  //用户附加信息
  @JsonKey(defaultValue: '')
  String realName;
  @JsonKey(defaultValue: '')
  String xmppPwd; //xmpp登录密码
  @JsonKey(defaultValue: '')
  String email;

  /// 用户今天有没有签到奖励，没签到就有
  @JsonKey(defaultValue: true)
  bool dailyBonus;

  /// 用户的兴趣标签,用来推荐神婆
  @JsonKey(defaultValue: [])
  List<String> interestTags;

  /// 用户神婆category,用来推荐神婆
  @JsonKey(defaultValue: [])
  List<String> interestCategories;

  /// 用户喜欢的表达方式,用来推荐神婆
  @JsonKey(defaultValue: -1)
  int expressionWay;

  /// 用户喜欢的神婆等级,用来推荐神婆
  @JsonKey(defaultValue: -1)
  int starExperience;

  /// 非实时订单数量，为0时可享受首单优惠，后台直接打折
  @JsonKey(defaultValue: 0)
  int nrtOrderCount;

  /// 完成实时订单数量，如果没有这个字段或者值为0表示没有完成过实时订单
  @JsonKey(defaultValue: 0)
  int rtOrderCompleted;

  @JsonKey(defaultValue: "")
  String assistantId; // 小助手
  @JsonKey(defaultValue: 0)
  int showRank;
  @JsonKey(defaultValue: "")
  String adChannel;

  /// user/load接口会更新
  @JsonKey(defaultValue: '')
  String appVersion;

  /// user/load接口会更新
  @JsonKey(defaultValue: '')
  String platform;

  /// 注册之后就不会变
  @JsonKey(defaultValue: '')
  String product;

  //金币相关
  @JsonKey(defaultValue: 0)
  int coin;
  @JsonKey(defaultValue: 0.0)
  double totalCost;
  @JsonKey(defaultValue: [])
  List<RewardModel> awards; //未领取的用户奖励
  @JsonKey(defaultValue: 0)
  int pearl;

  ///免费解锁love塔罗牌的次数
  @JsonKey(defaultValue: 0)
  int loveTarotTickets;
  @JsonKey(defaultValue: 0)
  int loveFortuneTarotTickets;
  @JsonKey(defaultValue: 0)
  int newLoveTarotTickets;
  @JsonKey(defaultValue: 0)
  int relationshipTarotTickets;
  @JsonKey(defaultValue: 0)
  int yesOrNoTarotTickets;

  /// 三分钟免费次数，放薅羊毛，限定设备
  /// 新用户创建之后，会有该字段，如果是新设备值就是1，如果是老设备值就是0
  /// 客户端判断用户是否有三分钟免费的逻辑，
  /// 1.有threeMinutesTickets字段，看值是否大于0
  /// 2.没有这个字段，说明是之前的用户，老用户的判定逻辑不变（没有完成实时订单）
  int? threeMinutesTickets;

  //用户关系
  @JsonKey(defaultValue: false)
  bool isBlockingHim;
  @JsonKey(defaultValue: false)
  bool isBlockingMe;

  ///收藏该用户
  @JsonKey(defaultValue: false)
  bool favorite;

  /// 我填写的邀请码对应的用户userId
  @JsonKey(defaultValue: '')
  String inviterId;

  /// 我的邀请码
  @JsonKey(defaultValue: '')
  String inviteCode;

  /// 填写我的邀请码的用户个数
  @JsonKey(defaultValue: 0)
  int inviteCount;

  //神婆附加信息
  @JsonKey(defaultValue: '')
  String orderInstruction;
  @JsonKey(defaultValue: '')
  String coverImage;
  @JsonKey(defaultValue: '')
  String autoMessage;
  @JsonKey(defaultValue: '')
  String coverVideo; //1.5新增背景视频
  @JsonKey(defaultValue: '')
  String featureCover;
  @JsonKey(defaultValue: Strings.liveAutoMessage)
  String liveAutoMessage;

  //神婆管理
  @JsonKey(defaultValue: 0)
  int hot;
  @JsonKey(defaultValue: 0)
  int level;
  @JsonKey(defaultValue: StarStatusUnchecked)
  int approved;
  @JsonKey(defaultValue: [])
  List<ServiceInfoModel> availableService;
  @JsonKey(defaultValue: [])
  List<PremiumService> premiumServices;
  @JsonKey(defaultValue: [])
  List<String> goodAtCategories;
  @JsonKey(defaultValue: 0)
  double accuracy;
  @JsonKey(defaultValue: 0)
  int accuracyCount;
  @JsonKey(defaultValue: 5.0)
  double rate;
  @JsonKey(defaultValue: 0)
  int orderCount;

  /// 已完成订单数，包括实时、非实时、增值服务
  @JsonKey(defaultValue: 0)
  int orderCompleted;
  @JsonKey(defaultValue: 0)
  int orderExpired;
  @JsonKey(defaultValue: 0)
  int commentCount;

  ///平均回复等待时间
  ///第一个数字代表平均时间(ms)，第二个数字代表计算平均时间的订单数量，神婆回复订单的时候自动机算
  @JsonKey(defaultValue: [0, 0])
  List<int> avgDeliverTime;

  ///开启加急服务的type
  @JsonKey(defaultValue: [])
  List<int> quickReadingMode;

  ///follow-up的截止时间，orderModel里也有一样的字段，值是一样的
  @JsonKey(defaultValue: 0)
  int followUpDeadline;

  @JsonKey(defaultValue: WorkStatusAbsent)
  int workStatus;
  @JsonKey(defaultValue: OnlineModeOffline)
  int liveStatus; //在线服务状态，有离线、在线、正忙三种状态
  // @JsonKey(ignore: true)
  // int onlineMode = OnlineModeOffline;

  @JsonKey(defaultValue: 0)
  int notifyType;

  UserInfoModel(
    this.isAdmin,
    this.followUpDeadline,
    this.interestCategories,
    this.autoMessage,
    this.starExperience,
    this.threeMinutesTickets,
    this.interestTags,
    this.expressionWay,
    this.identify,
    this.userId,
    this.assistantId,
    this.avatar,
    this.name,
    this.bio,
    this.about,
    this.coverImage,
    this.birthday,
    this.gender,
    this.orderInstruction,
    this.realName,
    this.appVersion,
    this.platform,
    this.product,
    this.availableService,
    this.premiumServices,
    this.accuracy,
    this.accuracyCount,
    this.rate,
    this.orderCount,
    this.orderCompleted,
    this.orderExpired,
    this.commentCount,
    this.coin,
    this.totalCost,
    this.loveTarotTickets,
    this.newLoveTarotTickets,
    this.loveFortuneTarotTickets,
    this.relationshipTarotTickets,
    this.yesOrNoTarotTickets,
    this.loginType,
    this.lastLoginType,
    this.loginId,
    this.xmppPwd,
    this.createTime,
    this.approved,
    this.goodAtCategories,
    this.level,
    this.hot,
    this.pearl,
    this.workStatus,
    this.liveStatus,
    this.email,
    this.coverVideo,
    this.featureCover,
    this.awards,
    this.nrtOrderCount,
    this.rtOrderCompleted,
    this.adChannel,
    this.showRank,
    this.notifyType,
    this.inviterId,
    this.inviteCode,
    this.inviteCount,
    this.avgDeliverTime,
    this.quickReadingMode,
    this.dailyBonus,
    this.isBlockingHim,
    this.isBlockingMe,
    this.favorite,
    this.liveAutoMessage,
  );

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);

  Map<String, dynamic> toJson() => fixToJson(_$UserInfoModelToJson(this));

  bool isNormalUser() {
    return !(this.identify == TypicalKeys.roleIdentify_star);
  }

  bool isDebugUser() {
    if (lastLoginType.isNotEmpty == true) {
      return lastLoginType == TypicalKeys.loginType_debug;
    }
    return loginType == TypicalKeys.loginType_debug;
  }

  bool isGuest() {
    if (lastLoginType.isNotEmpty == true) {
      return lastLoginType == TypicalKeys.loginType_guest;
    }
    return loginType == TypicalKeys.loginType_guest;
  }

  bool isOfficialSupport() {
    return userId == TypicalKeys.officialAccountUserId;
  }

  bool isSoulOfficialSupport() {
    return userId == TypicalKeys.soulAccountUserId;
  }

  bool isAssistantIdSupport() {
    if (Global.userLogic().state.user.assistantId.isNotEmpty) {
      return userId == Global.userLogic().state.user.assistantId;
    }
    return false;
  }

  bool needShowLiveStatus() {
    if (isOfficialSupport() ||
        isAssistantIdSupport() ||
        isSoulOfficialSupport()) {
      return false;
    }
    //关停 灰点 文案absent
    if (workStatus == WorkStatusAbsent) {
      return true;
    }
    //离线 offline 没有文案没有点
    if (liveStatus == OnlineModeOffline) {
      return false;
    }
    // 在线 文案online 绿点
    // 正忙 文案busy 红点
    return true;
  }

  /// 准确度，默认是99%，最高是99%
  int accurateRate() {
    if (accuracyCount == 0) {
      return 99;
    }
    return min((accuracy * 100).toInt(), 99);
  }

  int onTimeRate() {
    if (orderExpired == 0 || orderCount == 0) {
      return 100;
    }
    return ((1 - orderExpired / orderCount) * 100).toInt();
  }

  ///平均回复等待时间，小时
  double avgDeliverHour() {
    return avgDeliverTime.first / 1000 / 3600;
  }

  //显示top accuracy标志
  bool isTopAccuracy() {
    return this.accuracy >= 0.9 &&
        this.accuracyCount >=
            BossManager.instance.bossConfig.appInfoConfig.accuracyMinCount;
  }

  //在神婆主页显示准确度数值
  bool canShowAccuracy() {
    return this.accuracy >= 0.9 && this.accuracyCount >= 1;
  }

  ServiceInfoModel? serviceModelWithType(ServiceType serviceType) {
    if (this.availableService.isNotEmpty) {
      for (ServiceInfoModel model in this.availableService) {
        if (model.type == serviceType.index) {
          return model;
        }
      }
    }
    return null;
  }

  String approvedStatus() {
    switch (approved) {
      case 0:
        {
          return 'Unchecked';
        }
      case 1:
        {
          return 'Approved';
        }
      case 2:
        {
          return 'Disapproved';
        }
      default:
        {
          return 'Unknown';
        }
    }
  }

  //用于判断当前神婆是否折扣
  bool isFollowUpPeriod() {
    //关停的神婆不显示折扣
    return followUpDeadline > DateTime.now().millisecondsSinceEpoch &&
        workStatus == WorkStatusAvailable;
  }

  String workStatusDesc() {
    if (workStatus == WorkStatusAvailable) {
      return Strings.inService;
    } else {
      return Strings.outOfService;
    }
  }

  // 是否有为领取的奖励
  List<RewardModel> levelUpRewards() {
    List<RewardModel> result = [];
    for (RewardModel model in awards) {
      if (model.type == REWARD_LEVEL_UP_REWARD ||
          model.type == REWARD_LEVEL_UP_MANUALLY_REWARD ||
          model.type == REWARD_SUPER_POTENTIAL_AWARD ||
          model.type == REWARD_COMMEN_POTENTIAL_AWARD) {
        result.add(model);
      }
    }
    return result;
  }

  ///存在邀请用户得的奖励
  bool existInviteUserReward() {
    for (RewardModel model in awards) {
      if (model.type == REWARD_TYPE_INVITE_USER) {
        return true;
      }
    }
    return false;
  }

  ///被邀请的奖励
  RewardModel? beInvitedReward() {
    for (RewardModel model in awards) {
      if (model.type == REWARD_TYPE_BE_INVITED) {
        return model;
      }
    }
    return null;
  }

  /// 是否能显示邀请码
  /// 条件：充值过、邀请码已生成
  /// 需要小红花的话，就不需要完成订单
  /// 不需要小红花的话，需要完成订单
  bool canShowInviteCode() {
    if (BossManager.instance.bossConfig.appInfoConfig.inviteCodeNeedsFlower) {
      if (getFlower()) {
        return totalCost > 0 && inviteCode.isNotEmpty;
      }
      return false;
    } else {
      return totalCost > 0 && orderCompleted >= 1 && inviteCode.isNotEmpty;
    }
  }

  ///已经领取了被邀请的奖励
  bool hasClaimedBeInviteReward() {
    //达到了领取奖励的要求，待领奖励里不存在对应奖励，则表示已领取
    if (totalCost > 0 && inviterId.isNotEmpty && beInvitedReward() == null) {
      return true;
    }
    return false;
  }

  double reviewRate() {
    if (rate <= 0 || rate > 5) {
      return 5.0;
    }
    return double.parse(rate.toStringAsFixed(1));
  }

  ///神婆版本1.3开始，用户端下单后可以添加订单附加信息
  bool supportOrderAdditionInfoByUser() {
    return product == AppProductStar && versionCompare(appVersion, '1.3') >= 0;
  }

  ///神婆iOS1.5 Android1.4开始，添加了更长的push铃声文件
  bool supportLongPushRing() {
    if (Platform.isIOS) {
      return product == AppProductStar &&
          versionCompare(appVersion, '1.5') >= 0;
    } else {
      return product == AppProductStar &&
          versionCompare(appVersion, '1.4') >= 0;
    }
  }

  ///支持收发聊天图片信息
  bool supportImgMsg() {
    return true;
  }

  int nonRealtimeNotifyType() {
    return notifyType ~/ 3;
  }

  int realtimeNotifyType() {
    return notifyType % 3;
  }

  int accountCreateDays() {
    return 1 +
        Duration(
                milliseconds:
                    (DateTime.now().millisecondsSinceEpoch - createTime))
            .inDays;
  }

  ///某服务能否加急
  ///条件：神婆quick mode设置中打开了该类型
  bool canRushService(int serviceType) {
    for (int obj in quickReadingMode) {
      if (serviceType == obj) {
        return true;
      }
    }
    return false;
  }

  String liveStatusStr() {
    if (workStatus == WorkStatusAbsent) {
      return Strings.absent;
    }
    switch (liveStatus) {
      case OnlineModeOnline:
        {
          return Strings.online;
        }
      case OnlineModeBusy:
        {
          return Strings.busy;
        }
      default:
        return '';
    }
  }

  Color liveStatusColor() {
    if (workStatus != WorkStatusAvailable) {
      return GlobalColors.grey166;
    }
    switch (liveStatus) {
      case OnlineModeOnline:
        {
          return GlobalColors.online;
        }
      case OnlineModeBusy:
        {
          return GlobalColors.busy;
        }
      default:
        return Colors.transparent;
    }
  }

  String avgDeliverHourStr() {
    if (avgDeliverHour() > 0) {
      if (avgDeliverHour() < 1) {
        //显示分钟
        int min = (avgDeliverHour() * 60).ceil();
        if (min <= 1) {
          min = 1;
        }
        return '${min}min';
      } else {
        //显示小时
        return '${avgDeliverHour().toStringAsFixed(1)}hr';
      }
    }

    return '12hr'; // 默认显示12hr
  }

  int tarotUnlockTimes(TarotType type) {
    int count = 0;
    switch (type) {
      case TarotType.today:
        {
          count = 0;
          break;
        }
      case TarotType.generalLove:
        {
          count = loveTarotTickets;
          break;
        }
      case TarotType.yesOrNo:
        {
          count = yesOrNoTarotTickets;
          break;
        }
      case TarotType.loveFortune:
        {
          count = loveFortuneTarotTickets;
          break;
        }
      case TarotType.relationship:
        {
          count = relationshipTarotTickets;
          break;
        }
      case TarotType.newLove:
        {
          count = newLoveTarotTickets;
          break;
        }
      default:
        {}
    }
    return count;
  }

  ServiceInfoModel? textCallService() {
    return serviceModelWithType(ServiceType.serviceTypeTextCall);
  }

  /// 是否能向该神婆发起免费聊天
  bool canChatFree() {
    if (isNormalUser()) return false;
    if (liveStatus != OnlineModeOnline || workStatus != WorkStatusAvailable)
      return false;
    if (!Global.userLogic().canFreeChat3min()) return false;
    return textCallService() != null;
  }

  List<ServiceInfoModel> readingServices() {
    List<ServiceInfoModel> list = List.from(availableService);
    list.removeWhere((element) => element.isRealTime());
    return list;
  }

  List<ServiceInfoModel> realtimeServices() {
    List<ServiceInfoModel> list = List.from(availableService);
    list.removeWhere((element) => !element.isRealTime());
    return list;
  }

  /// 是否有除了非实时订单以外的服务
  bool hasExtraService() {
    return (premiumServices.isNotEmpty || realtimeServices().isNotEmpty);
  }

  /// 该神婆的live text折扣券
  /// 实付价格 = 原价 * 返回值
  /// 可叠加其他折扣
  double textCallCoupon() {
    if (isNormalUser()) return 1;
    bool coupon = getLiveTextCallCoupon(userId);
    return coupon ? 0.75 : 1;
  }
}
