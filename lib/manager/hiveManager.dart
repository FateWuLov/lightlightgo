import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:lifeaste/common/file_path_util.dart';
import 'package:lifeaste/common/common.dart';
import 'package:lifeaste/logic/global.dart';
import 'package:lifeaste/models/discoverInfoModel.dart';
import 'package:lifeaste/models/orderModel.dart';
import 'package:package_info/package_info.dart';

class HiveManager {
  static HiveManager get instance => _getInstance();
  static HiveManager? _instance;

  Box? _settingBox;

  static HiveManager _getInstance() {
    var obj = _instance ?? HiveManager();
    if (_instance == null) {
      _instance = obj;
    }
    return obj;
  }

  Future<void> commonInit() async {
    DateTime startTime = DateTime.now();
    print('hive commonInit start');
    String boxName = 'settingBox';
    String boxPath = await getHivePath(boxName) ?? '';
    if (boxPath.isNotEmpty) {
      _settingBox = await Hive.openBox(boxName, path: boxPath);
    }

    int duration = DateTime.now().millisecondsSinceEpoch - startTime.millisecondsSinceEpoch;
    print('hive commonInit ended ${Duration(milliseconds: duration).toString()}');
    return Future.value(true);
  }

  Future<void> set(String key, dynamic value) async {
    _settingBox?.put(key, value);
    return _settingBox?.put(key, value);
  }

  dynamic get(String key) {
    return _settingBox?.get(key, defaultValue: null);
  }

  Future<void> delete(String key) async {
    return _settingBox?.delete(key);
  }
}

const String AF_USER_CHANNEL_STATUS_UNKNOWN = "Unknown";
const String AF_USER_CHANNEL_STATUS_ORGANIC= "Organic";
const String AF_USER_CHANNEL_STATUS_NON_ORGANIC= "Non-organic";

const String INITIAL_INFO = "INITIAL";

const String KEY_AGORA_TOKEN = "key_agora_token";
const String KEY_AF_CHANNEL = "key_af_channel";
const String KEY_AF_STATUS = "key_af_status";
const String KEY_AF_ADSET = "key_adset";
const String KEY_AF_CAMPAIGN = "key_campaign";
const String KEY_AF_AD = "key_af_ad";
const String KEY_IDFA = "key_idfa";
const String KEY_IDFV = "key_idfv";

const String KEY_APP_FIRST_LAUNCH_VERSION = "key_app_first_launch_version";
const String KEY_APP_FIRST_LAUNCH_TIME = "key_app_first_launch_time";
const String UD_HAS_LOGGED_LAUNCH_APP = 'hasLoggedLaunchEvent';
const String KEY_IS_SHOW_GUIDE = "key_is_show_guide";
const String KEY_SHOW_NOTIFICATION_TIP_TIMESTAMP =
    "key_show_notification_tip_timestamp";

const String KEY_HAS_FLOWER = 'hasFlower';
const String KEY_AVAILABLE_ORDER = 'availableOrder';
const String KEY_ACCOUNT_INFO = 'accountInfo';

///绑定账号时选择了创建新账号
const String UD_BIND_SELECT_NEW_ACCOUNT = "UD_BIND_SELECT_NEW_ACCOUNT";

///关闭了购买页的账号金币异常提醒
const String UD_CLOSE_ACCOUNT_CREDIT_TIP = "UD_CLOSE_ACCOUNT_CREDIT_TIP";

///用于判断是否显示通知设置页
const String KEY_SUBMIT_NORMAL_ORDER_TIMESTAMP =
    "key_submit_normal_order_timestamp";

const String UD_hasShownGreetImMsg = 'UD_hasShownGreetImMsg';
const String UD_hasShownBecomeAnAdvisorImMsg =
    'UD_hasShownBecomeAnAdvisorImMsg';
const String UD_hasShownAssistantImMsg = 'UD_hasShownAssistantImMsg';

const String UD_purchaseSpecialProduct = 'UD_purchaseSpecialProduct';

const String UD_ORDER_DRAFT_LIST = 'UD_ORDER_DRAFT_LIST';
const String KEY_LAST_ORDER = "key_last_order";

