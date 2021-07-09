import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifeaste/common/styles.dart';
import 'package:lifeaste/common/images.dart';
import 'package:lifeaste/common/strings.dart';
import 'package:lifeaste/common/tools.dart';
import 'package:lifeaste/widgets/innerShadowButton.dart';

import 'logic.dart';
import 'state.dart';

class OrderSuccessPage extends StatefulWidget {
  @override
  _OrderSuccessPageState createState() => _OrderSuccessPageState();
}

class _OrderSuccessPageState extends State<OrderSuccessPage> {
  final OrderSuccessLogic logic = Get.put(OrderSuccessLogic());
  final OrderSuccessState state = Get.find<OrderSuccessLogic>().state;

  @override
  void dispose() {
    Get.delete<OrderSuccessLogic>();
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
          decoration: BoxDecoration(
            color: GlobalColors.mainBg,
            borderRadius: BorderRadius.circular(16)
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 5),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: logic.onLeave,
                  padding: EdgeInsets.all(13),
                  icon:Image.asset(ImageNames.shutDown),
                ),
              ),
              SizedBox(height: 11),
              Image.asset(ImageNames.illustration),
              SizedBox(height: 1),
              Text(Strings.submitSuccessfully, style: textStyleBold(18),),
              SizedBox(height: 11),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: InnerShadowButton(
                  onTap: logic.onViewDetail,
                  height: 48,
                  title: Strings.viewDetails,
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