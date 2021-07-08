import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifeaste/common/colors.dart';
import 'package:lifeaste/common/images.dart';
import 'package:lifeaste/common/size_config.dart';
import 'package:lifeaste/common/strings.dart';
import 'package:lifeaste/common/tools.dart';
import 'package:lifeaste/logic/global.dart';
import 'package:lifeaste/widgets/base/baseTabPage.dart';
import 'package:lifeaste/widgets/roundAvatar.dart';

import 'logic.dart';
import 'state.dart';

class MePage extends StatelessWidget {
  final MeLogic logic = Get.put(MeLogic());
  final MeState state = Get.find<MeLogic>().state;
  // final XmppState xmppState = Global.xmppLogic().state;
  // final PushState pushState = Global.pushLogic().state;

  @override
  Widget build(BuildContext context) {
    return BaseTabPage(
      title: Strings.order,
      child: Expanded(
        child: Container(
            child: ListView(
              padding: EdgeInsets.only(top: 0),
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(height: 20),
                buildUserInfoView(),
                createListItem(ImageNames.feedback, Strings.feedback,
                    logic.feedbackBtnClick),
                _debugTools(),
                SizedBox(height: 10),
                Center(
                    child: Text(
                      Global.logic().getVersionStr(),
                      textAlign: TextAlign.center,
                      style: greyTextStyleNormal(12),
                    )),
                SizedBox(height: 10),
                Visibility(
                  child: Center(
                      child: Text(
                        runtimeType.toString(),
                        style: subTextStyleNormal(12),
                      )),
                  visible: runtimeType.toString().toLowerCase() ==
                      'profileview',
                ),
              ],
            )),
      ),
    );
  }

  createListItem(String iconStr, String title, VoidCallback btnAction,
      {Widget? trailing}) {
    return GestureDetector(
      onTap: btnAction,
      child: Container(
        height: 62,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: GlobalColors.greyLine, width: 1))),
          margin: EdgeInsets.symmetric(horizontal: 17),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(iconStr, width: 30, height: 30),
              SizedBox(
                width: 8,
              ),
              Text(
                title,
                style: mainTextStyleNormal(18),
              ),
              Expanded(
                child: Container(),
              ),
              trailing ?? Container(),
              Image.asset(ImageNames.arrow),
            ],
          ),
        ),
      ),
    );
  }

  Container buildUserInfoView() {
    if (state.userInfo.value.isGuest()) {
      return Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        height: 207,
        width: getProportionateScreenWidth(335),
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RoundAvatar(
              getProportionateScreenWidth(60),
              state.userInfo.value.avatar,
            ),
            Text(
              state.userInfo.value.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textStyleTitleBold(18),
            ),
          ],
        ),
      );
    }
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      //height: getProportionateScreenWidth(207),
      width: getProportionateScreenWidth(335),
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Stack(
        children: [
          Container(
            width: getProportionateScreenWidth(335),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                Obx(() {
                  return RoundAvatar(
                    getProportionateScreenWidth(60),
                    state.userInfo.value.avatar,
                  );
                }),
                SizedBox(
                  height: getProportionateScreenWidth(9),
                ),
                Obx(() {
                  return Text(
                    state.userInfo.value.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textStyleTitleBold(18).copyWith(color: Colors.white),
                  );
                }),
                SizedBox(height: getProportionateScreenWidth(4)),
                Obx(() {
                  return Visibility(
                    visible: state.userInfo.value.bio.isNotEmpty,
                    child: Container(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: AutoSizeText(
                        state.userInfo.value.bio,
                        style: subTextStyleNormal(14)
                            .copyWith(color: Colors.white),
                        maxLines: 4,
                        minFontSize: 12,
                      ),
                    ),
                  );
                }),
                SizedBox(
                  height: getProportionateScreenWidth(39),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _debugTools() {
    return Visibility(
      visible: state.userInfo.value.isDebugUser() || Global.logic().isDebugEnv(),
      child: Container(
          child: createListItem(ImageNames.orders, 'DebugTools', () {
            logic.onClickDebugTools();
          })),
    );
  }
}
