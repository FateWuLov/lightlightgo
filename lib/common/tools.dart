
import 'dart:io';
import 'dart:math';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifeaste/common/common.dart';
import 'package:lifeaste/logic/global.dart';
import 'package:lifeaste/manager/net/networkResultData.dart';
import 'package:lifeaste/models/orderModel.dart';
import 'package:lifeaste/models/userModel.dart';
import 'package:lifeaste/models/xmppModel.dart';
import 'package:lifeaste/widgets/loading.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui' as ui;
import '../routeConfig.dart';
import 'styles.dart';

/// 关闭弹窗，直到路由栈顶部不是弹窗
closeAllTopDialog() {
  Get.until((route) => route.settings.name != RouteConfig.dialog);
}

cleanAllToast() {
  BotToast.cleanAll();
}

showLoadingToast({double? opacity}) {
  var alpha = 0.1;
  if (opacity != null) {
    alpha = opacity;
  }
  cleanAllToast();
  BotToast.showCustomLoading(
    toastBuilder: (CancelFunc cancelFunc) => Container(
      color: Styles.mainBg.withOpacity(alpha),
      alignment: Alignment.center,
      child: LoadingView(),
    ),
    duration: Duration(days: 1),
  );
}

showTipsToast(String string, {double? durationTime, VoidCallback? onDismiss}) {
  int time = 1500;
  if (durationTime != null) {
    time = int.parse((durationTime * 1000).toStringAsFixed(0));
  }
  cleanAllToast();
  BotToast.showCustomNotification(
      toastBuilder: (CancelFunc cancelFunc) => Card(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        shape: StadiumBorder(),
        color: Styles.mainBg.withOpacity(0.95),
        // elevation: 1,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          padding: EdgeInsets.all(
            10,
          ),
          child: Text(
            string,
            textAlign: TextAlign.center,
            style: Styles.textStyleBold(14),
          ),
        ),
      ),
      duration: Duration(milliseconds: time),
      onlyOne: true,
      onClose: onDismiss ?? (){});
}

showHttpErrorToast(NetResultData resultData) {
  if (!resultData.result) {
    if (resultData.specErrorMsg()) {
      showTipsToast(resultData.errorMsg ?? '');
    } else {
      showTipsToast(Strings.requestFailed);
    }
  }
}

//字符串转时间mm-dd-yyyy
DateTime dateTimeFromString(String? str) {
  if (str != null) {
    if (str.length > 0) {
      List list = str.split('-');
      if (list.length == 3) {
        return DateTime(
            int.parse(list[2]), int.parse(list[0]), int.parse(list[1]));
      }
    }
  }
  return DateTime.now();
}

//时间转字符串7-22-2020
String stringFromDate(DateTime dateTime) {
  return '${dateTime.month}-${dateTime.day}-${dateTime.year}';
}

//时间戳转日期字符串 June 10, 2020
String dateStringFromTimestamp(int time) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(time);
  return monthStrList()[dateTime.month] +
      ' ' +
      dateTime.day.toString() +
      ', ' +
      dateTime.year.toString();
}

//时间戳转日期字符串 10 June, 20
String timestamp2DateString(int time) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(time);
  return dateTime.day.toString() +
      ' ' +
      monthStrList()[dateTime.month] +
      ', ' +
      dateTime.year.toString().substring(dateTime.year.toString().length - 2);
}

//时间戳转时间字符串 11:01:01
String timeStringFromTimestamp(int time) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(time);
  String twoStringWithStr(String sting) {
    if (sting.length == 1) {
      return '0' + sting;
    }
    return sting;
  }

  return twoStringWithStr(dateTime.hour.toString()) +
      ':' +
      twoStringWithStr(dateTime.minute.toString()) +
      ':' +
      twoStringWithStr(dateTime.second.toString());
}

//时间戳转时间字符串 11:01 pm
String timestamp2TimeString(int time) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(time);
  String twoStringWithStr(String sting) {
    if (sting.length == 1) {
      return '0' + sting;
    }
    return sting;
  }

  int hour;
  String hourOfTime = 'AM';
  hour = dateTime.hour;
  if (dateTime.hour > 12) {
    hour = hour - 12;
    hourOfTime = 'PM';
  }

  return hour.toString() +
      ':' +
      twoStringWithStr(dateTime.minute.toString()) +
      ' ' +
      hourOfTime;
}

//时间戳转字符串 June 10, 2020 11:11:11
String stringFromTimestamp(int time) {
  return dateStringFromTimestamp(time) + ' ' + timeStringFromTimestamp(time);
}

