import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class MyDecoration {
  /// 主页 -- 名片 -- 圆角 & 边框 & 背景色
  static BoxDecoration decoration1 = BoxDecoration(
    color: Colors.blueGrey,
    border: Border.all(
      color: Colors.orange,
      width: 2,
    ),
    borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.zero,
        bottomLeft: Radius.zero,
        bottomRight: Radius.circular(15)),
  );

  static BoxDecoration decoration2 = const BoxDecoration(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.zero,
        bottomLeft: Radius.zero,
        bottomRight: Radius.circular(15)),
  );

  /// 圆角 20
  static BorderRadius borderRadius = const BorderRadius.all(Radius.circular(20));

  /// 按钮 & 字体 -- 渐变效果 -- 橙红
  static Gradient gradient1 = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Colors.orange.shade200,
        Colors.orange.shade500,
        Colors.orange.shade800
      ]
  );

  /// Util -- 细线边框
  Border border = Border.all(
    color: Colors.orange,
    width: 2,
  );

  /// 按钮 & 字体 -- 渐变效果 -- 紫
  static Gradient gradient2 = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Colors.purple.shade300,
        Colors.purple.shade500,
        Colors.purple.shade700
      ]
  );
}
