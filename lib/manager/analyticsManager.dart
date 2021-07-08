
import 'package:lifeaste/models/orderModel.dart';
import 'package:lifeaste/models/userModel.dart';

class AnalyticsManager {
  static AnalyticsManager get instance => _getInstance();
  static AnalyticsManager? _instance;
  // AppsflyerSdk appsflyerSdk;

  static AnalyticsManager _getInstance() {
    var obj = _instance ?? AnalyticsManager();
    if (_instance == null) {
      _instance = obj;
    }
    return obj;
  }

  Future<void> initAppsFlyer() async {
    // AppsFlyerOptions options = AppsFlyerOptions(
    //   afDevKey: TypicalKeys.appsflyerDevKey,
    //   showDebug: isDebug(),
    //   appId: TypicalKeys.appId_IOS,
    // );
    // if(Platform.isIOS) {
    //   IosDeviceInfo iOSInfo = await DeviceInfoPlugin().iosInfo;
    //   if (iOSInfo.systemVersion.compareTo('14.0') >= 0) {
    //     print("iOS 版本大于14");
    //     TypicalKeys.methodChannel.invokeMethod(
    //         methodNameRequestAccessATTracking);
    //     options = AppsFlyerOptions(
    //         afDevKey: TypicalKeys.appsflyerDevKey,
    //         showDebug: isDebug(),
    //         appId: TypicalKeys.appId_IOS,
    //         timeToWaitForATTUserAuthorization: 60
    //     );
    //   } else {
    //     print("iOS 版本小于14");
    //   }
    // }
    // _instance.appsflyerSdk = AppsflyerSdk(options);
  }

  logAfEvent(String name, {Map<String, dynamic>? parameters}) async {

  }

  logEvent(String name, {
    double valueToSum = 0,
    Map<String, dynamic>? parameters,
  }) async {

  }

  /// 咱们后台自己记录的打点
  /// 第三方平台的打点也一起记录
  logInternalEvent(String name, {Map<String, dynamic>? parameters, String? orderId, bool? success, String? error, String? message, int? duration}) async {

  }

  //service点击统计
  clickServiceType(UserInfoModel star, ServiceInfoModel service, String from) {

  }
}

///咱们后台自己记录的打点
//创建通话订单
const String IEN_LiveChat_CreateOrder = 'LiveChat_CreateOrder';
//创建通话订单失败
const String IEN_LiveChat_CreateOrder_Failed = 'LiveChat_CreateOrder_Failed';
//给神婆发通话push
const String IEN_LiveChat_Push = 'LiveChat_Push';
//响铃页开始计时
const String IEN_LiveChat_StartTimer = 'LiveChat_StartTimer';
//发送通话xmpp消息
const String IEN_LiveChat_SendCallMsg = 'LiveChat_SendCallMsg';
//开房，语音或视频通话获取agora channel key请求失败
const String IEN_LiveChat_AgoraKey_Failed = 'LiveChat_AgoraKey_Failed';
//收到神婆回复的Active push
const String IEN_LiveChat_StarActive = 'LiveChat_StarActive';
//收到神婆busy消息
const String IEN_LiveChat_Busy = 'LiveChat_Busy';
//收到神婆拒绝通话消息
const String IEN_LiveChat_Decline = 'LiveChat_Decline';
//取消通话
const String IEN_LiveChat_Cancel = 'LiveChat_Cancel';
//取消通话请求失败
const String IEN_LiveChat_Cancel_Failed = 'LiveChat_Cancel_Failed';
//响铃等待超时
const String IEN_LiveChat_Timeout = 'LiveChat_Timeout';
//发送结束通话xmpp消息
const String IEN_LiveChat_SendEndMsg = 'LiveChat_SendEndCall';
//收到确认通话消息
const String IEN_LiveChat_ReceiveConfirmMsg = 'LiveChat_ReceiveConfirmMsg';
//回复确认通话消息
const String IEN_LiveChat_ReplyConfirmMsg = 'LiveChat_ReplyConfirmMsg';
//神婆接听
const String IEN_LiveChat_ReceiveAcceptMsg = 'LiveChat_ReceiveAcceptMsg';
//进入聊天页
const String IEN_LiveChat_ChatPage = 'LiveChat_ChatPage';
//前台收到push
const String IEN_ReceivePushForeground = 'ReceivePushForeground';
//后台收到push
const String IEN_ReceivePushBackground = 'ReceivePushBackground';
//app杀死后点击push进app
const String IEN_ClickPushLaunchApp = 'ClickPushLaunchApp';
//app在后台时点击push进app
const String IEN_ClickPushResumeApp = 'ClickPushResumeApp';
//登出
const String IEN_Logout = 'Logout';
//由于ping对方timeout次数过多而挂断电话
const String IEN_LiveChat_EndByPingFail = 'LiveChat_EndByPingFail';

