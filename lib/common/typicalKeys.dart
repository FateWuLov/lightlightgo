
import 'package:flutter/services.dart';

const String AF_USER_CHANNEL_STATUS_UNKNOWN = "Unknown";
const String AF_USER_CHANNEL_STATUS_ORGANIC= "Organic";
const String AF_USER_CHANNEL_STATUS_NON_ORGANIC= "Non-organic";

const String INITIAL_INFO = "INITIAL";

class TypicalKeys {
  static const appName = 'Lifeaste';
  static const xiAppName_IOS = 'iOS_Lifeaste';
  static const xiAppName_Android = 'Android_Lifeaste';
  static const appId_IOS = '1567904600';//线上App的appId
  static const appsflyerDevKey = 'YZfsqQecfJ597rw7pFN700';

  static const officialAccountName = '🍀Lifeaste🍀';
  static const officialAccountAvatar = 'https://cdn.answer-planet.com/upload/367f2473-c783-45ca-b673-395081315bde/objects/1622017118565_367f2473-c783-45ca-b673-395081315bde.png';
  static const officialAccountUserId = '367f2473-c783-45ca-b673-395081315bde';
  static const soulAccountUserId = 'd0bd2daf-7a09-4fc8-814d-991589c2b3c1';
  static const assistantAccountName = 'Assistant Luna';

  static const userInfoKey = 'userInfoKey';
  static const requestSessionKey = 'requestSessionKey';
  static const tokenHeaderKey = 'x-token';

  static const privacyUrl =
      'https://1drv.ms/w/s!AnntLdkWOFKzaTZTyzMsEvPVtbA?e=v2hED';
  static const termsUrl =
      'https://1drv.ms/w/s!AnntLdkWOFKzbqHy3d-VugDJWlw?e=nPmbpj';
  static const inviteLinkWithCode = 'https://pocketinsight-referral.onelink.me/up1W/PocketInsightInvitecode';
  static const inviteLinkNoCode = 'https://pocketinsight-referral.onelink.me/up1W/PocketInsightInvite';
  static const tarotShareLink = 'https://pocketinsight-referral.onelink.me/up1W/PocketInsightTarot';

  static const feedbackEmail = 'insight.online@outlook.com';

  static const baseWebLink = 'https://aw.psych-scope.com';
  static const faqRoute = '/mobile/faq';

  static const faqLink = baseWebLink + faqRoute;

  static const String XiEventURL = "http://etl.psych-scope.com";
  static const String BossURL = "http://app.psych-scope.com";
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

  static const String Android_BillingProcessType_InBuyNormal = 'InBuyNormal';
  static const String Android_BillingProcessType_InBuyReAddPurchases =
      'InBuyReAddPurchases';
  static const String Android_BillingProcessType_LaunchReAddPurchases =
      'LaunchReAddPurchases';
  static const String Android_BillingProcessType_LaunchReAddReceipt =
      'LaunchReAddReceipt';

  static const methodChannel =
      const MethodChannel('FlutterActionNativeMethodChannel');
  static const nativeActionFlutterMethodChannel =
      const MethodChannel('NativeActionFlutterMethodChannel');
}
