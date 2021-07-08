import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifeaste/common/strings.dart';
import 'package:lifeaste/widgets/base/baseTabPage.dart';

import 'logic.dart';
import 'state.dart';

class StarListPage extends StatelessWidget {
  final StarListLogic logic = Get.put(StarListLogic());
  final StarListState state = Get.find<StarListLogic>().state;

  @override
  Widget build(BuildContext context) {
    return BaseTabPage(
      title: Strings.advisor,
    );
  }
}
