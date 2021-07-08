import 'package:lifeaste/common/tools.dart';
import 'package:lifeaste/common/typicalKeys.dart';
import 'package:lifeaste/logic/global.dart';
import 'package:lifeaste/models/userModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'xmppModel.g.dart';

//flutter packages pub run build_runner watch
//flutter packages pub run build_runner build

const int XMPPMsgType_Unknown = 0;
const int XMPPMsgType_Text = 1;
const int XMPPMsgType_Image = 2;
const int XMPPMsgType_Audio = 3;
const int XMPPMsgType_Video = 4;
const int XMPPMsgType_CmdAction = 5;

/// 下面的类型只用在本地显示，不做传输
const int XMPPMsgType_Composing = 20; // 正在输入
const int XMPPMsgType_FreeStarted = 21; // 三分钟免费开始
const int XMPPMsgType_FreeEnded = 22; // 三分钟免费结束
const int XMPPMsgType_TopUp = 23; // 通话快结束充值提醒

const int XMPPCmdType_Unknown = 0;
const int XMPPCmdType_TextCallProactive = 1;
const int XMPPCmdType_TextCallAccept = 2;
const int XMPPCmdType_TextCallReject = 3;
const int XMPPCmdType_TextCallEnd = 4;
const int XMPPCmdType_TextCallBusy = 5;
const int XMPPCmdType_TextCallHeartBeat = 6;
const int XMPPCmdType_TextCallLackCoins = 7;
const int XMPPCmdType_TextCallEnoughCoins = 8;
// 握手消息
const int XMPPCmdType_TextCallRequestConfirm = 9;
const int XMPPCmdType_TextCallConfirmed = 10;
// 该类型的消息用于刷新订单列表
const int XMPPCmdType_Order = 11;

const int XMPPMsgStatus_Pending = 0;
const int XMPPMsgStatus_Delivering = 1;
const int XMPPMsgStatus_Succeed = 2;
const int XMPPMsgStatus_Failed = 3;

const int XMPPMsgPlatform_Unknown = 0;
const int XMPPMsgPlatform_IOS = 1;
const int XMPPMsgPlatform_Android = 2;

const int XMPPMsgVersion_default = 0;

const int XMPPMsgVersion_now = XMPPMsgVersion_default; //该版本支持的消息version

enum XMPPChatState {
  None,
  Composing,
  Pause,
}

enum MsgServiceType {
  LiveChat, // 实时聊天
  NormalChat, // 非实时聊天  勾搭  与官号的聊天
  PremiumChat, // 增值服务
}

@JsonSerializable()
class XMPPMessageModel {
  @JsonKey(defaultValue: '')
  String messageId;
  @JsonKey(defaultValue: 0)
  int timestamp;
  @JsonKey(defaultValue: '')
  String conversationId;
  @JsonKey(defaultValue: XMPPMsgType_Unknown)
  int messageType;
  @JsonKey(defaultValue: XMPPCmdType_Unknown)
  int cmdActionType;
  @JsonKey(defaultValue: XMPPMsgStatus_Pending)
  int messageStatus;
  @JsonKey(defaultValue: '')
  String senderId;
  @JsonKey(defaultValue: TypicalKeys.roleIdentify_star)
  String senderIdentify;
  @JsonKey(defaultValue: '')
  String receiverId;
  @JsonKey(defaultValue: TypicalKeys.roleIdentify_star)
  String receiverIdentify;
  @JsonKey(defaultValue: '')
  String senderName;
  @JsonKey(defaultValue: '')
  String senderAvatar;

  //消息内容
  @JsonKey(defaultValue: '')
  String text;
  @JsonKey(defaultValue: 1)
  double imgRatio;
  @JsonKey(defaultValue: '')
  String thumbnailRemoteUrl;
  @JsonKey(defaultValue: '')
  String fullImgRemoteUrl;
  @JsonKey(defaultValue: '')
  String thumbnailLocalFileName;
  @JsonKey(defaultValue: '')
  String fullImgLocalFileName;

  //附加信息
  @JsonKey(defaultValue: '')
  String orderId;

  ///奖励领取状态，0表示未领取，1表示已领取（字段名字明显不对，疑惑操作？？）
  @JsonKey(defaultValue: 0)
  int orderType;

  @JsonKey(defaultValue: XMPPMsgPlatform_Unknown)
  int senderPlatform;
  @JsonKey(defaultValue: XMPPMsgVersion_default)
  int msgVersion;
  @JsonKey(defaultValue: false)
  bool didRead;
  @JsonKey(defaultValue: false)
  bool easyMsg; // 该信息为非实时聊天信息
  @JsonKey(defaultValue: false)
  bool premiumMsg; // 该信息为增值服务的聊天信息
  @JsonKey(defaultValue: false)
  bool showTime; //消息列表里需要显示时间
  @JsonKey(defaultValue: null)
  String agoraCallContent;

  /// 区分是哪个App发送的
  @JsonKey(defaultValue: '')
  String senderProduct;

