import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifeaste_lt/pages/advisor_list/logic.dart';
import 'package:lifeaste_lt/pages/advisor_list/state.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common/strings.dart';
import '../../models/advisormodel.dart';
import '../../widgets/AdvisorCard.dart';
import '../../widgets/loading.dart';

class AdvisorListPage extends StatelessWidget {
  final AdvisorListLogic logic = Get.put(AdvisorListLogic());
  final AdvisorListState state = Get.find<AdvisorListLogic>().state;

  AdvisorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<AdvisorListLogic>(
      id: state.advisorListGID,
      builder: (logic) {
        return Expanded(
          child: SmartRefresher(
            controller: state.refreshController,
            onRefresh: logic.headerRefresh,
            child: _mainContent(),
          ),
        );
      },
    );
  }

  Widget _mainContent() {
    if (state.advisorList.isNotEmpty) {
      return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: topBar(),
          body: _buildList(),
        ),
      );
    }
    return const Center(
      child: LoadingView(),
    );
  }

  AppBar topBar() {
    return AppBar(
      title: const Text(
        Strings.advisors,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: false,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.telegram)),
        IconButton(onPressed: () {}, icon: Icon(Icons.extension_outlined)),
      ],
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: state.advisorList.length ~/ 2 + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return SizedBox(
              width: double.maxFinite,
              height: 50,
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 13),
                    child: Image(
                      image: AssetImage("assets/2.0x/smallSquare.png"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      "Trending",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ));
        }

        else {
          int index1 = ((index - 1) * 2) % 10;
          int index2 = ((index - 1) * 2 + 1) % 10;
          Advisor advisor1 = state.advisorList[index1];
          Advisor advisor2 = state.advisorList[index2];
          return SizedBox(
              height: 300,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      flex: 100,
                      child: AdvisorCard(
                        advisor: advisor1
                      ),
                    ),
                    Expanded(flex: 4, child: Container()),
                    Expanded(
                      flex: 100,
                      child: AdvisorCard(
                        advisor: advisor2
                      ),
                    )
                  ],
                ),
              )
          );
        }
      },
    );
  }
}
