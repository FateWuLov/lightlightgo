import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:lifeaste/common/colors.dart';
import 'package:lifeaste/common/images.dart';
import 'package:lifeaste/common/size_config.dart';
import 'package:lifeaste/common/strings.dart';
import 'package:lifeaste/common/tools.dart';

import '../innerShadowButton.dart';


class NormalDialog extends StatefulWidget {
  final String? title;
  final Color? titleColor;
  final String? content;
  final VoidCallback? subAction;
  final VoidCallback? mainAction;
  final String? subTitle;
  final String? mainTitle;
  final bool rightPrefer;
  final bool needCloseBtn;
  final VoidCallback? closeAction;

  NormalDialog({
    this.title,
    this.titleColor,
    this.content,
    this.subAction,
    this.mainAction,
    this.subTitle,
    this.mainTitle,
    this.rightPrefer = false,
    this.needCloseBtn = false,
    this.closeAction
  });

  @override
  _NormalDialogState createState() => _NormalDialogState();
}

class _NormalDialogState extends State<NormalDialog>{

  _onTapSubAction(){
    Get.back();
    if(widget.subAction == null){
      cleanAllToast();
    } else{
      widget.subAction?.call();
    }
  }

  _onTapMainAction(){
    Get.back();
    if(widget.mainAction == null){
      cleanAllToast();
    }
    else{
      widget.mainAction?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        color: Colors.black.withOpacity(0.5),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 320,
                child: Stack(
                  children: [
                    // Positioned(
                    //   top: 0,
                    //   bottom: 0,
                    //   left: 0,
                    //   right: 0,
                    //   child: CustomPaint(
                    //     painter: MainBoxPainter(),
                    //   ),
                    // ),
                    Column(
                      children: <Widget>[
                        (widget.title == null)
                            ? SizedBox(height: 20)
                            : Container(
                          padding:
                          const EdgeInsets.fromLTRB(30, 30, 30, 0),
                          child: Text(
                            widget.title ?? '',
                            textAlign: TextAlign.center,
                            style: textStyleNormal(18).copyWith(
                              color: widget.titleColor ??
                                  GlobalColors.mainText,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        (widget.content == null)
                            ? Container()
                            : Container(
                          padding:
                          const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: Text(
                            widget.content ?? '',
                            // textAlign: TextAlign.center,
                            style: subTextStyleNormal(14),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        widget.rightPrefer
                            ? Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            InnerShadowButton(
                              blur: 5,
                              width: 120,
                              height: 45,
                              onTap: _onTapSubAction,
                              title: widget.subTitle ?? Strings.cancel,
                            ),
                            MainButton(
                              title: widget.mainTitle ?? Strings.confirm,
                              textSize: 16,
                              width: 120,
                              height: 45,
                              onTap: _onTapMainAction,
                            ),
                          ],
                        )
                            : Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            MainButton(
                              title: widget.mainTitle ?? Strings.confirm,
                              textSize: 16,
                              width: 120,
                              height: 45,
                              onTap: _onTapMainAction,
                            ),
                            InnerShadowButton(
                              blur: 5,
                              width: 120,
                              height: 45,
                              onTap: _onTapSubAction,
                              title: widget.subTitle ?? Strings.cancel,
                            ),
                          ],
                        ),
                        SizedBox(height: 26),
                      ],
                    ),
                  ],
                )
            ),
            Visibility(
              visible: widget.needCloseBtn,
              child: Column(
                children: [
                  SizedBox(height: 30),
                  IconButton(
                    onPressed: () {
                      Get.back();
                      widget.closeAction?.call();
                    },
                    icon: Image.asset(
                      ImageNames.shutDown,
                      width: getProportionateScreenWidth(36),
                      height: getProportionateScreenWidth(36),
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}

