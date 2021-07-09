import 'package:flutter/material.dart';
import 'package:lifeaste/common/styles.dart';
import 'package:lifeaste/common/strings.dart';
import 'package:lifeaste/common/tools.dart';
import 'package:lifeaste/logic/global.dart';
import 'package:lifeaste/models/userModel.dart';
import 'package:lifeaste/widgets/gestureContainer.dart';
import 'package:lifeaste/widgets/innerShadowButton.dart';
import 'package:lifeaste/widgets/roundAvatar.dart';

class StarCard extends StatelessWidget {
  final UserInfoModel star;
  final VoidCallback? onTap;
  final VoidCallback? onAsk;

  StarCard(this.star, {this.onTap, this.onAsk});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 228,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: GlobalColors.lightTheme, blurRadius: 18, offset: Offset(0, 8))
        ]
      ),
      child: GestureContainer(
        onTap: onTap,
        child: Column(
          children: [
            Row(
              children: [
                RoundAvatar(74, star.avatar),
                Text(star.name, style: textStyleBold(16),),
              ],
            ),
            Text(star.bio, style: textStyleBold(16),),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InnerShadowButton(
                title: Strings.askNow,
                height: 42,
                onTap: onAsk,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
