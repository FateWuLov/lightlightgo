
import 'dart:ui';

import 'package:devicelocale/devicelocale.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:lifeaste/common/common.dart';
import 'package:lifeaste/common/fn_method_channel.dart';
import 'package:lifeaste/models/userModel.dart';
import 'package:package_info/package_info.dart';

import 'hiveManager.dart';

enum Flavor {
  develop,
  distribution
}

class GlobalManager {

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


  static GlobalManager get instance => _getInstance();
  static GlobalManager? _instance;
  GlobalManager._();

  static GlobalManager _getInstance() {
    var obj = _instance ?? GlobalManager._();
    if (_instance == null) {
      _instance = obj;
      initialSP();
    }
    return obj;
  }

  bool isDebugEnv() {
    return appFlavor == Flavor.develop;
  }

  void finishLaunching() {
    launchFinished = true;
  }

  void didOpenRate() {
    isOpenStoreRateOnce.value = true;
  }

  loadNativeInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
    locale = await Devicelocale.currentAsLocale;
    var value = await Info.methodChannel.invokeMethod(methodNameGetNativeInfo);
    if (value != null) {
      uuid = value['uuid'] ?? '';
      guestId = value['guestId'] ?? '';
      isDevelopScheme = value['isDevelop'] == 1;
    }
    print('loadNativeInfo ${value?.entries}');

    if (packageInfo?.packageName.contains('test') == true) {
      appFlavor = Flavor.develop;
      isDebugServer = true;
    } else {
      appFlavor = Flavor.distribution;
      isDebugServer = false;
    }
  }

  String getVersionStr()  {
    String serverInfo = isDebugServer ? "\n服务器: 测试服（生产环境不应出现）" : "";
    return "version:" + '${packageInfo?.version}' + serverInfo;
  }
}
