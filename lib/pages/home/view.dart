import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/size_config.dart';
import '../../common/styles.dart';
import '../advisor_list/view.dart';

import '../order_list/view.dart';
import '../user/view.dart';
import 'logic.dart';
import 'state.dart';

class HomePage extends StatelessWidget {
  final HomeLogic logic = Get.put(HomeLogic());
  final HomeState state = Get.find<HomeLogic>().state;

  final List<Widget> pages = [
    AdvisorListPage(),
    OrderListPage(),
    UserPage(),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    logic.setPageCount(pages.length);
    return WillPopScope(
      onWillPop: () async {
        return Future.value(false);
      },
      child: Scaffold(
        body: Obx(
          () => Stack(
            children: [
              IndexedStack(
                sizing: StackFit.expand,
                index: state.index.value,
                key: key,
                children: pages,
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: bottomNavigationBar(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomNavigationBar() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(24),
        topLeft: Radius.circular(24),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Styles.mainBg,
        items: _tabItems(),
        onTap: (int index) {
          logic.changeIndex(index);
        },
        currentIndex: state.index.value,
      ),
    );
  }

  List<BottomNavigationBarItem> _tabItems() {
    List<BottomNavigationBarItem> list = [
      const BottomNavigationBarItem(
        label: "home",
        //icon: starListIcon(false),
        //activeIcon: starListIcon(true)),
        icon: Icon(Icons.home),
      ),
      const BottomNavigationBarItem(
          label: " order ",
          //icon: orderIcon(false),
          //activeIcon: orderIcon(true),
          icon: Icon(Icons.money)),
      const BottomNavigationBarItem(
          label: " me ",
          //icon: mineIcon(false), activeIcon: mineIcon(true)
          icon: Icon(Icons.people)),
    ];
    return list;
  }
}