const String UD_DISCOVER_LIST_INFO = "UD_DISCOVER_LIST_INFO";

const String UD_PREMIUM_ORDER_IS_READ = "UD_PREMIUM_ORDER_IS_READ";

const String UD_HAS_SHOW_INVITE_FRIEND_DIALOG =
    "UD_HAS_SHOW_INVITE_FRIEND_DIALOG";

const String UD_IS_FIRST_CHOOSE_BEST_MATCH = "UD_IS_FIRST_CHOOSE_BEST_MATCH";

const String UD_HAS_SHOW_PREVIEW_DIALOG = 'UD_HAS_SHOW_PREVIEW_DIALOG';

const String UD_ORDER_SAMPLE_POPUP_VARIANT = "UD_ORDER_SAMPLE_POPUP_VARIANT";

const String CLOSE_CHAT_BANNER_TIMESTAMP = "CLOSE_CHAT_BANNER_TIMESTAMP";

const String SHOW_CHAT_BANNER_COUNT = "SHOW_CHAT_BANNER_COUNT";

const String UD_showTarotTestValue = 'UD_showTarotTestValue';
const String UD_free3MinsTestValue = 'UD_free3MinsTestValue';

const String UD_hasStartLiveTextCallValue = 'hasStartLiveTextCallValue';

const String UD_LiveTextCallCoupon = 'UD_LiveTextCallCoupon';

const String UD_showInviteDialogTime = 'showInviteDialogTime';

/// 成功创建过账号，包括游客登录的
const String UD_DID_LOGIN_BEFORE = "UD_DID_LOGIN_BEFORE";

const String UD_NEED_LOGIN_OLD_ACCOUNT = "UD_NEED_LOGIN_OLD_ACCOUNT";

/// 不注释
void initialSP() async {
  HiveManager.instance.set(KEY_ACCOUNT_INFO, INITIAL_INFO);
  HiveManager.instance.set(KEY_AVAILABLE_ORDER, true);
}
/// 不注释
bool getFlower() {
  bool isDeveloper = isDebug() || Global.userLogic().state.user.isDebugUser();
  String info = HiveManager.instance.get(KEY_ACCOUNT_INFO);
  bool order = HiveManager.instance.get(KEY_AVAILABLE_ORDER) ?? false;
  bool flower = HiveManager.instance.get(KEY_HAS_FLOWER) ?? isDeveloper;
  return info == INITIAL_INFO && order && flower;
}
/// 不注释
Future<void> setFlower(bool value) async {
  return HiveManager.instance.set(KEY_HAS_FLOWER, value);
}

Future<void> setAgoraTokenFromPref(String agoraToken) async {
  return HiveManager.instance.set(getPrefixKey(KEY_AGORA_TOKEN), agoraToken);
}

String getAgoraTokenFromPref() {
  return HiveManager.instance.get(getPrefixKey(KEY_AGORA_TOKEN)) ?? "";
}

Future<void> setPrefBool(bool mode, String key) async {
  HiveManager.instance.set(getPrefixKey(key), mode);
}

bool getPrefBool(String key) {
  return HiveManager.instance.get(getPrefixKey(key)) ?? false;
}

//只用在纯flutter中 跟底层交互不要用
String getPrefixKey(String key) {
  return "${Global.userLogic().state.user.userId}$key";
}

bool hasShownGreetImMsg() {
  return HiveManager.instance.get(getPrefixKey(UD_hasShownGreetImMsg)) ?? false;
}

Future<void> setShownGreetImMsg() {
  return HiveManager.instance.set(getPrefixKey(UD_hasShownGreetImMsg), true);
}

bool hasShownBecomeAnAdvisorImMsg() {
  return HiveManager.instance.get(getPrefixKey(UD_hasShownBecomeAnAdvisorImMsg)) ?? false;
}

Future<void> setShownBecomeAnAdvisorImMsg() {
  return HiveManager.instance.set(getPrefixKey(UD_hasShownBecomeAnAdvisorImMsg), true);
}

