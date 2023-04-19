import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/styles.dart';
import '../advisor_list/view.dart';
import '../me/view.dart';
import '../order_list/view.dart';
import 'logic.dart';
import 'state.dart';

class HomePage extends StatelessWidget {
  final HomeLogic logic = Get.put(HomeLogic());
  final HomeState state = Get.find<HomeLogic>().state;

  final List<Widget> pages = [
    AdvisorListPage(),
    OrderListPage(),
    MePage(),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
      BottomNavigationBarItem(
          label: " ",
          //icon: starListIcon(false),
          //activeIcon: starListIcon(true)),
          icon: Icon(Icons.add),
      ),
      BottomNavigationBarItem(
        label: " ",
        //icon: orderIcon(false),
        //activeIcon: orderIcon(true),
          icon: Icon(Icons.add)
      ),
      BottomNavigationBarItem(
          label: " ",
          //icon: mineIcon(false), activeIcon: mineIcon(true)
          icon: Icon(Icons.add)
      ),
    ];
    return list;
  }

/*  Widget orderIcon(bool active) {
      return _itemBase(
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 10),
                  Image.asset(active ? ImageNames.orders : ImageNames.orders2),
                  SizedBox(width: 2),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Styles.unread,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Text(
            //   Strings.order,
            //   style: Styles.textStyleMedium(12)
            //       .copyWith(color: active ? Styles.tabSelect : Styles.tabDeselect,),
            // ),
          ],
        ),
      );
  }

  Widget starListIcon(bool active) {
    return _itemBase(
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
                active ? ImageNames.advisors : ImageNames.advisors2),
          ),
          // Text(
          //   Strings.advisor,
          //   style: Styles.textStyleMedium(12)
          //       .copyWith(color: active ? Styles.tabSelect : Styles.tabDeselect,),
          // ),
        ],
      ),
    );
  }

  Widget mineIcon(bool active) {
    return _itemBase(
      child: Column(
        children: [
          Expanded(
            child: Image.asset(active ? ImageNames.mine : ImageNames.mine2),
          ),
          // Container(
          //   padding: EdgeInsets.only(left: 2),
          //   child: Text(
          //     Strings.mine,
          //     style: Styles.textStyleMedium(12)
          //         .copyWith(color: active ? Styles.tabSelect : Styles.tabDeselect,),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _itemBase({Widget? child}) {
    return Container(
      height: 52,
      width: SizeConfig.screenWidth / pages.length,
      child: child ?? Container(),
    );
  }*/
}