///第三方平台记录的点
//启动
const String EventName_LaunchApp = 'LaunchApp';
const String EventName_NewLaunchApp = 'NewLaunchApp';
const String EventName_OpenApp = 'OpenApp';
const String EventName_LoginPageShow = 'LoginPageShow';
const String EventName_LoginMethodClick = 'LoginMethodClick';
const String EventName_LoginSuccess = 'LoginSuccess';

//mine
const String EventName_MeTabShow = 'MeTabShow';
const String EventName_MeCoinBannerClick = 'MeCoinBannerClick';
const String EventName_EnterProfile = 'EnterProfile';
const String EventName_FeedbackClick = 'FeedbackClick';
const String EventName_LogoutClick = 'LogoutClick';
const String EventName_LogoutSuccess = 'LogoutSuccess';

const String EventName_PurchaseCoinShow = 'PurchaseCoinShow';
const String EventName_PurchaseCoinClick = 'PurchaseCoinClick';
const String EventName_PurchaseCoinSuccess = 'PurchaseCoinSuccess';

const String EventName_AdvisorTabShow = 'AdvisorTabShow';

/*
1.7新增参数from：all=神婆列表all版块；rencent_viewed=神婆列表最新浏览版块；
for_you=神婆列表推荐版块；
best_match=神婆匹配页面；
order_submit_success=下单成功页面推荐神婆;
live=在线神婆；
staff_pick=所有神婆；
feature=feature神婆；
message=与神婆聊天页面点击神婆头像；
order_detail=订单详情点击神婆头像
*/
const String EventName_AdvisorProfilePageShow = 'AdvisorProfilePageShow';
const String EventName_ReportAdvisorShow = 'ReportAdvisorShow';
const String EventName_ReportAdvisorClick = 'ReportAdvisorClick';

/*
follow_up & first_reading 都只有非实时订单才生效
新增参数订单折扣情况offer：follow_up=followup订单；normal=普通订单；first_reading=首单折扣；theme=主题折扣
新增参数from：advisor_card=神婆个人主页；order_ask=订单详情页咨询入口;advisor_card_ask神婆个人主页右上角咨询入口
*/
const String EventName_ServiceTypeClick = 'ServiceTypeClick';
const String EventName_NewUserRechargeOfferBannerShow =
    'NewUserRechargeOfferBannerShow';
const String EventName_NewUserRechargeOfferBannerClick =
    'NewUserRechargeOfferBannerClick';

//order
const String EventName_OrderTabShow = 'OrderTabShow';
const String EventName_OrderDetailShow = 'OrderDetailShow';
const String EventName_OrderDetailAskAgainPopup = 'OrderDetailAskAgainPopup';
const String EventName_OrderDetailAskAgainClick = 'OrderDetailAskAgainClick';
const String EventName_DownOrderVideo = 'DownOrderVideo';
const String EventName_NonLiveOrderRequestShow = 'NonLiveOrderRequestShow';
const String EventName_SumbitOrderRequest = 'SumbitOrderRequest';
const String EventName_SumbitOrderRequestSuccess = 'SumbitOrderRequestSuccess';
const String EventName_LiveOrderDurationShow = 'LiveOrderDurationShow';
const String EventName_LiveOrderStartChartClick = 'LiveOrderStartChartClick';
const String EventName_CancelLiveOrder = 'CancelLiveOrder';
const String EventName_StartLiveOrder = 'StartLiveOrder';
const String EventName_FinishLiveOrder = 'FinishLiveOrder';
const String EventName_ExpiredLiveOrder = 'ExpiredLiveOrder';
const String EventName_NonLiveOrderAttachPicture = 'NonLiveOrderAttachPicture';
const String EventName_NonLiveOrderAttachPictureSuccess =
    'NonLiveOrderAttachPictureSuccess';
