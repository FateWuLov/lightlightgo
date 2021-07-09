import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifeaste/common/styles.dart';
import 'package:lifeaste/common/images.dart';
import 'package:lifeaste/common/strings.dart';
import 'package:lifeaste/common/tools.dart';
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
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: Container(
          color: GlobalColors.mainBg,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 62,
                child: Row(
                  children: [
                    SizedBox(width: 26),
                    Text(Strings.question, style: textStyleBold(18),),
                    Spacer(),
                    IconButton(
                      onPressed: logic.onLeave,
                      padding: EdgeInsets.all(13),
                      icon:Image.asset(ImageNames.shutDown),
                    ),
                  ],
                ),
              ),
              Container(
                height: 118,
                margin: EdgeInsets.symmetric(horizontal: 12),
                color: Colors.white,
              ),
              SizedBox(height: 20),
              Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: InnerShadowButton(
                  onTap: logic.onSubmit,
                  title: Strings.submit,
                  textSize: 18,
                  buttonType: ButtonType.solid,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}