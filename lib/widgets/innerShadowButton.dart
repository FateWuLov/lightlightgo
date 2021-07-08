import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifeaste/common/colors.dart';
import 'package:lifeaste/common/tools.dart';

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
          color: GlobalColors.buttonBg,
          borderRadius: new BorderRadius.all(Radius.circular(4)),
        ),
        child: child ?? Center(
          child: AutoSizeText(
            title,
            style: opacityTextStyleNormal(textSize),
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
          border: Border.all(color: GlobalColors.themeText, width: 1)
      ),
      alignment: Alignment.center,
      child: AutoSizeText(
        title,
        style: themeTextStyleNormal(textSize),
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

class InnerShadowButton extends StatelessWidget {
  final ButtonType buttonType;
  final String? title;
  final double? width;
  final double? height;
  final TextStyle? style;
  final double? textSize;
  final double? blur;
  final GestureTapCallback? onTap;
  final Widget? child;
  final bool enable;
  final double borderRadius;
  final Color color;
  final Color? borderColor;
  final Color? shadowColor;

  InnerShadowButton({
    this.buttonType = ButtonType.innerShadow,
    this.title,
    this.width,
    this.height = 34,
    this.style,
    this.textSize,
    this.blur,
    this.onTap,
    this.child,
    this.enable = true,
    this.borderRadius = 2,
    this.color = GlobalColors.buttonBg,
    this.borderColor,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    Color _borderColor = borderColor ??
        (this.enable ? GlobalColors.buttonBorder : GlobalColors.grey166
            .withOpacity(0.5));
    if (buttonType == ButtonType.solid) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
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
                    style: textStyleMedium(this.textSize ?? 12).copyWith(
                        color: GlobalColors.lightTheme)
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
          color: GlobalColors.buttonBg,
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
                    ? textStyleMedium(this.textSize ?? 16)
                    .copyWith(color: GlobalColors.grey166)
                    : this.style ??
                    textStyleMedium(this.textSize ?? 16),
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
        style: this.style != null ? this.style : textStyleNormal(textSize),
        overflow: this.overflow,
        textAlign: textAlign,
      );
    }
    return AutoSizeText(
      title,
      style: this.style != null ? this.style : textStyleNormal(textSize),
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
      style: textStyleTitleBold(textSize ?? 16).copyWith(
          color: GlobalColors.mainTheme),
      textAlign: textAlign,
      maxLines: maxLines ?? 1,
      minFontSize: 6,
    );
  }
}