bool hasShownAssistantImMsg() {
  return HiveManager.instance.get(getPrefixKey(UD_hasShownAssistantImMsg)) ?? false;
}

Future<void> setShownAssistantImMsg() {
  return HiveManager.instance.set(getPrefixKey(UD_hasShownAssistantImMsg), true);
}

Future<void> setDiscoverListInfo(DiscoverInfoModel model) async {
  if (!Global.userLogic().hasLogin()) {
    return Future.value(false);
  }
  String jsonStr = jsonEncode(model.toJson());
  return HiveManager.instance.set(getPrefixKey(UD_DISCOVER_LIST_INFO), jsonStr);
}

DiscoverInfoModel? getDiscoverListInfo() {
  if (!Global.userLogic().hasLogin()) {
    return null;
  }
  String jsonStr = HiveManager.instance.get(getPrefixKey(UD_DISCOVER_LIST_INFO)) ?? '';
  if (jsonStr.isEmpty) {
    return null;
  }
  DiscoverInfoModel model = DiscoverInfoModel.fromJson(jsonDecode(jsonStr));
  return model;
}

setLastOrderFromPref(String jsonStr) async {
  if (!Global.userLogic().hasLogin()) {
    return;
  }
  return HiveManager.instance.set(getPrefixKey(KEY_LAST_ORDER), jsonStr);
}

String getLastOrderFromPref() {
  if (!Global.userLogic().hasLogin()) {
    return '';
  }
  return HiveManager.instance.get(getPrefixKey(KEY_LAST_ORDER)) ?? "";
}

Future<void> setIDFAFromPref(String idfa) async {
  return HiveManager.instance.set(KEY_IDFA, idfa);
}

String getIDFAFromPref() {
  return HiveManager.instance.get(KEY_IDFA) ?? "";
}

Future<void> setIDFVFromPref(String idfv) async {
  return HiveManager.instance.set(KEY_IDFV, idfv);
}

String getIDFVFromPref() {
  return HiveManager.instance.get(KEY_IDFV) ?? "";
}

Future<void> setAfStatusFromPref(String afStatus) async {
  return HiveManager.instance.set(KEY_AF_STATUS, afStatus);
}

String getAfStatusFromPref() {
  return HiveManager.instance.get(KEY_AF_STATUS) ?? "";
}

Future<void> setAfChannelFromPref(String afChannel) async {
  return HiveManager.instance.set(KEY_AF_CHANNEL, afChannel);
}

String getAfChannelFromPref() {
  return HiveManager.instance.get(KEY_AF_CHANNEL) ?? "";
}

Future<void> setAdSetFromPref(String adSet) async {
  return HiveManager.instance.set(KEY_AF_ADSET, adSet);
}

String getAdSetFromPref() {
  return HiveManager.instance.get(KEY_AF_ADSET) ?? "";
}

Future<void> setCampaignFromPref(String campaign) async {
  return HiveManager.instance.set(KEY_AF_CAMPAIGN, campaign);
}

String getCampaignFromPref() {
  return HiveManager.instance.get(KEY_AF_CAMPAIGN) ?? "";
}

Future<void> setAfAdFromPref(String afAd) async {
  return HiveManager.instance.set(KEY_AF_AD, afAd);
}

String getAfAdFromPref() {
  return HiveManager.instance.get(KEY_AF_AD) ?? "";
}

bool setAppFirstLaunchTime() {
  var timestamp = HiveManager.instance.get(KEY_APP_FIRST_LAUNCH_TIME);
  if (timestamp == null) {
    HiveManager.instance.set(KEY_APP_FIRST_LAUNCH_TIME, DateTime.now().millisecondsSinceEpoch);
    return true;
  }
  return false;
}

int getAppFirstLaunchTime() {
  var timestamp = HiveManager.instance.get(KEY_APP_FIRST_LAUNCH_TIME);
  if (timestamp == null) {
    return 0;
  }
  return timestamp;
}

bool isNewLaunchApp() {
  if (HiveManager.instance.get(UD_HAS_LOGGED_LAUNCH_APP) != null) {
    return false;
  }
  return true;
}