  XMPPMessageModel(
    this.messageId,
    this.senderId,
    this.senderIdentify,
    this.receiverId,
    this.receiverIdentify,
    this.conversationId,
    this.text,
    this.messageType,
    this.msgVersion,
    this.senderPlatform,
    this.messageStatus,
    this.senderAvatar,
    this.senderName,
    this.timestamp,
    this.cmdActionType,
    this.didRead,
    this.easyMsg,
    this.premiumMsg,
    this.imgRatio,
    this.fullImgLocalFileName,
    this.fullImgRemoteUrl,
    this.thumbnailLocalFileName,
    this.thumbnailRemoteUrl,
    this.orderId,
    this.showTime,
    this.agoraCallContent,
    this.senderProduct,
    this.orderType,
  );

  factory XMPPMessageModel.fromJson(Map<String, dynamic> json) =>
      _$XMPPMessageModelFromJson(json);

  Map<String, dynamic> toJson() => fixToJson(_$XMPPMessageModelToJson(this));

  MsgServiceType msgServiceType() {
    if (premiumMsg) {
      return MsgServiceType.PremiumChat;
    } else {
      if (easyMsg) {
        return MsgServiceType.NormalChat;
      } else {
        return MsgServiceType.LiveChat;
      }
    }
  }

  bool senderIsMe() {
    return senderId == Global.userLogic().state.user.userId;
  }

  bool receiverIsMe() {
    return receiverId == Global.userLogic().state.user.userId;
  }

  bool isLevelUpRewardMsg() {
    if (orderId.isNotEmpty) {
      return orderId.startsWith("rewardId_");
    }
    return false;
  }

  bool needStorageToConversationDb() =>
      (messageType == XMPPMsgType_Text ||
          messageType == XMPPMsgType_Image ||
          messageType == XMPPMsgType_Audio ||
          messageType == XMPPMsgType_Video) &&
      easyMsg;

  /// 增值服务聊天的会话信息，需要存储数据库
  bool needStorageToPremiumDb() =>
      (messageType == XMPPMsgType_Text ||
          messageType == XMPPMsgType_Image ||
          messageType == XMPPMsgType_Audio ||
          messageType == XMPPMsgType_Video) &&
      premiumMsg;

  bool needPush() {
    if (needStorageToConversationDb()) return true;
    if (msgServiceType() == MsgServiceType.PremiumChat) {
      return messageType == XMPPMsgType_Text ||
          messageType == XMPPMsgType_Image ||
          messageType == XMPPMsgType_Audio ||
          messageType == XMPPMsgType_Video;
    }
    return false;
  }

  bool isNewMsg() {
    if (DateTime.now().millisecondsSinceEpoch - timestamp >
        Duration(seconds: 1).inMilliseconds) {
      return false;
    }
    return true;
  }
}

@JsonSerializable()
class ConversationModel {
  @JsonKey(defaultValue: '')
  String conversationId;
  @JsonKey(defaultValue: TypicalKeys.roleIdentify_star)
  String mateIdentify;
  @JsonKey(defaultValue: '')
  String myId;
  @JsonKey(defaultValue: '')
  String mateAvatar;
  @JsonKey(defaultValue: '')
  String mateName;
  XMPPMessageModel? lastMessage;

  ConversationModel(
    this.conversationId,
    this.myId,
    this.mateIdentify,
    this.mateAvatar,
    this.mateName,
    this.lastMessage,
  );

  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationModelFromJson(json);

  Map<String, dynamic> toJson() => fixToJson(_$ConversationModelToJson(this));

// @override
// bool operator ==(Object other) {
//   if (other is! ConversationModel) {
//     return false;
//   }
//   final ConversationModel model = other;
//   return this.conversationId == model.conversationId
//       && this.mateName == model.mateName
//       && this.mateAvatar == model.mateAvatar && this.lastMessage == model.lastMessage;
// }
//
// @override
// int get hashCode => super.hashCode;

}

@JsonSerializable()
class PresenceModel {
  @JsonKey(defaultValue: OnlineModeOffline)
  int status;
  @JsonKey(defaultValue: 0)
  int timestamp;

  PresenceModel(this.status, this.timestamp);

  factory PresenceModel.fromJson(Map<String, dynamic> json) =>
      _$PresenceModelFromJson(json);

  Map<String, dynamic> toJson() => fixToJson(_$PresenceModelToJson(this));
}

@JsonSerializable()
class ChatStateModel {
  @JsonKey(defaultValue: 0)
  int timestamp;
  @JsonKey(defaultValue: 0)
  int state;
  @JsonKey(defaultValue: '')
  String orderId;

  ChatStateModel(
    this.timestamp,
    this.state,
    this.orderId,
  );

  factory ChatStateModel.fromJson(Map<String, dynamic> json) =>
      _$ChatStateModelFromJson(json);

  Map<String, dynamic> toJson() => fixToJson(_$ChatStateModelToJson(this));

  bool isComposing() {
    return state == XMPPChatState.Composing.index;
  }
}
