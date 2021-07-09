import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifeaste/common/common.dart';

class MainButton extends StatelessWidget {
  final String title;
  final double textSize;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final GestureTapCallback? onTap;
  final Widget? child;

  MainButton({
    this.title = '',
    this.textSize = 16,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.onTap,
    this.child
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: Styles.buttonBg,
          borderRadius: new BorderRadius.circular(50),
        ),
        child: child ?? Center(
          child: AutoSizeText(
            title,
            style: Styles.invertTextStyleBold(textSize),
            minFontSize: 6,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}

class SubButton extends StatelessWidget {
  final String title;
  final double textSize;

  SubButton(this.title, this.textSize);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Styles.themeText, width: 1)
      ),
      alignment: Alignment.center,
      child: AutoSizeText(
        title,
        style: Styles.themeTextStyle(textSize),
        minFontSize: 6,
        maxLines: 1,
      ),
    );
  }
}

enum ButtonType {
  ///有内阴影的按钮
  innerShadow,

  ///无内阴影，填充某一个颜色的按钮
  solid
}

class CustomButton extends StatelessWidget {
  final ButtonType buttonType;
  final String? title;
  final double? width;
  final double? height;
  final TextStyle? style;
  final double textSize;
  final double? blur;
  final GestureTapCallback? onTap;
  final Widget? child;
  final bool enable;
  final double borderRadius;
  final Color color;
  final Color? borderColor;
  final Color? shadowColor;

  CustomButton({
    this.buttonType = ButtonType.solid,
    this.title,
    this.width,
    this.height = 34,
    this.style,
    this.textSize = 18,
    this.blur,
    this.onTap,
    this.child,
    this.enable = true,
    this.borderRadius = 24,
    this.color = Styles.buttonBg,
    this.borderColor,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    Color _borderColor = borderColor ??
        (this.enable ? Styles.buttonBorder : Styles.grey166
            .withOpacity(0.5));
    if (buttonType == ButtonType.solid) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: enable ? color : Styles.disableGrey,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: this.child ??
              Container(
                width: width,
                height: height,
                alignment: Alignment.center,
                color: Colors.transparent,
                child: Text(
                    title ?? '',
                    style: Styles.invertTextStyleBold(this.textSize)
                ),
              ),
        ),
      );
    }
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Styles.buttonBg,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: _borderColor)
      ),
      child: GestureDetector(
        onTap: onTap,
        child: this.child ??
            Container(
              width: width,
              height: height,
              alignment: Alignment.center,
              color: Colors.transparent,
              child: Text(
                title ?? '',
                style: !this.enable
                    ? Styles.subTextStyleBold(this.textSize)
                    : this.style ??
                      Styles.invertTextStyleBold(this.textSize),
              ),
            ),
      ),
    );
  }

}

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
    // return ShaderMask(
    //   shaderCallback: (bounds) {
    //     return (this.gradient ?? mainGradientLeft2Right()).createShader(Offset.zero & bounds.size);
    //   },
    //   child:
    // );
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
      style: Styles.themeTextStyleBold(textSize ?? 16),
      textAlign: textAlign,
      maxLines: maxLines ?? 1,
      minFontSize: 6,
    );
  }
}