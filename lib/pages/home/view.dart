import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifeaste/common/styles.dart';
import 'package:lifeaste/common/images.dart';
import 'package:lifeaste/common/size_config.dart';
import 'package:lifeaste/common/strings.dart';
import 'package:lifeaste/common/tools.dart';
import 'package:lifeaste/pages/me/view.dart';
import 'package:lifeaste/pages/order_list/view.dart';
import 'package:lifeaste/pages/star_list/view.dart';

import 'logic.dart';
import 'state.dart';

class HomePage extends StatelessWidget {
  final HomeLogic logic = Get.put(HomeLogic());
  final HomeState state = Get.find<HomeLogic>().state;

  final List<Widget> pages = [
    StarListPage(),
    OrderListPage(),
    MePage(),
  ];

  @override
  Widget build(BuildContext context) {
    logic.setPageCount(pages.length);
    return WillPopScope(
      onWillPop: () async {
        return Future.value(false);
      },
      child: Scaffold(
        body: Obx(
            () => IndexedStack(
              index: state.index.value,
              children: pages,
              key: key,
            ),
        ),
        bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: GlobalColors.tabBg,
              items: _tabItems(),
              onTap: (int index) {
                logic.changeIndex(index);
              },
              currentIndex: state.index.value,
            )
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _tabItems() {
    List<BottomNavigationBarItem> list = [
      BottomNavigationBarItem(
          title: SizedBox(),
          icon: starListIcon(false),
          activeIcon: starListIcon(true)),
      BottomNavigationBarItem(
        title: SizedBox(),
        icon: orderIcon(false),
        activeIcon: orderIcon(true),
      ),
      BottomNavigationBarItem(
          title: SizedBox(),
          icon: mineIcon(false),
          activeIcon: mineIcon(true))
    ];
    return list;
  }

  Widget orderIcon(bool active) {
    if (state.unread.value) {
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
                        color: GlobalColors.unread,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              Strings.order,
              style: textStyleMedium(12)
                  .copyWith(color: active ? GlobalColors.tabSelect : GlobalColors.tabDeselect,),
            ),
          ],
        ),
      );
    } else {
      return _itemBase(
        child: Column(
          children: [
            Expanded(
                child: Image.asset(ImageNames.orders, color: active ? GlobalColors.tabSelect : GlobalColors.tabDeselect,)),
            Container(
              padding: EdgeInsets.only(left: 2),
              child: Text(
                Strings.order,
                style: textStyleMedium(12)
                    .copyWith(color: active ? GlobalColors.tabSelect : GlobalColors.tabDeselect,),
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget starListIcon(bool active) {
    return _itemBase(
      child: Column(
        children: [
          Expanded(
            child: Image.asset(active ? ImageNames.advisors : ImageNames.advisors2),),
          Text(
            Strings.advisor,
            style: textStyleMedium(12)
                .copyWith(color: active ? GlobalColors.tabSelect : GlobalColors.tabDeselect,),
          ),
        ],
      ),
    );
  }

  Widget mineIcon(bool active) {
    return _itemBase(
      child: Column(
        children: [
          Expanded(
            child: Image.asset(active ? ImageNames.mine : ImageNames.mine2),),
          Container(
            padding: EdgeInsets.only(left: 2),
            child: Text(
              Strings.mine,
              style: textStyleNormal(12)
                  .copyWith(color: active ? GlobalColors.tabSelect : GlobalColors.tabDeselect,),
            ),
          ),
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
  }
}
