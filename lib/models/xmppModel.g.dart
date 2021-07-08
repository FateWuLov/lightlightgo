// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xmppModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

XMPPMessageModel _$XMPPMessageModelFromJson(Map<String, dynamic> json) {
  return XMPPMessageModel(
    json['messageId'] as String? ?? '',
    json['senderId'] as String? ?? '',
    json['senderIdentify'] as String? ?? 'star',
    json['receiverId'] as String? ?? '',
    json['receiverIdentify'] as String? ?? 'star',
    json['conversationId'] as String? ?? '',
    json['text'] as String? ?? '',
    json['messageType'] as int? ?? 0,
    json['msgVersion'] as int? ?? 0,
    json['senderPlatform'] as int? ?? 0,
    json['messageStatus'] as int? ?? 0,
    json['senderAvatar'] as String? ?? '',
    json['senderName'] as String? ?? '',
    json['timestamp'] as int? ?? 0,
    json['cmdActionType'] as int? ?? 0,
    json['didRead'] as bool? ?? false,
    json['easyMsg'] as bool? ?? false,
    json['premiumMsg'] as bool? ?? false,
    (json['imgRatio'] as num?)?.toDouble() ?? 1,
    json['fullImgLocalFileName'] as String? ?? '',
    json['fullImgRemoteUrl'] as String? ?? '',
    json['thumbnailLocalFileName'] as String? ?? '',
    json['thumbnailRemoteUrl'] as String? ?? '',
    json['orderId'] as String? ?? '',
    json['showTime'] as bool? ?? false,
    json['agoraCallContent'] as String,
    json['senderProduct'] as String? ?? '',
    json['orderType'] as int? ?? 0,
  );
}

Map<String, dynamic> _$XMPPMessageModelToJson(XMPPMessageModel instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'timestamp': instance.timestamp,
      'conversationId': instance.conversationId,
      'messageType': instance.messageType,
      'cmdActionType': instance.cmdActionType,
      'messageStatus': instance.messageStatus,
      'senderId': instance.senderId,
      'senderIdentify': instance.senderIdentify,
      'receiverId': instance.receiverId,
      'receiverIdentify': instance.receiverIdentify,
      'senderName': instance.senderName,
      'senderAvatar': instance.senderAvatar,
      'text': instance.text,
      'imgRatio': instance.imgRatio,
      'thumbnailRemoteUrl': instance.thumbnailRemoteUrl,
      'fullImgRemoteUrl': instance.fullImgRemoteUrl,
      'thumbnailLocalFileName': instance.thumbnailLocalFileName,
      'fullImgLocalFileName': instance.fullImgLocalFileName,
      'orderId': instance.orderId,
      'orderType': instance.orderType,
      'senderPlatform': instance.senderPlatform,
      'msgVersion': instance.msgVersion,
      'didRead': instance.didRead,
      'easyMsg': instance.easyMsg,
      'premiumMsg': instance.premiumMsg,
      'showTime': instance.showTime,
      'agoraCallContent': instance.agoraCallContent,
      'senderProduct': instance.senderProduct,
    };

ConversationModel _$ConversationModelFromJson(Map<String, dynamic> json) {
  return ConversationModel(
    json['conversationId'] as String? ?? '',
    json['myId'] as String? ?? '',
    json['mateIdentify'] as String? ?? 'star',
    json['mateAvatar'] as String? ?? '',
    json['mateName'] as String? ?? '',
    json['lastMessage'] == null
        ? null
        : XMPPMessageModel.fromJson(
            json['lastMessage'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ConversationModelToJson(ConversationModel instance) =>
    <String, dynamic>{
      'conversationId': instance.conversationId,
      'mateIdentify': instance.mateIdentify,
      'myId': instance.myId,
      'mateAvatar': instance.mateAvatar,
      'mateName': instance.mateName,
      'lastMessage': instance.lastMessage,
    };

PresenceModel _$PresenceModelFromJson(Map<String, dynamic> json) {
  return PresenceModel(
    json['status'] as int? ?? 0,
    json['timestamp'] as int? ?? 0,
  );
}

Map<String, dynamic> _$PresenceModelToJson(PresenceModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'timestamp': instance.timestamp,
    };

ChatStateModel _$ChatStateModelFromJson(Map<String, dynamic> json) {
  return ChatStateModel(
    json['timestamp'] as int? ?? 0,
    json['state'] as int? ?? 0,
    json['orderId'] as String? ?? '',
  );
}

Map<String, dynamic> _$ChatStateModelToJson(ChatStateModel instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'state': instance.state,
      'orderId': instance.orderId,
    };