String stringFromChatTimestamp(int time) {
  DateTime now = DateTime.now();
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(time);
  if (now.year != dateTime.year) {
    return stringFromTimestamp(time);
  }

  return monthStrList()[dateTime.month] +
      ' ' +
      dateTime.day.toString() +
      ', ' +
      timeStringFromTimestamp(time);
}

//00:00
String timeStringFromDuration(Duration duration) {
  int second = duration.inSeconds;
  int min = second ~/ 60;
  int sec = second % 60;
  String twoStringWithStr(String sting) {
    if (sting.length == 1) {
      return '0' + sting;
    }
    return sting;
  }

  return twoStringWithStr(min.toString()) +
      ':' +
      twoStringWithStr(sec.toString());
}

bool isSameDay(int timestamp1, int timestamp2) {
  DateTime dateTime1 = DateTime.fromMillisecondsSinceEpoch(timestamp1);
  DateTime dateTime2 = DateTime.fromMillisecondsSinceEpoch(timestamp2);
  return dateTime1.year == dateTime2.year &&
      dateTime1.month == dateTime2.month &&
      dateTime1.day == dateTime2.day;
}

String getPathSuffix(String? string, String splitStr) {
  if (string != null) {
    if (string.length > 0) {
      List list = string.split(splitStr);
      return list.last;
    }
  }
  return '';
}

//将数字转成字符串，保证不低于两位数
//如：5 转成 05
String stringLongerThan2(int time) {
  String s = time.toString();
  while (s.length < 2) {
    s = '0' + s;
  }
  return s;
}

segmentationLog(String msg) {
  var _limitLength = 800;
  if (msg.length < _limitLength) {
    print(msg);
    return;
  }
  var outStr = StringBuffer();
  for (var index = 0; index < msg.length; index++) {
    outStr.write(msg[index]);
    if (index % _limitLength == 0 && index != 0) {
      print(outStr);
      outStr.clear();
      var lastIndex = index + 1;
      if (msg.length - lastIndex < _limitLength) {
        var remainderStr = msg.substring(lastIndex, msg.length);
        print(remainderStr);
        break;
      }
    }
  }
}

bool isReleasePackage = false;

bool customReleaseMode() {
  return !isDebug();
}

bool isDebug() {
  bool inDebug = false;
  assert(inDebug = true);
  return inDebug;
}

/// 判断编译模式
String getCompileMode() {
  const bool isProfile = const bool.fromEnvironment("dart.vm.profile");
  const bool isReleaseMode = const bool.fromEnvironment("dart.vm.product");
  if (isDebug()) {
    return "debug";
  } else if (isProfile) {
    return "profile";
  } else if (isReleaseMode) {
    return "release";
  } else {
    return "Unknown type";
  }
}

String randomUsername() {
  return '${Random().nextInt(10000)}' +
      DateTime.now().millisecondsSinceEpoch.toString().replaceRange(0, 8, '');
}

String getMatchAvatar({String? birthday}) {
  return '';
}

enum Constellation {
  capricorn, // 摩羯座（12月22日～1月20日）
  aquarius, // 水瓶座（1月21日～2月19日）
  pisces, // 双鱼座（2月20日～3月20日）
  aries, // 白羊座 3月21日～4月20日
  taurus, // 金牛座 4月21～5月21日
  gemini, // 双子座 5月22日～6月21日
  cancer, // 巨蟹座（6月22日～7月22日）
  leo, // 狮子座（7月23日～8月23日）
  virgo, // 处女座（8月24日～9月23日）
  libra, // 天秤座（9月24日～10月23日）
  scorpio, // 天蝎座（10月24日～11月22日）
  sagittarius, // 射手座（11月23日～12月21日）
}

Constellation getConstellation(DateTime birthday) {
  int month = birthday.month;
  int day = birthday.day;
  switch (month) {
    case DateTime.january:
      return day < 21 ? Constellation.capricorn : Constellation.aquarius;
    case DateTime.february:
      return day < 20 ? Constellation.aquarius : Constellation.pisces;
    case DateTime.march:
      return day < 21 ? Constellation.pisces : Constellation.aries;
    case DateTime.april:
      return day < 21 ? Constellation.aries : Constellation.taurus;
    case DateTime.may:
      return day < 22 ? Constellation.taurus : Constellation.gemini;
    case DateTime.june:
      return day < 22 ? Constellation.gemini : Constellation.cancer;
    case DateTime.july:
      return day < 23 ? Constellation.cancer : Constellation.leo;
    case DateTime.august:
      return day < 24 ? Constellation.leo : Constellation.virgo;
    case DateTime.september:
      return day < 24 ? Constellation.virgo : Constellation.libra;
    case DateTime.october:
      return day < 24 ? Constellation.libra : Constellation.scorpio;
    case DateTime.november:
      return day < 23 ? Constellation.scorpio : Constellation.sagittarius;
    case DateTime.december:
      return day < 22 ? Constellation.sagittarius : Constellation.capricorn;
    default:
      break;
  }
  return Constellation.capricorn;
}

