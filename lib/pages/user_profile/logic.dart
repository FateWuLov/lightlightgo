
import 'package:get/get.dart';
import 'package:lifeaste/common/events.dart';
import 'package:lifeaste/common/strings.dart';
import 'package:lifeaste/common/tools.dart';
import 'package:lifeaste/logic/global.dart';
import 'package:lifeaste/manager/analyticsManager.dart';
import 'package:lifeaste/manager/database/databaseMagager.dart';
import 'package:lifeaste/manager/net/apiManager.dart';
import 'package:lifeaste/manager/net/networkResultData.dart';
import 'package:lifeaste/models/orderModel.dart';
import 'package:lifeaste/models/userModel.dart';
import 'package:lifeaste/pages/create_order/state.dart';
import 'package:lifeaste/pages/create_order/view.dart';
import 'package:lifeaste/pages/user_profile/state.dart';

class UserProfileLogic extends GetxController {
  final state = UserProfileState();

  void onPopBack() {
    Get.back();
  }

  void onSelectService(ServiceInfoModel service) {
    showNormalDialog(
        arguments: CreateOrderPageArgs(state.userInfo, service),
        child: CreateOrderPage()
    );

    AnalyticsManager.instance.clickServiceType(
      state.userInfo,
      service,
      ParamFromAdvisorCard,
    );
    if (state.userInfo.isFollowUpPeriod()) {
      //入口统计
      AnalyticsManager.instance
          .logEvent(EventName_FollowUpServiceClick, parameters: {
        'value': 'advisor_page',
      });
    }
  }

  void onTapCollect() async {
    bool favorite = state.userInfo.favorite;
    showLoadingToast();
    NetResultData resultData;
    if (favorite) {
      resultData = await apiManager.unfavoriteUser(state.userInfo.userId);
    } else {
      resultData = await apiManager.favoriteUser(state.userInfo.userId);
    }
    cleanAllToast();
    if (!resultData.result) {
      showHttpErrorToast(resultData);
    } else {
      showTipsToast(Strings.success);
      state.userInfo.favorite = !favorite;
      update([state.favoriteIconGId]);
      if (state.userInfo.favorite) {
        // subscribeNotification(state.userInfo, NotifyAlways, NotifyAlways);
        AnalyticsManager.instance.logEvent(AdvisorLikeAdvisorSuccess);
      } else {
        // subscribeNotification(state.userInfo, NotifyNever, NotifyNever);
      }
    }
  }

  bool isStar() {
    return !state.userInfo.isNormalUser();
  }

  List<ServiceInfoModel> serviceList() {
    if (!isStar()) {
      return [];
    }
    List<ServiceInfoModel> services = [];
    // if (state.selectTab.value == ServiceSegmentType.premium) {
    //   //增值服务
    //   for (PremiumService obj in state.userInfo.premiumServices) {
    //     ServiceInfoModel model = serviceFromPremium(obj);
    //     services.add(model);
    //   }
    // } else if (state.selectTab.value == ServiceSegmentType.live) {
    //   //普通服务
    //   state.userInfo.availableService.sort((a, b) {
    //     return a.type.compareTo(b.type);
    //   });
    //   for (ServiceInfoModel model in state.userInfo.availableService) {
    //     if (model.isRealTime()) {
    //       if (state.userInfo.canChatFree() &&
    //           model.type == ServiceType.serviceTypeTextCall.index) {
    //         services.insert(0, model);
    //       } else {
    //         services.add(model);
    //       }
    //     }
    //   }
    // } else {
      //普通服务
      state.userInfo.availableService.sort((a, b) {
        return a.type.compareTo(b.type);
      });
      for (ServiceInfoModel model in state.userInfo.availableService) {
        if (!model.isRealTime()) {
          model.discountable = state.userInfo.isFollowUpPeriod();
          services.add(model);
        }
      }
    // }
    return services;
  }

