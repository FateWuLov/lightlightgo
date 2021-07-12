import 'package:flutter/material.dart';
import 'package:lifeaste/common/common.dart';

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
      //backgroundColor: Styles.mainBg,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: Styles.mainGradientT2B(),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                _navBar(),
                child ?? Container(),
              ],
            ),
          ),
        ],
      )
    );
  }

  Widget _navBar() {
    return Container(
      height: 70,
      padding: EdgeInsets.only(top: 30, left: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            title,
            style: Styles.titleTextStyle(26),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
