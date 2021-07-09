import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lifeaste/common/images.dart';
import 'package:lifeaste/common/styles.dart';
import 'package:lifeaste/common/tools.dart';
import 'package:lifeaste/widgets/gestureContainer.dart';

class BaseNavBar extends StatelessWidget {
  final BoxDecoration? decoration;
  final String title;
  final TextStyle? titleStyle;
  final Widget? titleLeft; //标题左边的附件
  final Widget? centerItem;
  final Widget? rightItem;
  final VoidCallback? leftAction;
  final bool showBackBtn; //是否显示返回按钮,

  BaseNavBar({
    this.decoration,
    this.title = '',
    this.titleStyle,
    this.titleLeft,
    this.rightItem,
    this.centerItem,
    this.leftAction,
    this.showBackBtn = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Visibility(
            visible: showBackBtn,
            child: GestureContainer(
              onTap: () {
                leftAction?.call();
              },
              width: 44,
              height: 44,
              padding: EdgeInsets.all(10),
              child: Image.asset(ImageNames.back),
            ),
          ),
          Expanded(
            child: _centerContent(),
          ),
          rightItem ?? Container()
        ],
      ),
    );
  }
  
  Widget _centerContent() {
    if (centerItem != null) {
      return centerItem!;
    }
    return Container(
      margin: EdgeInsets.only(right: showBackBtn  ? 44 : 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          titleLeft ?? Container(),
          Text(
            title,
            style: titleStyle ?? textStyleBold(18),
          ),
        ],
      ),
    );
  }
}
