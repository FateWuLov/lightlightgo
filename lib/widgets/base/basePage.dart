import 'package:flutter/material.dart';
import 'package:lifeaste/common/styles.dart';
import 'package:lifeaste/widgets/base/baseNavBar.dart';

class BasePage extends StatelessWidget {
  final Color? bgColor;
  final Widget? child;
  final BaseNavBar? navBar;

  const BasePage({this.bgColor, this.navBar, this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Positioned.fill(
          child: bgColor == null
              ? Container(
                  decoration: BoxDecoration(
                      gradient: GlobalColors.gradientTop2Bottom(
                          GlobalColors.gradientStart,
                          GlobalColors.gradientEnd)),
                )
              : Container(color: bgColor),
        ),
        Positioned(
          child: child ?? Container(),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: _nav(),
        ),
      ],
    );
  }

  Widget _nav() {
    if (navBar != null) {
      return SafeArea(
        child: Container(
          height: 44,
          decoration: BoxDecoration(
              color: navBar?.decoration?.color ?? GlobalColors.navBg),
          child: navBar,
        ),
      );
    }
    return Container();
  }
}