const String EventName_NonLiveOrderDeletePicture = 'NonLiveOrderDeletePicture';
const String EventName_NonLiveOrderZoomPicture = 'NonLiveOrderZoomPicture';

const String EventName_ReviewEntranceShow = 'ReviewEntranceShow';
const String EventName_ReviewClick = 'ReviewClick';
const String EventName_SubmitReviewSuccess = 'SubmitReviewSuccess';
const String EventName_EnterTipPage = 'EnterTipPage';
const String EventName_SelectTipSubmit = 'SelectTipSubmit';
const String EventName_SubmitTipSuccess = 'SubmitTipSuccess';

const String EventName_SearchOrderClick = "OderSearch";

const String EventName_OrderResultShow = "OrderResultShow";

/*

粘贴历史订单	PasteLastOrder
follow-up促销banner展示	FollowUpBannerShow
点击follow-up订单咨询	FollowUpServiceClick	value:advisor_page=神婆页面；askagain_popup=再次咨询弹窗
follow-up订单下单成功	FollowUpServiceSubmitSuccess	value:advisor_page=神婆页面；askagain_popup=再次咨询弹窗
查看追问订单	ViewOrderAsk
回复追问订单	ReplyOrderAsk
*/

const String EventName_PasteLastOrder = "PasteLastOrder";
const String EventName_FollowUpBannerShow = "FollowUpBannerShow";
const String EventName_FollowUpServiceClick = "FollowUpServiceClick";
const String EventName_FollowUpServiceSubmitSuccess =
    "FollowUpServiceSubmitSuccess";
const String EventName_ViewOrderAsk = "ViewOrderAsk";
const String EventName_ReplyOrderAsk = "ReplyOrderAsk";

//message
const String EventName_MessagePageShow = 'MessagePageShow';
const String EventName_BlockWordReminderShow = 'BlockWordReminderShow';
const String EventName_BlockWordReminderClick = 'BlockWordReminderClick';
const String EventName_GenescopeMessageFAQ = "GenescopeMessageFAQ";


const String EventName_SearchOrderSuccess = "SearchOrderSuccess";



//parameters
const String Param_Type = 'type';
const String Param_Reason = 'reason';
const String Param_Result = 'result';
const String Param_Where = 'where';
const String Param_Offer = 'offer';

const String ParamOffer_FollowUp = 'follow_up';
const String ParamOffer_Normal = 'normal';

const String ParamBuyWhere_AwaitTextChat = 'await_text_chat';
const String ParamBuyWhere_AwaitAgoraChat = 'await_agora_chat';
const String ParamBuyWhere_SubmitOrder = 'submit_order';
const String ParamBuyWhere_MeBanner = 'me_banner';
const String ParamBuyWhere_SubmitOrderBuy = 'submit_order_buy';
const String ParamBuyWhere_LiveChatPage = 'live_chat_page';
const String ParamBuyWhere_Tip = 'tip';
const String ParamBuyWhere_NewerBanner = 'newuser_recharge_banner';
const String ParamBuyWhere_Push = 'push';
const String ParamBuyWhere_SubmitPremiumOrder = "submit_premium_order";
const String ParamBuyWhere_ChatEnded = 'chat_ended';
const String ParamBuyWhere_ChatNotice = 'chat_notice';
const String ParamBuyWhere_VideoNotice = 'video_notice';
const String ParamBuyWhere_AudioNotice = 'audio_notice';
const String ParamBuyWhere_StarListBanner = 'star_list_banner';

const String ParamLevelRewardWhere_Message = "message";
const String ParamLevelRewardWhere_Bubble = "bubble";

