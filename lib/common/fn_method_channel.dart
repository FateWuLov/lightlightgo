import 'package:flutter/services.dart';

const fnMethodChannel = const MethodChannel('FlutterActionNativeMethodChannel');

final String methodNamePhoneLoginStr = 'PhoneLoginStr';
final String methodNameFBLoginStr = 'FBLoginStr';
final String methodNameAppleIdLoginStr = 'AppleIdLoginStr';
final String methodNameFBUserInfo = 'FBUserInfo';
const String methodNameGetNativeInfo = 'GetNativeInfo';
final String methodNameResetGuestId = 'ResetGuestId';
final String methodNameUploadImage = 'UploadImage';

//purchase
const String methodNameUpdateIapConfig = 'UpdateIapConfig';
const String methodNamePurchase = 'Purchase';

//xmpp
const String methodNameXMPPLogin = 'XMPPLogin';
const String methodNameXMPPDisconnect = 'XMPPDisconnect';
const String methodNameXMPPSendMsg = 'XMPPSendMsg';
const String methodNameXMPPFetchMsgHistory = 'XMPPFetchMsgHistory';
const String methodNameXMPPTriggerOnlineModeUpdate = "XMPPTriggerOnlineModeUpdate";
const String methodNameXMPPSubscribeOnlineMode = "XMPPSubscribeOnlineMode";
const String methodNameXMPPUpdateChatState = 'XMPPUpdateChatState';
const String methodNameXMPPPingUser = 'XMPPPingUser';

const String methodNameEventTrack = 'EventTrack';

const String methodNameRequestAccessPhotos = 'RequestAccessPhotos';

const String methodNameBaseXiEvent = 'BaseXiEvent';

const String methodNameRequestAccessATTracking = 'RequestAccessATTracking';

const String methodNameShareImageToIns = 'ShareImageToIns';
const String methodNameShareTextToFacebook = 'ShareTextToFacebook';
