import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifeaste/common/common.dart';
import 'package:lifeaste/models/userModel.dart';
import 'package:lifeaste/widgets/base/baseTabPage.dart';
import 'package:lifeaste/widgets/loading.dart';
import 'package:lifeaste/widgets/starCard.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
          return Expanded(child: SmartRefresher(
            controller: state.refreshController,
            onRefresh: logic.headerRefresh,
            child: _mainContent(),
          ));
        },
      ),
    );
  }

  Widget _mainContent() {
    if (state.dataList.isNotEmpty) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (index >= state.dataList.length) return Container();
          UserInfoModel model = state.dataList[index];
          if (index == state.dataList.length - 1) {
            return Column(
              children: [
                StarCard(
                  model,
                  onTap: () {
                    logic.onClickStar(model);
                  },
                  onAsk: () {
                    logic.onAskStar(model);
                  },
                ),
                SizedBox(height: 70,)
              ],
            );
          }
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
      );
    }
    return Center(
      child: LoadingView(),
    );
  }
}
