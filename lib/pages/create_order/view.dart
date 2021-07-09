import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifeaste/common/common.dart';
import 'package:lifeaste/widgets/gestureContainer.dart';
import 'package:lifeaste/widgets/innerShadowButton.dart';

import 'logic.dart';
import 'state.dart';

class CreateOrderPage extends StatefulWidget {
  @override
  _CreateOrderPageState createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  final CreateOrderLogic logic = Get.put(CreateOrderLogic());
  final CreateOrderState state = Get
      .find<CreateOrderLogic>()
      .state;

  @override
  void dispose() {
    Get.delete<CreateOrderLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureContainer(
        onTap: logic.onTapBg,
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Styles.mainBg,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 62,
                  child: Row(
                    children: [
                      SizedBox(width: 26),
                      Text(
                        Strings.question,
                        style: Styles.textStyleBold(18),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: logic.onLeave,
                        padding: EdgeInsets.all(13),
                        icon: Image.asset(ImageNames.shutDown),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 118,
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      color: Styles.invert,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Styles.lightTheme,
                          blurRadius: 18,
                          offset: Offset(0, 8),
                        )
                      ]),
                  child: TextField(
                    onChanged: logic.onQuestionChange,
                    controller: state.questionEditController,
                    decoration: InputDecoration(
                      focusColor: Styles.mainTheme,
                      hintStyle: Styles.subTextStyle(14),
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: Strings.inputQuestionTips,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 12, vertical: 18),
                    ),
                    maxLines: 5,
                    style: Styles.textStyle(14),
                    scrollPadding: EdgeInsets.only(bottom: 50),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Obx(() {
                    return CustomButton(
                      onTap: logic.onSubmit,
                      title: Strings.submit,
                      textSize: 18,
                      buttonType: ButtonType.solid,
                      enable: state.canSubmit.value,
                    );
                  }),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
