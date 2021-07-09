import 'dart:io';

import 'package:devicelocale/devicelocale.dart';
import 'package:get/get.dart';
import 'package:lifeaste/common/fn_method_channel.dart';
import 'package:lifeaste/common/info.dart';
import 'package:lifeaste/manager/hiveManager.dart';
import 'package:package_info/package_info.dart';
import '../global.dart';
import 'state.dart';

class GlobalLogic extends GetxController {
  final state = GlobalState();

  bool isDebugEnv() {
    return state.appFlavor == Flavor.develop;
  }

  void finishLaunching() {
    state.launchFinished = true;
  }

  void didOpenRate() {
    state.isOpenStoreRateOnce.value = true;
  }

  loadNativeInfo() async {
    state.packageInfo = await PackageInfo.fromPlatform();
    state.locale = await Devicelocale.currentAsLocale;
    var value = await Info.methodChannel.invokeMethod(methodNameGetNativeInfo);
    if (value != null) {
      state.uuid = value['uuid'] ?? '';
      state.guestId = value['guestId'] ?? '';
      state.isDevelopScheme = value['isDevelop'] == 1;
    }
    print('loadNativeInfo ${value?.entries}');

    if (state.packageInfo?.packageName.contains('test') == true) {
      state.appFlavor = Flavor.develop;
      state.isDebugServer = true;
    } else {
      state.appFlavor = Flavor.distribution;
      state.isDebugServer = false;
    }
  }

  String getVersionStr()  {
    String schemeInfo = "";
    if(Platform.isIOS && state.isDevelopScheme) {
      // schemeInfo = this._nativeMacroInfo["isDevelop"] ? "\nscheme: 开发中（生产环境不应出现）" : "";
    }

    String serverInfo = (state.isDebugServer ? "\n服务器: 测试服（生产环境不应出现）" : "");

    String abTest = '';
    // if (isDebugEnv() || Global.userLogic().state.user.isDebugUser()) {
    //   abTest = '\n测试或debug登录可见->\nab测试: ';
    // }

    return "version:" + '${state.packageInfo?.version}' + serverInfo + schemeInfo + abTest;
  }

  @override
  void onInit() {
    super.onInit();
    initialSP();
  }
}