/// 神婆主页服务项
const String ParamFromAdvisorCard = 'advisor_card';
/// for you板块
const String ParamFromForYou = 'for_you';
/// 订单详情页服务弹窗
const String ParamFromOrderAsk = 'order_ask';
/// 神婆列表卡片按钮点出的弹窗
const String ParamFromAdvisorCardAsk = 'advisor_card_ask';
/// 非实时聊天页右上角服务弹窗
const String ParamFromChatAsk = 'chat_ask';
/// 神婆主页上滑之后底下的按钮出服务弹窗
const String ParamFromAdvisorPageConnect = 'advisor_page_connect';

const String ParamFromPremiumTab = 'premium_tab';

const String ParamFromPremiumSearch = 'premium_search';

const String StatusSortClick = "StatusSortClick";
const String StatusSortSuccess = "StatusSortSucces";
const String InAppPushShow = "InAppPushShow";

// 开屏
const String NewGuidePageShow = "NewGuidePageShow";
const String NewGuidePageSkip = "NewGuidePageSkip";
const String NewGuidePageGetStarted = "NewGuidePageGetStarted";

// 提醒打开通知页面
const String TurnOnPushPageShow = "TurnOnPushPageShow";
const String TurnOnPushPageEnable = "TurnOnPushPageEnable";
const String TurnOnPushPageLater = "TurnOnPushPageLater";
const String AllowPush = "AllowPush";
const String TurnOnPushBannerShow = "TurnOnPushBannerShow";
const String TurnOnPushBannerClose = "TurnOnPushBannerClose";
const String TurnOnPushBannerClick = "TurnOnPushBannerClick";

// 用户奖励入口
const String LevelRewardShow = "LevelRewardShow";
const String LevelRewardClick = "LevelRewardClick";
const String ClaimLevelRewardSuccess = "ClaimLevelRewardSuccess";

//用户选择标签

//from:new=新用户；find_new_match=神婆列表for u版块点击match；get_match=神婆列表点击get matched
const String SelectTagPageShow = 'SelectTagPageShow';

//from:new=新用户；find_new_match=神婆列表for u版块点击match；get_match=神婆列表点击get matched
const String SelectTagPageClose = 'SelectTagPageClose';

const String BestMatchPageShow = 'BestMatchPageShow';
const String FindNewMatchClick = 'FindNewMatchClick';
const String AdvisorGetMatchedClick = 'AdvisorGetMatchedClick';

const String SubmitOrderSuccessPageShow = 'SubmitOrderSuccessPageShow';
const String SubmitOrderSuccessDetailsClick = 'SubmitOrderSuccessDetailsClick';

const String EnterAllAdvisor = 'EnterAllAdvisor';

//屏蔽神婆消息成功
const String BlockAdvisorMessageSuccess = 'BlockAdvisorMessageSuccess';
//回复接收神婆消息成功
const String UnblockAdvisorMessageSuccess = 'UnblockAdvisorMessageSuccess';

//首充优惠70Credits展示
//参数from：page=充值页面；popup=充值弹窗；live_order=实时订单补充金币页面
const String FirstRechargeOfferShow = 'FirstRechargeOfferShow';
//首充优惠点击购买70Credits
//参数from：page=充值页面；popup=充值弹窗；live_order=实时订单补充金币页面
const String FirstRechargeOfferPurchase = 'FirstRechargeOfferPurchase';
//首充优惠购买70Credits成功
//参数from：page=充值页面；popup=充值弹窗；live_order=实时订单补充金币页面
//该点已废弃。打点逻辑错误，只打了ios，并且每次购买都打
const String FirstRechargeOfferPurchaseSuccess =
    'FirstRechargeOfferPurchaseSuccess';

//点击咨询方式失败
//value：busy=神婆忙；not_ready=神婆关闭ready开关；out_of_service=神婆无法接单
const String ClickServiceTypeFail = 'ClickServiceTypeFail';

const String AFLogin = 'af_login';
const String AFPurchase = 'af_purchase';
const String AFFirstPurchase = 'first_purchase';
const String AFBounsClaimed = 'bonus_claimed';

