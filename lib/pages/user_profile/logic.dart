import 'package:get/get.dart';
import 'package:lifeaste/common/events.dart';
import 'package:lifeaste/common/common.dart';
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
        child: CreateOrderPage());

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

  void onAskNow() {
    ServiceInfoModel service = ServiceInfoModel.fromJson({});
    service.type = ServiceType.serviceTypeText.index;
    showNormalDialog(
        arguments: CreateOrderPageArgs(state.userInfo, service),
        child: CreateOrderPage());
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
        AnalyticsManager.instance.logEvent(AdvisorLikeAdvisorSuccess);
      } else {

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
      UserInfoModel? userInfoModel =
          await DatabaseManager.instance.getUser(state.userInfo.userId);
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

  }

  @override
  void onInit() {
    super.onInit();
    UserPageArgs arg = Get.arguments;
    state.userInfo = arg.userModel;
    state.attachPicturePath = arg.attachPicturePath;
    state.fromPage = arg.fromPage;

    AnalyticsManager.instance
        .logEvent(EventName_AdvisorProfilePageShow, parameters: {
      'from': state.fromPage,
    });
    AnalyticsManager.instance.logEvent(
      EventName_ServiceTypeShow,
      parameters: {'from': ParamFromAdvisorCard},
    );
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
