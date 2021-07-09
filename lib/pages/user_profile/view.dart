
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifeaste/common/colors.dart';
import 'package:lifeaste/common/images.dart';
import 'package:lifeaste/common/size_config.dart';
import 'package:lifeaste/common/strings.dart';
import 'package:lifeaste/common/tools.dart';
import 'package:lifeaste/pages/user_profile/state.dart';
import 'package:lifeaste/widgets/roundAvatar.dart';

import 'logic.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  String _logicTag = '';
  UserProfileLogic logic = UserProfileLogic();
  UserProfileState state = UserProfileState();

  @override
  void initState() {
    super.initState();
    _logicTag = (Get.arguments?.hashCode.toString() ?? '') + DateTime.now().microsecondsSinceEpoch.toString();
    logic = Get.put(UserProfileLogic(), tag: _logicTag);
    state = Get.find<UserProfileLogic>(tag: _logicTag).state;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfileLogic>(
      tag: _logicTag,
      id: state.rootGId,
      builder: (UserProfileLogic logic) {
        return buildBaseView();
      },
    );
  }

  Widget buildBaseView() {
    return Scaffold(
      backgroundColor: GlobalColors.mainBg,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 15,),
          _navUserInfo(),
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20),
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(height: 11,),
              _userInfoView(),
              SizedBox(height: 20,),
              _aboutContent(),
            ],
          ),
        ],
      )
    );
  }

  Widget _navUserInfo() {
    return SafeArea(
      bottom: false,
      child: Container(
        height: 30,
        width: SizeConfig.screenWidth,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Positioned(
              left: 18,
              child: GestureDetector(
                onTap: logic.onPopBack,
                child: Image.asset(
                  ImageNames.back,
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              alignment: Alignment.center,
              child: Text(
                breakWord(state.userInfo.name),
                style: textStyleTitle(18),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _userInfoView() {
    return Container(
      width: getProportionateScreenWidth(335),
      height: 200,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Positioned(
            top: 30,
            child: Container(
              width: getProportionateScreenWidth(335),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: GlobalColors.darkThemeText,
                  boxShadow: [
                    BoxShadow(color: GlobalColors.shadowColor, blurRadius: 18, offset: Offset(0, 8), spreadRadius: 0)
                  ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 70,),
                  GestureDetector(
                    onTap: logic.onAskNow,
                    child: Container(
                      width: 311,
                      height: 41,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: GlobalColors.buttonBg
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        Strings.askNow,
                        style: textStyleBold(18).copyWith(color: GlobalColors.darkThemeText),
                      ),
                    ),
                  ),
                  SizedBox(height: 24,)
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: getProportionateScreenWidth(335),
              alignment: Alignment.center,
              child: RoundAvatar(
                80,
                state.userInfo.avatar,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _aboutContent() {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 18, 12, 23),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: GlobalColors.darkThemeText,
          boxShadow: [
            BoxShadow(color: GlobalColors.shadowColor, blurRadius: 18, offset: Offset(0, 8), spreadRadius: 0)
          ]
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              Strings.about,
              style: textStyleBold(18),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              state.userInfo.about.length > 0
                  ? state.userInfo.about
                  : Strings.aboutHold,
              style: subTextStyleNormal(14),
              softWrap: true,
            )
          ],
        ),
      ),
    );
  }

}
