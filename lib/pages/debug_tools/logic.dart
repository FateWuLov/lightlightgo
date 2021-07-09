import 'package:get/get.dart';
import 'package:lifeaste/common/fn_method_channel.dart';
import 'package:lifeaste/common/common.dart';
import 'package:lifeaste/logic/global.dart';
import 'package:lifeaste/widgets/dialog/iconMsgDialog.dart';
import 'package:lifeaste/widgets/dialog/normalDialog.dart';
import 'state.dart';

class DebugToolsLogic extends GetxController {
  final state = DebugToolsState();

  void onResetGuestId() {
    showNormalDialog(
      child: NormalDialog(
        content: '重置之后这个账号就不见了，除非你绑定过',
        subTitle: '不了',
        mainTitle: '重置',
        mainAction: () async {
          showLoadingToast();
          await Info.methodChannel.invokeMethod(methodNameResetGuestId);
          await Global.logic().loadNativeInfo();
          await Global.userLogic().logout();
          await Global.userLogic().guestLogin(checkBefore: false);

          showNormalDialog(
            barrierDismissible: false,
            child: IconMsgDialog(
              needCloseIcon: false,
              message: '重置账号成功，重启',
            )
          );
        },
      ),
    );
  }

  void onPopBack() {
    Get.back();
  }

  void onLogout() {
    Global.userLogic().logout();
  }
}