const String AdvisorFilterClick = 'AdvisorFilterClick';
const String AdvisorFilterResultShow = 'AdvisorFilterResultShow';
const String AdvisorFilterClear = 'AdvisorFilterClear';
const String AdvisorSearchClick = 'AdvisorSearchClick';
const String AdvisorSearchTagClick = 'AdvisorSearchTagClick';
const String AdvisorSearchResultShow = 'AdvisorSearchResultShow';
const String AdvisorAbsentBannerClick = 'AdvisorAbsentBannerClick';
const String AdvisorServiceNotificationPage = 'AdvisorServiceNotificationPage';
const String AdvisorServiceNotificationApply = 'AdvisorServiceNotificationApply';
const String AdvisorBusyPopupShow = 'AdvisorBusyPopupShow';
const String AdvisorBusyNotifyClick = 'AdvisorBusyNotifyClick';
const String AdvisorUnavailablePopupShow = 'AdvisorUnavailablePopupShow';
const String AdvisorUnavailableNotifyClick = 'AdvisorUnavailableNotifyClick';
const String AdvisorLikeAdvisorSuccess = 'LikeAdvisorSuccess';

const String AddAdditionalInformation = 'AddAdditionalInformation';
const String AddAdditionalInformationSuccess = 'AddAdditionalInformationSuccess';
const String RateStoreBannerShow = 'RateStoreBannerShow';
const String RateStoreBannerClick = 'RateStoreBannerClick';
const String BadRatePopup = 'BadRatePopup';
const String BadRatePopupContactUs = 'BadRatePopupContactUs';


const String EventName_EnterInviteFriends = 'EnterInviteFriends';
const String EventName_InviteMethodClick = 'InviteMethodClick';
const String EventName_InviteRecordPageShow = 'InviteRecordPageShow';
const String EventName_ClaimInviteRewardSuccess = 'ClaimInviteRewardSuccess';
const String EventName_CopyInviteCodeSuccess = 'CopyInviteCodeSuccess';
const String EventName_EnterInviteCodeClick = 'EnterInviteCodeClick';
const String EventName_EnterMyFavoriteClick = 'EnterMyFavorite';
const String EventName_EnterFAQ = 'EnterFAQ';
const String EventName_SubmitInviteCode = 'SubmitInviteCode';
const String EventName_SubmitInviteCodeSuccess = 'SubmitInviteCodeSuccess';
const String EventName_InviteCode_TopUpPageShow = 'InviteCode_TopUpPageShow';
const String EventName_InviteCode_TopUpPageClick = 'InviteCode_TopUpPageClick';
const String EventName_ClaimInviteeRewardSuccess = 'ClaimInviteeRewardSuccess';

const String EventName_FirstPurchaseSuccess = 'FirstPurchaseSuccess';
const String EventName_24hDeliveryUnavailablePopup = '24hDeliveryUnavailablePopup';
const String EventName_CreateDraftSuccess = 'CreateDraftSuccess';
const String EventName_QuitDraft = 'QuitDraft';
const String EventName_DiscardDraftSuccess = 'DiscardDraftSuccess';
const String EventName_DraftOrderClick = 'DraftOrderClick';
const String EventName_SubmitDraft = 'SubmitDraft';
const String EventName_SubmitDraftSuccess = 'SubmitDraftSuccess';
const String EventName_NewUserLoginSuccess = 'NewUserLoginSuccess';
const String EventName_NewUserAdvisorTagShow = 'NewUserAdvisorTagShow';
const String EventName_NewUserWelcomeOfferPopup = 'NewUserWelcomeOfferPopup';
const String EventName_NewUserWelcomeOfferPopupBuy = 'NewUserWelcomeOfferPopupBuy';
const String EventName_NewUserNotificationPageShow = 'NewUserNotificationPageShow';
const String EventName_BuyWelcomeOffer = 'BuyWelcomeOffer';
const String EventName_BuyWelcomeOfferSuccess = 'BuyWelcomeOfferSuccess';
const String EventName_BuyCoin = 'BuyCoin';
const String EventName_BuyCoinSuccess = 'BuyCoinSuccess';

