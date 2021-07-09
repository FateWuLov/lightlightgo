import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifeaste/common/styles.dart';
import 'package:lifeaste/common/tools.dart';
import 'package:lifeaste/widgets/base/baseNavBar.dart';
import 'package:lifeaste/widgets/base/basePage.dart';
import 'package:lifeaste/widgets/gestureContainer.dart';

import 'logic.dart';
import 'state.dart';

class DebugToolsPage extends StatelessWidget {
  final DebugToolsLogic logic = Get.put(DebugToolsLogic());
  final DebugToolsState state = Get.find<DebugToolsLogic>().state;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      navBar: BaseNavBar(
        title: 'Debug Tools',
      ),
      child: Scaffold(
        backgroundColor: GlobalColors.mainBg,
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 44),
            children: [
              GestureContainer(
                height: 60,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: GlobalColors.mainTheme)
                  ),
                  child: Text(
                    '重置游客登录账号',
                    style: mainTextStyleNormal(18),
                  ),
                ),
                onTap: logic.onResetGuestId,
              ),
              // GestureContainer(
              //   height: 60,
              //   child: Container(
              //     alignment: Alignment.center,
              //     decoration: BoxDecoration(
              //         border: Border.all(color: GlobalColors.mainTheme)
              //     ),
              //     child: Text(
              //       '退出当前账号',
              //       style: mainTextStyleNormal(18),
              //     ),
              //   ),
              //   onTap: logic.onLogout,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