  void _requestUserInfo() async {
    NetResultData resultData = await apiManager.getUserInfo(
        state.userInfo.userId,
        isStar: !state.userInfo.isNormalUser());
    if (resultData.result) {
      _updateUserInfo(UserInfoModel.fromJson(resultData.data));
      eventBus.fire(DidUpdateUserInfoEvent(state.userInfo));
    } else {
      UserInfoModel? userInfoModel = await DatabaseManager.instance.getUser(state.userInfo.userId);
      if (userInfoModel != null) {
        _updateUserInfo(userInfoModel);
      }
    }
  }

  void _updateUserInfo(UserInfoModel user) {
    state.userInfo = user;
    update([state.rootGId]);
  }

  void _refreshRecentView() async {
    //记录最近浏览的神婆
    if (!state.userInfo.isOfficialSupport() &&
        !state.userInfo.isAssistantIdSupport()) {
      //非官号,非小助手才记录
      // Get.find<StarListLogic>().updateRecentViewedAdvisor(state.userInfo.userId);
    }
  }

  //
  // void _logSegmentShow() {
  //   if (state.selectTab.value == ServiceSegmentType.reading) {
  //     AnalyticsManager.instance
  //         .logEvent(EventName_ReadingSegmentShow, parameters: {
  //       'from': ParamFromAdvisorCard,
  //     });
  //   } else if (state.selectTab.value == ServiceSegmentType.live) {
  //     AnalyticsManager.instance
  //         .logEvent(EventName_LiveSegmentShow, parameters: {
  //       'from': ParamFromAdvisorCard,
  //     });
  //   } else if (state.selectTab.value == ServiceSegmentType.premium) {
  //     AnalyticsManager.instance
  //         .logEvent(EventName_PremiumSegmentShow, parameters: {
  //       'from': ParamFromAdvisorCard,
  //     });
  //   }
  // }
  //
  // void _onConsult(ServiceSegmentType segment) {
  //   showNormalDialog(
  //     child: ServiceListDialog(
  //       state.userInfo,
  //       from: ParamFromAdvisorPageConnect,
  //       initTab: segment,
  //       attachPicturePath: state.attachPicturePath,
  //       onSelect: (service) {
  //         AnalyticsManager.instance.clickServiceType(
  //             state.userInfo, service, ParamFromAdvisorPageConnect);
  //         AnalyticsManager.instance.logEvent(
  //           EventName_OrderDetailAskAgainClick,
  //           parameters: {Param_Type: service.eventName()},
  //         );
  //         if (state.userInfo.isFollowUpPeriod()) {
  //           //入口统计
  //           AnalyticsManager.instance
  //               .logEvent(EventName_FollowUpServiceClick, parameters: {
  //             'value': 'askagain_popup',
  //           });
  //         }
  //       },
  //       discountDeadline: state.userInfo.followUpDeadline,
  //     ),
  //   );
  //   AnalyticsManager.instance.logEvent(
  //     EventName_OrderDetailAskAgainPopup,
  //   );
  // }

  @override
  void onInit() {
    super.onInit();
    UserPageArgs arg = Get.arguments;
    state.userInfo = arg.userModel;
    state.attachPicturePath = arg.attachPicturePath;
    state.fromPage = arg.fromPage;

    // Global.xmppLogic().connect();
    // xmppSubscribeOnlineMode(state.userInfo.userId);

    AnalyticsManager.instance
        .logEvent(EventName_AdvisorProfilePageShow, parameters: {
      'from': state.fromPage,
    });
    AnalyticsManager.instance.logEvent(
      EventName_ServiceTypeShow,
      parameters: {'from': ParamFromAdvisorCard},
    );
    // _logSegmentShow();
  }

  @override
  void onReady() {
    Future.delayed(Duration(milliseconds: 500), () {
      _refreshRecentView();
    });
    _requestUserInfo();
    super.onReady();
  }

  @override
  void onClose() {
    Global.logic().state.liveOnlineStars = [];
    Global.logic().state.inWorkStars = [];
    super.onClose();
  }
}
