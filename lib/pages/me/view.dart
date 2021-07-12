import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifeaste/common/common.dart';
import 'package:lifeaste/common/size_config.dart';
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
      title: Strings.mine,
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
                      style: Styles.subTextStyle(12),
                    )),
                SizedBox(height: 10),
                Visibility(
                  child: Center(
                      child: Text(
                        runtimeType.toString(),
                        style: Styles.subTextStyle(12),
                      )),
                  visible: runtimeType.toString().toLowerCase() ==
                      'profileview',
                ),
                SizedBox(height: 70),
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
        height: 60,
        margin: EdgeInsets.fromLTRB(20, 16, 20, 0),
        padding: EdgeInsets.fromLTRB(12, 0, 9, 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Styles.invert,
            boxShadow: [
              BoxShadow(color: Styles.shadowColor, blurRadius: 18, offset: Offset(0, 8), spreadRadius: 0)
            ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(iconStr, width: 30, height: 30),
            SizedBox(
              width: 4,
            ),
            Text(
              title,
              style: Styles.textStyleMedium(16),
            ),
            Expanded(
              child: Container(),
            ),
            trailing ?? Container(),
            Image.asset(ImageNames.arrow),
          ],
        ),
      ),
    );
  }

  Container buildUserInfoView() {
    if (state.userInfo.value.isGuest()) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        width: getProportionateScreenWidth(335),
        height: 175,
        alignment: Alignment.center,
        //height: getProportionateScreenWidth(207),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                height: 141,
                width: getProportionateScreenWidth(335),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Styles.invert,
                    boxShadow: [
                      BoxShadow(color: Styles.shadowColor, blurRadius: 18, offset: Offset(0, 8), spreadRadius: 0)
                    ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() {
                          return Text(
                            state.userInfo.value.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.textStyleBold(18),
                          );
                        }),
                        // SizedBox(width: 3),
                        // GestureDetector(
                        //   onTap: logic.onTapEdit,
                        //   child: Image.asset(
                        //     ImageNames.edit,
                        //     width: 14,
                        //     height: 14,
                        //     fit: BoxFit.contain,
                        //   ),
                        // )
                      ],
                    ),
                    SizedBox(height: 8),
                    Obx(() {
                      return Visibility(
                        visible: state.userInfo.value.bio.isNotEmpty,
                        child: Container(
                          padding: EdgeInsets.only(left: 25, right: 25),
                          child: AutoSizeText(
                            state.userInfo.value.bio,
                            style: Styles.textStyleMedium(14),
                            maxLines: 4,
                            minFontSize: 12,
                          ),
                        ),
                      );
                    }),
                    SizedBox(
                      height: 38,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                width: getProportionateScreenWidth(335),
                alignment: Alignment.center,
                child: Obx(() {
                  return AvatarView(
                    80,
                    state.userInfo.value.avatar,
                  );
                }),
              )
            ),
          ],
        ),
      );
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: getProportionateScreenWidth(335),
      height: 175,
      alignment: Alignment.center,
      //height: getProportionateScreenWidth(207),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: 141,
              width: getProportionateScreenWidth(335),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Styles.invert,
                  boxShadow: [
                    BoxShadow(color: Styles.shadowColor, blurRadius: 18, offset: Offset(0, 8), spreadRadius: 0)
                  ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Obx(() {
                        return Text(
                          state.userInfo.value.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.textStyleBold(18),
                        );
                      }),
                      // SizedBox(width: 3),
                      // GestureDetector(
                      //   onTap: logic.onTapEdit,
                      //   child: Image.asset(
                      //     ImageNames.edit,
                      //     width: 14,
                      //     height: 14,
                      //     fit: BoxFit.contain,
                      //   ),
                      // )
                    ],
                  ),
                  SizedBox(height: 8),
                  Obx(() {
                    return Visibility(
                      visible: state.userInfo.value.bio.isNotEmpty,
                      child: Container(
                        padding: EdgeInsets.only(left: 25, right: 25),
                        child: AutoSizeText(
                          state.userInfo.value.bio,
                          style: Styles.textStyleMedium(14),
                          maxLines: 4,
                          minFontSize: 12,
                        ),
                      ),
                    );
                  }),
                  SizedBox(
                    height: 38,
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: 0,
              child: Container(
                width: getProportionateScreenWidth(335),
                alignment: Alignment.center,
                child: Obx(() {
                  return AvatarView(
                    80,
                    state.userInfo.value.avatar,
                  );
                }),
              )
          ),
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
