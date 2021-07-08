import 'package:event_bus/event_bus.dart';
import 'package:lifeaste/models/inviteRecordModel.dart';
import 'package:lifeaste/models/tarotModel.dart';
import 'package:lifeaste/models/userModel.dart';
import 'package:lifeaste/models/xmppModel.dart';

EventBus eventBus = EventBus();

class UserInfoChangedEvent {
  UserInfoChangedEvent();
}

class StartLiveTextCallEvent {
  StartLiveTextCallEvent();
}

class NeedUpdateOrderListEvent {
  NeedUpdateOrderListEvent();
}

class OrderStatusHasChangedEvent {
  OrderStatusHasChangedEvent();
}

class OrderStatusChangeNotifyEvent {
  String orderId;
  OrderStatusChangeNotifyEvent(this.orderId);
}

class UnreadOrderUpdateEvent {
  int unreadCount;
  UnreadOrderUpdateEvent(this.unreadCount);
}

class ReviewOrderSuccessEvent {
  ReviewOrderSuccessEvent();
}

class StarActiveForChatNotifyEvent {
  String orderId;
  StarActiveForChatNotifyEvent(this.orderId);
}

class ReAddCoinsSuccessEvent {
  ReAddCoinsSuccessEvent();
}

class ReceiveXMPPNormalMsgEvent {
  XMPPMessageModel model;
  ReceiveXMPPNormalMsgEvent(this.model);
}

class XMPPOnlineModeChangeEvent {
  String userId;
  int mode;
  XMPPOnlineModeChangeEvent(this.userId, this.mode);
}

class XMPPChatStateUpdateEvent {
  final String senderId;
  final ChatStateModel model;
  XMPPChatStateUpdateEvent(this.senderId, this.model);
}

/// 实时聊天的提示消息更新
class CallNoticeUpdateEvent {
  CallNoticeUpdateEvent();
}

class ReceiveXMPPErrorMsgEvent {
  XMPPMessageModel model;
  ReceiveXMPPErrorMsgEvent(this.model);
}

class UpdateConversationEvent {
  ConversationModel model;
  bool topping; //是否置顶该消息
  UpdateConversationEvent(this.model, {this.topping = false});
}

class KickOutEvent {
  KickOutEvent();
}

class XMPPDidConnectEvent {
  XMPPDidConnectEvent();
}

class XMPPDidDisconnectEvent {
  XMPPDidDisconnectEvent();
}

class UserClickReplyEvent {
  UserClickReplyEvent();
}

class LimitOfferEndedEvent {
  LimitOfferEndedEvent();
}

///购买iap回调成功，尚未完成收据校验
class ConsumeIapSuccessEvent {
  final bool isLimitOffer;
  ConsumeIapSuccessEvent({this.isLimitOffer = false});
}

class DidUpdateUserInfoEvent {
  UserInfoModel model;
  DidUpdateUserInfoEvent(this.model);
}

class CloseDialogEvent {
  CloseDialogEvent();
}

class BossConfigUpdateEvent {
  BossConfigUpdateEvent();
}


class NotificationPermissionEvent {
  NotificationPermissionEvent();
}

class UserInterestTagsChangedEvent {
  UserInterestTagsChangedEvent();
}

class UpdateXMPPMsgStatusEvent {
  XMPPMessageModel model;

  UpdateXMPPMsgStatusEvent(this.model);
}

class UpdateOrderDraftEvent {
  UpdateOrderDraftEvent();
}

class UpdateInviteRecordEvent {
  UpdateInviteRecordEvent(this.model);
  InviteRecordModel model;
}

class ClosePurchaseSuccessAlertEvent {
  ClosePurchaseSuccessAlertEvent();
}

class UpdateTarotEvent {
  UpdateTarotEvent(this.type, this.list);
  TarotType type;
  List<TarotModel> list;
}

class Close3minFreeDialogEvent {
  Close3minFreeDialogEvent();
}