const String EventName_SpeedUpOrderPopupShow = 'SpeedUpOrderPopupShow';
const String EventName_SpeedUpOrderConfirm = 'SpeedUpOrderConfirm';
const String EventName_SpeedUpOrderSuccess = 'SpeedUpOrderSuccess';
const String EventName_UnconnectedLiveOrder_SendMessageShow = 'UnconnectedLiveOrder_SendMessageShow';
const String EventName_UnconnectedLiveOrder_SendMessageClick = 'UnconnectedLiveOrder_SendMessageClick';
const String EventName_RateStoreClick = 'RateStoreClick';

const String EventName_EnterWebsite = 'EnterWebsite';
const String EventName_RecommendedAdvisorBannerShow = 'RecommendedAdvisorBannerShow';
const String EventName_RecommendedAdvisorListShow = 'RecommendedAdvisorListShow';
const String EventName_RecommendedAdvisorClick = 'RecommendedAdvisorClick';
const String EventName_AddPicture = 'AddPicture';
const String EventName_SendPictureSuccess = 'SendPictureSuccess';

const String EventName_tip_advisor = 'tip_advisor';
const String EventName_followup_order = 'followup_order';
const String EventName_speedup_order = 'speedup_order';
const String EventName_complete_live_order = 'complete_live_order';
const String EventName_invite_reward_claim = 'invite_reward_claim';

const String EventName_EnterConnectingPage = 'EnterConnectingPage';
const String EventName_ConnectingPage_WaitingAdvisor = 'ConnectingPage_WaitingAdvisor';
const String EventName_EnterConnectingPageFail = 'EnterConnectingPageFail';
const String EventName_TarotTabShow = 'TarotTabShow';
const String EventName_EnterTodayTarot = 'EnterTodayTarot';
const String EventName_ReadTodayTarotSuccess = 'ReadTodayTarotSuccess';
const String EventName_EnterLoveTarot = 'EnterLoveTarot';
const String EventName_LoveTarotSelectCard = 'LoveTarotSelectCard';
const String EventName_LoveTarotGetReading = 'LoveTarotGetReading';
const String EventName_LoveTarotGetReadingSuccess = 'LoveTarotGetReadingSuccess';
const String EventName_ReadLoveTarotSuccess = 'ReadLoveTarotSuccess';
const String EventName_RestartLoveTarot = 'RestartLoveTarot';
const String EventName_TarotRecommendAdvisorClick = 'TarotRecommendAdvisorClick';

///首充优惠ab测试相关----
const String EventName_TopupOffer_LoginSuccess = 'TopupOffer_LoginSuccess';
const String EventName_TopupOffer_PurchaseShow = 'TopupOffer_PurchaseShow';
const String EventName_TopupOffer_PurchaseClick = 'TopupOffer_PurchaseClick';
const String EventName_TopupOffer_PurchaseSuccess = 'TopupOffer_PurchaseSuccess';
///-----首充优惠ab测试相关

const String EventName_ReadingSegmentShow = 'ReadingSegmentShow';
const String EventName_ReadingSegmentClick = 'ReadingSegmentClick';
const String EventName_LiveSegmentShow = 'LiveSegmentShow';
const String EventName_LiveSegmentClick = 'LiveSegmentClick';
const String EventName_PremiumSegmentShow = 'PremiumSegmentShow';
const String EventName_PremiumSegmentClick = 'PremiumSegmentClick';
const String EventName_BuyPremiumService = 'BuyPremiumService';
const String EventName_BuyPremiumServiceSuccess = 'BuyPremiumServiceSuccess';
const String EventName_BuyPremiumServiceSuccessPopup_ViewDetails = 'BuyPremiumServiceSuccessPopup_ViewDetails';
const String EventName_ReadingOrderShow = 'ReadingOrderShow';
const String EventName_PremiumServiceOrderShow = 'PremiumServiceOrderShow';
const String EventName_PremiumServiceDetailShow = 'PremiumServiceDetailShow';
const String EventName_ConfirmPremiumServiceSuccess = 'ConfirmPremiumServiceSuccess';
const String EventName_PremiumServiceSearch = "PremiumServiceSearch";
const String EventName_PremiumServiceSearchResultShow = "PremiumServiceSearchResultShow";


