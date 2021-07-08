import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifeaste/common/strings.dart';
import 'package:lifeaste/models/userModel.dart';
import 'package:lifeaste/widgets/base/baseTabPage.dart';
import 'package:lifeaste/widgets/loading.dart';
import 'package:lifeaste/widgets/starCard.dart';

import 'logic.dart';
import 'state.dart';

class StarListPage extends StatelessWidget {
  final StarListLogic logic = Get.put(StarListLogic());
  final StarListState state = Get.find<StarListLogic>().state;

  @override
  Widget build(BuildContext context) {
    return BaseTabPage(
      title: Strings.advisor,
      child: GetBuilder<StarListLogic>(
        id: state.dataListGID,
        builder: (logic) {
          return _mainContent();
        },
      ),
    );
  }

  Widget _mainContent() {
    if (state.dataList.isNotEmpty) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            if (index >= state.dataList.length) return Container();
            UserInfoModel model = state.dataList[index];
            return StarCard(
              model,
              onTap: () {
                logic.onClickStar(model);
              },
              onAsk: () {
                logic.onAskStar(model);
              },
            );
          },
          itemCount: state.dataList.length,
        ),
      );
    }
    return Expanded(child: Center(
      child: LoadingView(),
    ));
  }
}
