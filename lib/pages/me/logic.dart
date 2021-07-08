import 'dart:io';

import 'package:get/get.dart';
import 'package:lifeaste/common/tools.dart';
import 'package:lifeaste/common/typicalKeys.dart';
import 'package:lifeaste/manager/analyticsManager.dart';

import '../../routeConfig.dart';
import 'state.dart';

class MeLogic extends GetxController {
  final state = MeState();

  void feedbackBtnClick() {
    if (Platform.isIOS) {
      CommonFunction.openUrl('sms:${TypicalKeys.feedbackEmail}');
    } else {
      CommonFunction.openUrl('mailto:${TypicalKeys.feedbackEmail}');
    }
    AnalyticsManager.instance.logEvent(EventName_FeedbackClick);
  }

  void onClickDebugTools() {
    Get.toNamed(RouteConfig.debugTools);
  }

}