Future<void> setLoggedNewLaunchApp() async {
  return HiveManager.instance.set(UD_HAS_LOGGED_LAUNCH_APP, true);
}

/// 用户安装版本号
String appFirstLaunchVersion() {
  return HiveManager.instance.get(KEY_APP_FIRST_LAUNCH_VERSION) ?? '0';
}

setAppFirstLaunchVersion() async {
  if (HiveManager.instance.get(KEY_APP_FIRST_LAUNCH_VERSION) == null) {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    HiveManager.instance.set(KEY_APP_FIRST_LAUNCH_VERSION, packageInfo.version);
  }
}

///是否是当前版本安装的用户
Future<bool> installFromCurrentVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return appFirstLaunchVersion() == packageInfo.version;
}

Future<void> setIsShowGuideOnce(bool isShow) async {
  return HiveManager.instance.set(KEY_IS_SHOW_GUIDE, isShow);
}

bool getIsShowGuideOnce() {
  return HiveManager.instance.get(KEY_IS_SHOW_GUIDE) ?? false;
}

Future<void> setShowNotificationTipTimestamp(int timestamp) async {
  return HiveManager.instance.set(KEY_SHOW_NOTIFICATION_TIP_TIMESTAMP, timestamp);
}

int getShowNotificationTipTimestamp() {
  return HiveManager.instance.get(KEY_SHOW_NOTIFICATION_TIP_TIMESTAMP) ?? 0;
}

/// 用于判断是否显示通知设置入口
setSubmitNormalOrderTimestamp(int timestamp) async {
  var last = HiveManager.instance.get(KEY_SUBMIT_NORMAL_ORDER_TIMESTAMP);
  if (last == null) {
    Map map = {"timestamp": timestamp, "isShow": false};
    HiveManager.instance.set(KEY_SUBMIT_NORMAL_ORDER_TIMESTAMP, jsonEncode(map));
  } else {
    Map map = jsonDecode(last);
    int lastTimestamp = map["timestamp"];
    if (!isSameDay(timestamp, lastTimestamp)) {
      Map map = {"timestamp": timestamp, "isShow": false};
      HiveManager.instance.set(KEY_SUBMIT_NORMAL_ORDER_TIMESTAMP, jsonEncode(map));
    }
  }
}
Future<void> setAlreadyShowAfterSubmitNormal() async {
  Map map = {
    "timestamp": DateTime.now().millisecondsSinceEpoch,
    "isShow": true
  };
  return HiveManager.instance.set(KEY_SUBMIT_NORMAL_ORDER_TIMESTAMP, jsonEncode(map));
}
// true代表需要显示   false代表不需要显示
bool getIsShowAfterSubmitNormalOrder() {
  var last = HiveManager.instance.get(KEY_SUBMIT_NORMAL_ORDER_TIMESTAMP);
  if (last == null) {
    return false;
  } else {
    Map map = jsonDecode(last);
    int lastTimestamp = map["timestamp"];
    if (!isSameDay(DateTime.now().millisecondsSinceEpoch, lastTimestamp)) {
      return false;
    }
    if (!map["isShow"]) {
      setAlreadyShowAfterSubmitNormal();
    }
    return !map["isShow"];
  }
}

///保存订单草稿
///如有相同的orderId，先删除老记录，再插入新记录
Future<void> saveOrderDraft(OrderInfoModel order) async {
  List<OrderInfoModel> orderList = getOrderDraftList();
  orderList.removeWhere((element) => element.orderId == order.orderId);
  List<String> jsonList = orderList.map((e) {
    return jsonEncode(e.toJson());
  }).toList();
  jsonList.insert(0, jsonEncode(order.toJson()));
  return HiveManager.instance.set(getPrefixKey(UD_ORDER_DRAFT_LIST), jsonList);
}

deleteOrderDraft(String orderId) {
  List<OrderInfoModel> orderList = getOrderDraftList();
  if (orderList.isEmpty) return;
  orderList.removeWhere((element) => element.orderId == orderId);
  List<String> jsonList = orderList.map((e) {
    return jsonEncode(e.toJson());
  }).toList();
  return HiveManager.instance.set(getPrefixKey(UD_ORDER_DRAFT_LIST), jsonList);
}

