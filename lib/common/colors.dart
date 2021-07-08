import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalColors {
  static const Color mainBg = Color.fromRGBO(241, 246, 249, 1);
  static const Color tabBg = Color.fromRGBO(241, 246, 250, 1);
  static const Color navBg = Color.fromRGBO(241, 246, 250, 1);
  static const Color buttonBg = Color.fromRGBO(77, 126, 150, 1);

  static const Color clearSeen = Color.fromRGBO(33, 37, 57, 1);
  static const Color separator = Color.fromRGBO(29, 31, 33, 1);

  static const Color mainTheme = Color.fromRGBO(77, 126, 150, 1);
  static const Color subTheme = Color.fromRGBO(202, 223, 235, 1);
  static const Color lightTheme = Color.fromRGBO(221, 232, 239, 1);
  static const Color themeText = Color.fromRGBO(224, 185, 133, 1);
  static const Color darkThemeText = Colors.white;
  static const Color receiveBubble = Color.fromRGBO(114, 95, 84, 1);
  static const Color senderBubble = Color.fromRGBO(176, 154, 141, 1);
  static const Color inviteCodeText = Color.fromRGBO(220, 157, 75, 1);

  static const Color themeLine = Color.fromRGBO(90, 71, 57, 1);
  static const Color tabSelect = Color.fromRGBO(251, 139, 111, 1);
  static const Color tabDeselect = Color.fromRGBO(178, 200, 211, 1);
  static const Color unread = Color.fromRGBO(186, 91, 91, 1);

  static const Color gradientStart = Color.fromRGBO(228, 167, 123, 1);
  static const Color gradientEnd = Color.fromRGBO(228, 167, 123, 1);

  static const Color discountGradientStart = Color.fromRGBO(255, 222, 178, 1);
  static const Color discountGradientEnd = Color.fromRGBO(224, 185, 133, 1);

  static const Color darkGoldGradientStart = Color.fromRGBO(216, 164, 134, 1);
  static const Color darkGoldGradientEnd = Color.fromRGBO(186, 126, 91, 1);

  static const Color callingBg = Color.fromRGBO(36, 24, 17, 0.8);

  static const Color mainText = Color.fromRGBO(33, 37, 57, 1);
  static const Color subText = Color.fromRGBO(133, 137, 161, 1);
  static const Color hintText = Color.fromRGBO(133, 137, 161, 1);
  static const Color goldText = Color.fromRGBO(255, 163, 0, 1);
  static const Color redText = Color.fromRGBO(255, 0, 20, 1);
  static const Color saleText = Color.fromRGBO(181, 29, 138, 1);
  static const Color orangeText = Color.fromRGBO(255, 172, 39, 1);
  static const Color brownText = Color.fromRGBO(108, 78, 61, 1);

  static const Color disableGrey = Color.fromRGBO(112, 112, 112, 1);
  static const Color greyLine = Color.fromRGBO(14, 15, 16, 1);
  static const Color greyText = Color.fromRGBO(177, 177, 177, 1);
  static const Color grey102 = Color.fromRGBO(102, 102, 102, 1);
  static const Color grey243 = Color.fromRGBO(243, 243, 243, 1);
  static const Color grey216 = Color.fromRGBO(216, 216, 216, 1);
  static const Color grey166 = Color.fromRGBO(166, 166, 166, 1);
  static const Color r151g140b167 = Color.fromRGBO(151, 140, 167, 1);
  static const Color greyWhiteBg = Color.fromRGBO(244, 243, 247, 1);

  static const Color placeholderColor = Colors.black;
  static const Color placeholderColor2 = Colors.black;

  static const Color online = Color.fromARGB(255, 126, 211, 33);
  static const Color busy = Color.fromARGB(255, 238, 21, 46);

  static const Color tarotBg = Colors.black;
  static const Color tarotSection = Colors.black;
  static const Color tarotBorder = Color.fromRGBO(186, 126, 91, 1);

  static const Color orderPending = Color.fromRGBO(202, 115, 86, 1);
  static const Color orderExpired = Color.fromRGBO(64, 98, 154, 1);
  static const Color orderCanceled = Color.fromRGBO(103, 106, 152, 1);
  static const Color orderAwaitingReceipt = Color.fromRGBO(59, 127, 137, 1);
  static const Color orderCompleted = Color.fromRGBO(93, 141, 90, 1);
  static const Color orderDecline = Color.fromRGBO(182, 73, 73, 1);
  static const Color orderDraft = Color.fromRGBO(59, 127, 137, 1);

  static const Color coinsAvailable = Color.fromRGBO(251, 170, 123, 1);
  static const Color rateStarUnselected = Color.fromRGBO(87, 67, 48, 1);
  static const Color buttonBorder = Color.fromRGBO(186, 126, 91, 1);
  static const Color filterServiceCardBorder = Color.fromRGBO(153, 115, 83, 1);
  static const Color switchTrackColor = Color.fromRGBO(84, 84, 84, 1);

  static const Color notificationTipTheme = Color.fromRGBO(255, 182, 129, 1);

  static const Color notifyApplyBackground = Color.fromRGBO(151, 104, 76, 0.9);


  static LinearGradient gradientTop2Bottom(Color start, Color end) {
    return LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [start, end]);
  }

  static LinearGradient gradientLeft2Right(Color start, Color end) {
    return LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [start, end]);
  }
}
