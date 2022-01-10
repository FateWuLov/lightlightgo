
import 'package:flutter/services.dart';

class Info {
  static const appName = 'Lifeaste';
  static const xiAppName_IOS = 'iOS_Lifeaste';
  static const xiAppName_Android = 'Android_Lifeaste';
  static const appId_IOS = '1567904600';//线上App的appId
  static const appsflyerDevKey = 'YZfsqQecfJ597rw7pFN700';

  static const officialAccountName = '🍀Lifeaste🍀';
  static const officialAccountAvatar = '';
  static const officialAccountUserId = '';
  static const soulAccountUserId = '';
  static const assistantAccountName = 'Assistant';

  static const userInfoKey = 'userInfoKey';
  static const requestSessionKey = 'requestSessionKey';
  static const tokenHeaderKey = 'x-token';

  static const privacyUrl = '';
  static const termsUrl = '';
  static const inviteLinkWithCode = '';
  static const inviteLinkNoCode = '';
  static const tarotShareLink = '';

  static const feedbackEmail = 'betterlife.lab@outlook.com';

  static const baseWebLink = 'https://aw.sparkling-insights.com';
  static const faqRoute = '/mobile/faq';

  static const faqLink = baseWebLink + faqRoute;

  static String debugHostLeading = "3.236.";
  static String debugHostTrailing = "42.87:8019";
  static String debugHost = "http://$debugHostLeading$debugHostTrailing";
  static const String distributionHost = "https://api.sparkling-insights.com";
  static const String XiEventURL = "http://etl.sparkling-insights.com";
  static const String BossURL = "http://app.sparkling-insights.com";
  static const String AESKey = '9g8ndXVCDLxUc3rF';

  static const String roleIdentify_user = 'user';
  static const String roleIdentify_star = 'star';

  static const String loginType_debug = 'debugLogin';
  static const String loginType_apple = 'Apple';
  static const String loginType_phone = 'phone';
  static const String loginType_google = 'google';
  static const String loginType_guest = 'guestLogin';

  static const String ourWebsiteSymbol = '##OurWebsite##';

  static const String defaultAvatarUrl = '';

  static const int readingAvailableHours = 24;
  static const int serviceMinPrice = 15;
  static const int serviceMaxPrice = 360;

  static const methodChannel =
      const MethodChannel('FlutterActionNativeMethodChannel');
  static const nativeActionFlutterMethodChannel =
      const MethodChannel('NativeActionFlutterMethodChannel');
}
