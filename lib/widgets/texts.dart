import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lifeaste/common/common.dart';

class GradientText extends StatelessWidget {
  final String title;
  final double textSize;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final LinearGradient? gradient;

  GradientText(this.title,
      this.textSize, {
        this.style,
        this.textAlign,
        this.overflow = TextOverflow.ellipsis,
        this.gradient,
      });

  @override
  Widget build(BuildContext context) {
    return _text();
  }

  Widget _text() {
    if (this.overflow != null) {
      return Text(
        title,
        style: this.style != null ? this.style : Styles.textStyle(textSize),
        overflow: this.overflow,
        textAlign: textAlign,
      );
    }
    return AutoSizeText(
      title,
      style: this.style != null ? this.style : Styles.textStyle(textSize),
      textAlign: textAlign,
      maxLines: 1,
      minFontSize: 6,
    );
  }
}

class SpecialText extends StatelessWidget {
  final String? title;
  final double? textSize;
  final TextAlign? textAlign;
  final int? maxLines;

  SpecialText({
    @required this.title,
    @required this.textSize,
    this.textAlign,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      title ?? '',
      style: Styles.mainThemeStyleBold(textSize ?? 16),
      textAlign: textAlign,
      maxLines: maxLines ?? 1,
      minFontSize: 6,
    );
  }
}