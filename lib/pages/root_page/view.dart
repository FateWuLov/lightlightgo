import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifeaste/common/size_config.dart';
import 'package:lifeaste/pages/home/view.dart';

import 'logic.dart';
import 'state.dart';

class RootPage extends StatelessWidget {
  final RootPageLogic logic = Get.find<RootPageLogic>();
  final RootPageState state = Get.find<RootPageLogic>().state;

  @override
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
            () => baseContent()
        )
    );
  }

  Widget baseContent() {
    if (state.name.value == RootPageNameHome) {
      return HomePage();
    }
    return Container();
  }
}
