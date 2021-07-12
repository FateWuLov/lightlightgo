
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifeaste/common/common.dart';
import 'package:lifeaste/pages/user_profile/state.dart';
import 'package:lifeaste/widgets/base/baseNavBar.dart';
import 'package:lifeaste/widgets/base/basePage.dart';
import 'package:lifeaste/widgets/innerShadowButton.dart';
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
    return BasePage(
      navBar: BaseNavBar(
        title: state.userInfo.name,
        leftAction: logic.onPopBack,
      ),
      child: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 44),
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(height: 11,),
            _userInfoView(),
            SizedBox(height: 20,),
            _aboutContent(),
        ],
      )
    ));
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
                  color: Styles.invert,
                  boxShadow: [
                    BoxShadow(color: Styles.shadowColor, blurRadius: 18, offset: Offset(0, 8), spreadRadius: 0)
                  ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 60,),
                  state.userInfo.bio.isNotEmpty
                      ? Text(
                    state.userInfo.bio,
                    style: Styles.textStyleMedium(14),
                    overflow: TextOverflow.ellipsis,
                  )
                      : Container(),
                  SizedBox(height: 17,),
                  CustomButton(
                    onTap: logic.onAskNow,
                    width: 311,
                    height: 41,
                    title: Strings.askNow,
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
              child: AvatarView(
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
          color: Styles.invert,
          boxShadow: [
            BoxShadow(color: Styles.shadowColor, blurRadius: 18, offset: Offset(0, 8), spreadRadius: 0)
          ]
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              Strings.about,
              style: Styles.textStyleBold(18),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              state.userInfo.about.length > 0
                  ? state.userInfo.about
                  : Strings.aboutHold,
              style: Styles.subTextStyle(14),
              softWrap: true,
            )
          ],
        ),
      ),
    );
  }

}