void unFocusCurrentFocus(BuildContext context) {
  FocusScopeNode focusScopeNode = FocusScope.of(context);
  if (!focusScopeNode.hasPrimaryFocus) {
    focusScopeNode.unfocus();
  }
}

class CommonFunction {
  static Future<bool> openUrl(String url) async {
    try {
      if (await canLaunch(url)) {
        print('Launch url $url');
        return launch(url);
      } else {
        return false;
      }
    } on Exception catch (_) {
      return false;
    }
  }
}

///关键词匹配
bool containsKeyword(String sentence, String keyword) {
  String source = '\\b[0-9]*${keyword.toLowerCase()}[0-9]*\\b';
  bool match = RegExp(source).hasMatch(sentence.toLowerCase());
  if (match) {
    return true;
  }
  return false;
}

String breakWord(String? word) {
  if (word == null || word.isEmpty) {
    return '';
  }
  String breakWord = '';
  word.runes.forEach((element) {
    breakWord += String.fromCharCode(element);
    breakWord += '\u200B';
  });
  return breakWord;
}

ConversationModel officialConversationModel() {
  ConversationModel model = ConversationModel.fromJson({});
  model.conversationId = Info.officialAccountUserId;
  model.mateIdentify = Info.roleIdentify_user;
  model.mateName = Info.officialAccountName;
  model.mateAvatar = Info.officialAccountAvatar;
  return model;
}

UserInfoModel officialUserInfoModel() {
  UserInfoModel officialModel = UserInfoModel.fromJson({});
  officialModel.userId = Info.officialAccountUserId;
  officialModel.avatar = Info.officialAccountAvatar;
  officialModel.name = Info.officialAccountName;
  officialModel.identify = Info.roleIdentify_user;
  return officialModel;
}

ConversationModel assistantConversationModel() {
  ConversationModel model = ConversationModel.fromJson({});
  model.conversationId = Global.userLogic().state.user.assistantId;
  model.mateIdentify = Info.roleIdentify_user;
  model.mateName = Info.assistantAccountName;
  return model;
}

UserInfoModel assistantUserInfoModel() {
  UserInfoModel model = UserInfoModel.fromJson({});
  model.userId = Global.userLogic().state.user.assistantId;
  model.name = Info.assistantAccountName;
  model.identify = Info.roleIdentify_user;
  return model;
}

ConversationModel conversationModelWithUser(UserInfoModel user) {
  ConversationModel model = ConversationModel.fromJson({});
  model.conversationId = user.userId;
  model.mateIdentify = user.identify;
  model.mateName = user.name;
  model.mateAvatar = user.avatar;
  model.myId = Global.userLogic().state.user.userId;
  return model;
}

OrderInfoModel newDraft(
    {@required UserInfoModel? star, @required ServiceType? serviceType}) {
  OrderInfoModel model = OrderInfoModel.fromJson({});
  if (star == null || serviceType == null) return model;
  model.orderId = "${Global.userLogic().state.user.userId}_${star.userId}_${DateTime.now().millisecondsSinceEpoch}";
  model.status = OrderStatusDraft;
  model.starInfo = star;
  model.userInfo = Global.userLogic().state.user;
  model.service = ServiceInfoModel.fromJson({});
  model.service.type = serviceType.index;
  model.createTime = DateTime.now().millisecondsSinceEpoch;
  return model;
}

///比较两个字符串的大小，以.为分界线进行拆分，再分别比较
///str1大于str2返回1
///str1等于str2返回0
///否则返回-1
///例如：
///versionCompare('1.2', '1.3') = -1
///versionCompare('1.3', '1.2') = 1
///versionCompare('1.2', '1.2') = 0
///versionCompare('1.2.0', '1.2') = 0
///versionCompare('1.2.0', '1.2.1') = -1
///versionCompare('1.2', '1.10') = -1
///versionCompare('1.2.5', '1.10.1') = -1
///versionCompare('1.0.3', '1') = 1
///versionCompare('', '1.3') = -1
int versionCompare(String str1, String str2) {
  List<String> list1 = str1.split('.');
  List<String> list2 = str2.split('.');
  //空字符串split之后，得到['']，数组长度是1，所以需要把空字符串移除，再作比较
  try {
    list1.removeWhere((element) => element.replaceAll(' ', '').isEmpty);
    list2.removeWhere((element) => element.replaceAll(' ', '').isEmpty);
  } on Exception catch (_) {
    return -1;
  }
  for (int i = 0; i < list1.length; i++) {
    if (i >= list1.length || i >= list2.length) break;
    if (int.parse(list1[i]) > int.parse(list2[i])) return 1;
    if (int.parse(list1[i]) < int.parse(list2[i])) return -1;
  }
  if (list1.length > list2.length) {
    List<String> left = list1.sublist(list2.length, list1.length);
    for (String element in left) {
      if (int.parse(element) > 0) return 1;
    }
    return 0;
  } else if (list1.length < list2.length) {
    List<String> left = list2.sublist(list1.length, list2.length);
    for (String element in left) {
      if (int.parse(element) > 0) return -1;
    }
    return 0;
  }
  return 0;
}

