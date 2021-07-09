import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lifeaste/common/common.dart';
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
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Styles.invert,
          boxShadow: [
            BoxShadow(color: Styles.shadowColor, blurRadius: 18, offset: Offset(0, 8), spreadRadius: 0)
          ]
      ),
      child: GestureContainer(
        onTap: onTap,
        child: Column(
          children: [
            SizedBox(height: 5,),
            Row(
              children: [
                SizedBox(width: 12,),
                AvatarView(60, star.avatar, shape: AvatarViewShape.square,),
                SizedBox(width: 8,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(star.name, style: Styles.textStyleBold(16),),
                    SizedBox(height: 3,),
                    Container(
                      width: 245,
                      child: AutoSizeText(
                        star.bio,
                        style: Styles.textStyle(12),
                        minFontSize: 6,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 17,),
            CustomButton(
              onTap: onAsk,
              height: 41,
              width: 311,
              title: Strings.askNow,
            ),
            SizedBox(height: 17,),
          ],
        ),
      ),
    );
  }
}
