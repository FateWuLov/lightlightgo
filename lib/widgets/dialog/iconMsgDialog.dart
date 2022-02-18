import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifeaste/common/common.dart';

import '../buttons.dart';

class IconMsgDialog extends StatefulWidget {
  final String? imageName;
  final double? imageWidth;
  final double? imageHeight;
  final String? message;
  final String? buttonTitle;
  final bool needCloseIcon;
  final VoidCallback? buttonAction;
  final VoidCallback? cancelAction;

  IconMsgDialog(
      {this.imageName,
      this.imageWidth,
      this.imageHeight,
      this.message,
      this.buttonTitle,
      this.buttonAction,
      this.needCloseIcon = true,
      this.cancelAction});

  @override
  _IconMsgDialogState createState() => _IconMsgDialogState();
}

class _IconMsgDialogState extends State<IconMsgDialog> {
  Widget imageWidget() {
    if (widget.imageName == null) {
      return Container();
    }
    if (widget.imageWidth != null && widget.imageHeight != null) {
      return Image.asset(
        widget.imageName ?? '',
        width: widget.imageWidth,
        height: widget.imageHeight,
      );
    } else {
      return Image.asset(widget.imageName ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.transparent,
      children: <Widget>[
        Container(
          width: 320,
          decoration: BoxDecoration(
              color: Styles.mainBg,
              borderRadius: BorderRadius.circular(16)
          ),
          child: Stack(
            children: [
              // Positioned.fill(
              //   child: CustomPaint(
              //     painter: MainBoxPainter(),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Visibility(
                            visible: widget.needCloseIcon,
                            child: GestureDetector(
                              onTap: () {
                                if (widget.needCloseIcon) {
                                  if (widget.cancelAction != null) {
                                    widget.cancelAction?.call();
                                  } else {
                                    Navigator.of(context).pop();
                                  }
                                }
                              },
                              child: Container(
                                color: Colors.transparent,
                                padding: EdgeInsets.fromLTRB(15, 12, 15, 10),
                                child: Image.asset(
                                  ImageNames.shutDown,
                                  width: 13,
                                  height: 13,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      imageWidget(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 30),
                        child: Text(
                          widget.message ?? '',
                          textAlign: TextAlign.center,
                          style: Styles.mainThemeStyle(14),
                        ),
                      ),
                    ],
                  ),
                  widget.buttonTitle != null && widget.buttonTitle?.isNotEmpty == true
                      ? CustomButton(
                    title: widget.buttonTitle,
                    textSize: 18,
                    width: 240,
                    height: 44,
                    blur: 10,
                    onTap: () {
                      Get.back();
                      widget.buttonAction?.call();
                    },
                  )
                      : SizedBox(
                    height: 37,
                  ),
                ]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