List<OrderInfoModel> getOrderDraftList() {
  List<String> jsonList =
      HiveManager.instance.get(getPrefixKey(UD_ORDER_DRAFT_LIST)) ?? [];
  List<OrderInfoModel> resultList = jsonList.map((e) {
    return OrderInfoModel.fromJson(jsonDecode(e));
  }).toList();
  return resultList;
}

bool getHasShowInviteFriendDialog() {
  return HiveManager.instance.get(getPrefixKey(UD_HAS_SHOW_INVITE_FRIEND_DIALOG)) ?? false;
}

Future<void> setHasShowInviteFriendDialog() async {
  return HiveManager.instance.set(getPrefixKey(UD_HAS_SHOW_INVITE_FRIEND_DIALOG), true);
}

bool getIsFirstChooseBestMatch() {
  return HiveManager.instance.get(getPrefixKey(UD_IS_FIRST_CHOOSE_BEST_MATCH)) ?? false;
}

Future<void> setIsFirstChooseBestMatch(bool flag) async {
  HiveManager.instance.set(getPrefixKey(UD_IS_FIRST_CHOOSE_BEST_MATCH), flag);
}

bool getHasShowPreviewDialog(int serviceType) {
  return HiveManager.instance.get(
      getPrefixKey(UD_HAS_SHOW_PREVIEW_DIALOG + serviceType.toString())) ??
      false;
}

Future<void> setHasShowPreviewDialog(int serviceType, bool flag) async {
  HiveManager.instance.set(
      getPrefixKey(UD_HAS_SHOW_PREVIEW_DIALOG + serviceType.toString()), flag);
}

Future<void> setCloseChatTime() async {
  return HiveManager.instance.set(
      CLOSE_CHAT_BANNER_TIMESTAMP, DateTime.now().millisecondsSinceEpoch);
}

bool showChatBannerTips() {
  int lastCloseBannerTimeStamp = HiveManager.instance.get(CLOSE_CHAT_BANNER_TIMESTAMP) ?? 0;
  if (lastCloseBannerTimeStamp == 0) return true;
  DateTime lastTime =
  DateTime.fromMillisecondsSinceEpoch(lastCloseBannerTimeStamp);
  DateTime currentTime = DateTime.now();
  if (currentTime.day - lastTime.day >= 1 ||
      currentTime.month > lastTime.month ||
      currentTime.year > lastTime.year) {
    return true;
  }
  return false;
}

addShowChatBannerCount() async {
  int showChatBannerCount = HiveManager.instance.get(SHOW_CHAT_BANNER_COUNT) ?? 0;
  if (showChatBannerCount > 3) return true;
  HiveManager.instance.set(SHOW_CHAT_BANNER_COUNT, showChatBannerCount + 1);
}

bool liveChatShowChatBannerTips() {
  int showChatBannerCount = HiveManager.instance.get(SHOW_CHAT_BANNER_COUNT) ?? 0;
  return showChatBannerCount < 3;
}

Future<void> setHasStartedLiveTextCall() async {
  return HiveManager.instance.set(getPrefixKey(UD_hasStartLiveTextCallValue), true);
}

bool getHasStartedLiveTextCall() {
  var value = HiveManager.instance.get(getPrefixKey(UD_hasStartLiveTextCallValue));
  return value ?? false;
}

Future<void> setNeedLoginOldAccountToPref(bool needLoginOldAccount) async {
  return HiveManager.instance.set(UD_NEED_LOGIN_OLD_ACCOUNT, needLoginOldAccount);
}

needLoginOldAccountFromPref() {
  return HiveManager.instance.get(UD_NEED_LOGIN_OLD_ACCOUNT);
}

Future<void> setLiveTextCallCoupon(String starId) async {
  return HiveManager.instance.set(getPrefixKey(UD_LiveTextCallCoupon), starId);
}

bool getLiveTextCallCoupon(String starId) {
  var value = HiveManager.instance.get(getPrefixKey(UD_LiveTextCallCoupon));
  return (value != null && value == starId);
}