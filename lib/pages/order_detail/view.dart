import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifeaste/common/common.dart';
import 'package:lifeaste/common/size_config.dart';
import 'package:lifeaste/models/orderModel.dart';
import 'package:lifeaste/widgets/base/baseNavBar.dart';
import 'package:lifeaste/widgets/base/basePage.dart';
import 'package:lifeaste/widgets/gestureContainer.dart';
import 'package:lifeaste/widgets/buttons.dart';
import 'package:lifeaste/widgets/roundAvatar.dart';

import 'logic.dart';
import 'state.dart';

class OrderDetailPage extends StatelessWidget {
  final OrderDetailLogic logic = Get.put(OrderDetailLogic());
  final OrderDetailState state = Get.find<OrderDetailLogic>().state;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      navBar: BaseNavBar(
        centerItem: _navStarInfo(),
        rightItem: _narAskButton(),
        leftAction: logic.onBack,
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 64),
            Expanded(
                child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              children: [
                _orderInfo(),
                SizedBox(height: 30),
                _questionInfo(),
                SizedBox(height: 30),
                _replyInfo(),
              ],
            )),
            _footer(),
          ],
        ),
      ),
    );
  }

  Widget _navStarInfo() {
    return GestureContainer(
      onTap: logic.onClickStar,
      child: Row(
        children: [
          AvatarView(32, state.starInfo.avatar, hasShadow: false,),
          SizedBox(width: 6),
          Expanded(
              child: Text(
            state.starInfo.name,
            style: Styles.textStyleBold(18),
          )),
        ],
      ),
    );
  }

  Widget _narAskButton() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(right: 20),
      child: CustomButton(
        width: 88,
        height: 26,
        title: Strings.askNow,
        textSize: 14,
        onTap: logic.onAsk,
      ),
    );
  }

  Widget _orderInfo() {
    return Container(
      height: 130,
      decoration: BoxDecoration(
        color: Styles.mainBg,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Styles.lightTheme,
            offset: Offset(0, 8),
            blurRadius: 18,
          )
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 2),
          Container(
            height: 53,
            margin: EdgeInsets.all(1),
            decoration: BoxDecoration(
                color: Styles.invert,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Styles.lightTheme.withOpacity(0.5),
                    offset: Offset(0, 8),
                    blurRadius: 20,
                  )
                ]),
            alignment: Alignment.center,
            child: Row(
              children: [
                SizedBox(width: 12),
                Text(state.order.service.title(), style: Styles.textStyle(16)),
                Container(
                  width: 1,
                  height: 12,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  color: Styles.themeLine,
                ),
                Text(
                  state.seenStatusTitle(),
                  style: Styles.textStyleBold(16)
                      .copyWith(color: state.seenStatusColor()),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.startTimeTitle(), style: Styles.themeTextStyleBold(14)),
                    SizedBox(height: 3),
                    Text(stringFromTimestamp(state.order.createTime),
                        style: Styles.subTextStyle(10)),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.endTimeTitle(), style: Styles.themeTextStyleBold(14)),
                    SizedBox(height: 3),
                    Text(state.endTimestampStr(), style: Styles.subTextStyle(10)),
                  ],
                ),
                SizedBox(width: 12),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _questionInfo() {
    return Container(
      decoration: BoxDecoration(
          color: Styles.invert,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Styles.lightTheme,
              offset: Offset(0, 8),
              blurRadius: 18,
            )
          ]),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.question,
            style: Styles.textStyleBold(18),
          ),
          SizedBox(height: 6),
          Text(
            state.order.question,
            style: Styles.subTextStyle(14),
          ),
          SizedBox(height: 6),
        ],
      ),
    );
  }

  Widget _replyInfo() {
    return Visibility(
      visible: state.hasReply(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.reply,
            style: Styles.textStyleBold(18),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Styles.subTheme,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                state.order.answer.text,
                style: Styles.textStyle(14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _footer() {
    return Container(
      decoration: BoxDecoration(
        color: Styles.lightTheme,
      ),
      width: SizeConfig.screenWidth,
      height: 60,
      child: Center(
        child: Text(
          Strings.waitReply,
          style: Styles.textStyleBold(16).copyWith(color: Styles.tabDeselect),
        ),
      ),
    );
  }
}
