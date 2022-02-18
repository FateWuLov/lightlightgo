import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifeaste/common/common.dart';
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
        leftAction: logic.onPopBack,
      ),
      child: Scaffold(
        backgroundColor: Styles.mainBg,
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 44),
            children: [
              GestureContainer(
                //height: 60,
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Styles.mainTheme),
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Text(
                    '重置游客登录账号',
                    style: Styles.textStyle(18),
                  ),
                ),
                onTap: logic.onResetGuestId,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