const String EventName_MatchAdvisorShow = 'MatchAdvisorShow';
const String EventName_MatchAdvisorResultShow = 'MatchAdvisorResultShow';
const String EventName_Sort = 'Sort';
const String EventName_SortSuccess = 'SortSuccess';
const String EventName_AdvisorMessageClick = 'AdvisorMessageClick';
////
const String ParamAdvisorMessageFrom_Message = 'message';
const String ParamAdvisorMessageFrom_AdvisorPage = 'advisor_page';
const String ParamAdvisorMessageFrom_Push = 'push';
const String ParamAdvisorMessageFrom_LiveOrderFailed = 'live_order_failed';
const String ParamAdvisorMessageFrom_AwaitTextCallPage = 'await_text_call';
/////


//参数from：advisor_card=神婆个人主页；
//order_ask=订单详情页咨询入口;
//advisor_card_ask神婆个人主页右上角咨询入口
const String EventName_ServiceTypeShow = 'ServiceTypeShow';
const String EventName_InviteRewardReminderShow = 'InviteRewardReminderShow';
const String EventName_InviteRewardReminderClick = 'InviteRewardReminderClick';
const String EventName_BindEmailClick = 'BindEmailClick';
const String EventName_BindEmailSuccess = 'BindEmailSuccess';
const String EventName_EnterTarot = 'EnterTarot';
const String EventName_UnlockTarotSuccess = 'UnlockTarotSuccess';
const String EventName_ReadTarotReading = 'ReadTarotReading';
const String EventName_RestartTarot = 'RestartTarot';

const String EventName_AdvisorUnavailableRecommendShow = 'AdvisorUnavailableRecommendShow';
const String EventName_AdvisorUnavailableRecommendClick = 'AdvisorUnavailableRecommendClick';
const String EventName_EnterAdvisorLeaderboard = 'EnterAdvisorLeaderboard';

const String EventName_EnterServicePreview = 'EnterServicePreview';
const String EventName_PremiumServiceTabShow = 'PremiumServiceTabShow';
const String EventName_TarotSaveResult = 'TarotSaveResult';
const String EventName_EnterDailyBonus = 'EnterDailyBonus';
const String EventName_EnterOrderDetail = 'EnterOrderDetail';

const String EventName_PurchaseMethodShow = 'PurchaseMethodShow';
const String EventName_PurchaseMethodClick = 'PurchaseMethodClick';

const String EventName_LiveTextChatFreeClick = 'LiveTextChatFreeClick';
const String EventName_ClickFreeMinutesGot = 'ClickFreeMinutesGot';
const String EventName_Purchase_AdditionalInfoShow = 'Purchase_AdditionalInfoShow';
const String EventName_LiveOrderAwait = 'LiveOrderAwait';
const String EventName_QuitLiveOrderInChat = 'QuitLiveOrderInChat';
const String EventName_CancelLiveTextOrderAwait = 'CancelLiveTextOrderAwait';
const String EventName_ClickCallAgain = 'ClickCallAgain';
const String EventName_ClickSendMessage = 'ClickSendMessage';
const String EventName_LiveChat_TwoMinBannerShow = 'LiveChat_TwoMinBannerShow';
const String EventName_LiveChat_TwoMinBannerClick = 'LiveChat_TwoMinBannerClick';

const String EventName_AdvisorBannerClick = 'AdvisorBannerClick';
const String EventName_InviteBannerClick = 'InviteBannerClick';
const String EventName_RateBannerClick = 'RateBannerClick';
const String EventName_LaunchPage = 'LaunchPage';
const String EventName_InvitePageShow = 'InvitePageShow';
const String EventName_AdvisorCategoryClick = 'AdvisorCategoryClick';
const String EventName_MineLinkClick = 'MineLinkClick';
const String EventName_LogPopupLinkClick = 'LogPopupLinkClick';
const String EventName_LogPopupLaterClick = 'LogPopupLaterClick';

const String EventName_OldAccountPopupSignClick = 'OldAccountPopupSignClick';
const String EventName_LinkFailCloseClick = 'LinkFailCloseClick';
const String EventName_LinkFailContactClick = 'LinkFailContactClick';
const String EventName_LinkFailTryClick = 'LinkFailTryClick';