/// 为某个操作增加重试机制，直至成功或到达最大重试次数
Future<bool> confirmAction(Future<bool> Function() action,
    {Duration retryDelay = Duration.zero, int maxRetryCount = 0}) async {
  if (maxRetryCount < 0) return Future.value(false);
  bool result = await action.call();
  if (result) {
    return Future.value(true);
  } else {
    if (maxRetryCount == 0) {
      return Future.value(false);
    }
    return Future.delayed(retryDelay, () {
      return confirmAction(action,
          retryDelay: retryDelay, maxRetryCount: maxRetryCount - 1);
    });
  }
}

/// 将小数部分等于0的double型转成int型
/// 由于后台在获取参数json时，2.0会变成2，客户端用2.0计算签名的话会导致签名校验错误
/// 所以在客户端做数据类型转换
Map<String, dynamic> fixToJson(Map<String, dynamic>? map) {
  Map<String, dynamic> temp = {};
  if (map == null) return temp;
  print('fixToJson start ${map.entries}');
  map.forEach((key, value) {
    if (key is String) {
      if ((value is double) && value.toInt() - value == 0) {
        temp[key] = value.toInt();
      } else if (value is Map<String, dynamic>) {
        temp[key] = fixToJson(value);
      } else {
        temp[key] = value;
      }
    }
  });
  return temp;
}

Widget sheetWithPainterBorder({
  @required Widget? child,
  EdgeInsets? padding,
  bool topLine = true,
}) {
  return Stack(
    children: [
      Positioned(
          top: 20,
          left: 0,
          right: 0,
          child: Visibility(
            visible: topLine,
            child: Center(
              child: Container(
                height: 4,
                width: 54,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.5),
                    color: Color.fromRGBO(77, 77, 77, 1)),
              ),
            ),
          )),
      Container(
        padding: padding ??
            EdgeInsets.fromLTRB(8, 20 + (topLine ? 15.0 : 0.0), 8, 20),
        child: child,
      ),
    ],
  );
}

/// 给sheet套上外框
void showLightBottomSheet({
  @required Widget? child,
  EdgeInsets? padding,
  Color backgroundColor = Colors.transparent,
  Color? barrierColor,
  bool isScrollControlled = true,
  bool enableDrag = true,
  bool isDismissible = true,
  // 顶部显示一个短色条
  bool topLine = true,
}) {
  Get.bottomSheet(
    sheetWithPainterBorder(
      topLine: topLine,
      padding: padding,
      child: child,
    ),
    backgroundColor: backgroundColor,
    barrierColor: barrierColor ?? Colors.black.withOpacity(0.7),
    isScrollControlled: isScrollControlled,
    enableDrag: enableDrag,
    isDismissible: isDismissible,
  );
}

/// 原始的sheet样式，统一背景色
void showNormalBottomSheet({
  @required Widget? child,
  EdgeInsets? padding,
  Color backgroundColor = Colors.transparent,
  Color? barrierColor,
  bool isScrollControlled = true,
  bool enableDrag = true,
  bool isDismissible = true,
}) {
  if (child == null) return;

  Get.bottomSheet(
    child,
    backgroundColor: backgroundColor,
    barrierColor: barrierColor ?? Colors.black.withOpacity(0.7),
    isScrollControlled: isScrollControlled,
    enableDrag: enableDrag,
    isDismissible: isDismissible,
  );
}

showNormalDialog({
  @required Widget? child,
  Object? arguments,
  bool barrierDismissible = true,
  Color? barrierColor,
  String? barrierLabel,
  bool useSafeArea = true,
  RouteSettings? routeSettings,
}) {
  if (child == null) return;

  return Get.dialog(
      child,
      arguments: arguments,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor ?? Colors.black.withOpacity(0.7),
      useSafeArea: useSafeArea,
      routeSettings: routeSettings,
      name: RouteConfig.dialog
  );
}

List<String> monthStrList() => [
  'Null',
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];