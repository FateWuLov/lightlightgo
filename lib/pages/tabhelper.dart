import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/home.dart';
import 'package:myapp/pages/orders.dart';
import 'package:myapp/pages/user.dart';

class TabHelper extends StatefulWidget {
  const TabHelper({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TabHelperState();
  }
}

class _TabHelperState extends State<TabHelper> {
  int selectedPage = 0;
  final _pageList = [FMHomeVC(), FMOrderVC(), FMUserVC()];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _pageList[selectedPage],
      bottomNavigationBar: ConvexAppBar(
        color: Colors.white,
        activeColor: Colors.grey,
        backgroundColor: Colors.white,
        items: const [
          TabItem(icon: Icon(Icons.stars_outlined), title: 'Advisors'),
          TabItem(icon: Icon(Icons.message_outlined), title: 'Orders'),
          TabItem(icon: Icon(Icons.person_outline_rounded), title: 'Mine'),
        ],
        initialActiveIndex: selectedPage,
        onTap: (int index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),
    );
  }
}