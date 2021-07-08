import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifeaste/models/userModel.dart';
import 'package:package_info/package_info.dart';

class GlobalState {

  Flavor appFlavor = Flavor.distribution;

  /// 完成启动页，进入app内部
  bool launchFinished = false;

  String uuid = '';

  String guestId = '';

  bool isDevelopScheme = false;

  /// 当前设备的本地化信息
  Locale? locale;

  PackageInfo? packageInfo;

  int discoverBannerDisappearTime = 0;

  bool isDebugServer = false;

  // 保存inWorkStars
  List<UserInfoModel> inWorkStars = [];
  List<UserInfoModel> liveOnlineStars = [];

  RxBool isOpenStoreRateOnce = false.obs;

  RxBool showNotificationBanner = true.obs;

  GlobalState() {
    ///Initialize variables
    print('[GETX] GlobalState Initialize');
  }
}

enum Flavor {
  develop,
  distribution
}