import 'package:flutter/material.dart';

class GestureContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxDecoration? decoration;
  final Color? color;
  final EdgeInsets? padding;
  final Widget? child;
  final GestureTapCallback? onTap;

  GestureContainer({
    this.width,
    this.height,
    this.color,
    this.decoration,
    this.padding,
    this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: decoration ?? BoxDecoration(
          color: color
        ),
        padding: padding,
        child: child,
      ),
    );
  }
}
