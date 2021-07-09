import 'package:flutter/material.dart';
import 'package:lifeaste/common/styles.dart';
import 'package:lifeaste/common/tools.dart';

class BaseTabPage extends StatelessWidget {
  final String title;
  final Widget? child;

  BaseTabPage({
    this.title = '',
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.mainBg,
      body: SafeArea(
        child: Column(
          children: [
            _navBar(),
            child ?? Container(),
          ],
        ),
      ),
    );
  }

  Widget _navBar() {
    return Container(
      height: 70,
      padding: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            title,
            style: textStyleTitle(26),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
