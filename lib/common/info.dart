
import 'package:flutter/services.dart';

class Info {
  static const appName = 'Lifeaste';
  static const String appProductMe = 'minstinct';

  static const userInfoKey = 'userInfoKey';
  static const requestSessionKey = 'requestSessionKey';
  static const tokenHeaderKey = 'x-token';

  static const privacyUrl = '';
  static const termsUrl = '';

  static const feedbackEmail = 'betterlife.lab@outlook.com';
  static String debugHostLeading = "3.236.";
  static String debugHostTrailing = "42.87:8019";
  static String debugHost = "http://$debugHostLeading$debugHostTrailing";
  static const String distributionHost = "https://api.trendy-insight.com";
  static const String OOOKey = '9g8ndXVCDLxUc3rF';

  static const String roleIdentify_user = 'user';
  static const String roleIdentify_star = 'star';

  static const String loginType_debug = 'debugLogin';
  static const String loginType_apple = 'Apple';
  static const String loginType_phone = 'phone';
  static const String loginType_google = 'google';
  static const String loginType_guest = 'guestLogin';

  static const methodChannel =
      const MethodChannel('FlutterActionNativeMethodChannel');
}
