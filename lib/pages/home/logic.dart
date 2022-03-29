import 'dart:async';

import 'package:get/get.dart';
import 'package:lifeaste/common/events.dart';
import 'package:lifeaste/common/common.dart';
import 'package:lifeaste/manager/analyticsManager.dart';
import 'package:lifeaste/manager/hiveManager.dart';
import 'package:lifeaste/manager/net/apiManager.dart';
import 'package:lifeaste/manager/net/networkResultData.dart';
import 'package:lifeaste/pages/star_list/logic.dart';
import 'package:lifeaste/widgets/dialog/iconMsgDialog.dart';

import 'state.dart';



class HomeLogic extends GetxController {
  final state = HomeState();

  late StreamSubscription _unreadMsgEventBus; //持有事件
  late StreamSubscription _unreadOrderEventBus; //持有事件

  @override
  void onInit() {
    super.onInit();
    _updateUnreadMsg();
    Get.lazyPut(() => StarListLogic());
  }

  @override
  void onReady() {
    _prepareForDialog();
    _initEventBus();
    super.onReady();
  }

  @override
  void onClose() {
    _unreadMsgEventBus.cancel();
    _unreadOrderEventBus.cancel();
    super.onClose();
  }

  void setPageCount(int count) {
    state.pageCount = count;
  }

  void changeIndex(int index) {
    if (index >= state.pageCount) {
      state.index.value = state.pageCount - 1;
    } else {
      state.index.value = index;
      if (index == TabIndexOrderList) {
        eventBus.fire(NeedUpdateOrderListEvent());
        AnalyticsManager.instance.logEvent(EventName_OrderTabShow);
      } else if (index == TabIndexMyInfo) {
        apiManager.getMyInfo();
        AnalyticsManager.instance.logEvent(EventName_MeTabShow);
      } else if (index == TabIndexStarList) {
        AnalyticsManager.instance.logEvent(EventName_AdvisorTabShow);
      }
    }
  }

  void _updateUnread() {
    state.unread.value = state.unreadMsgCount > 0 || state.hasUnreadOrder;
  }

  void _updateUnreadMsg() async {

  }

  void _initEventBus() {
    _unreadOrderEventBus =
        eventBus.on<UnreadOrderUpdateEvent>().listen((event) {
      state.hasUnreadOrder = event.unreadCount > 0;
      _updateUnread();
    });
    _unreadMsgEventBus =
        eventBus.on<UpdateConversationEvent>().listen((event) async {
      _updateUnreadMsg();
    });
  }

  /// 当前设备是不是游客设备
  /// 登录过非游客账号则不是
  /// 首次启动时更新，确认之后，后续不用再作请求；未确认则每次启动都作请求
  void _prepareForDialog() async {

  }
}
