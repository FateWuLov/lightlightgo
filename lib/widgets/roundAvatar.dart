import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lifeaste/common/images.dart';
import 'package:lifeaste/common/styles.dart';

enum AvatarViewShape {
  round,
  square
}

class AvatarView extends StatelessWidget {
  final double height;
  final String? url;
  final AvatarViewShape shape;
  final bool hasShadow;
  final double borderRadius;
  AvatarView(this.height, this.url ,{
    this.shape = AvatarViewShape.round,
    this.hasShadow = true,
    this.borderRadius = 10
  });

  @override
  Widget build(BuildContext context) {
    if (shape == AvatarViewShape.square) {
      return Container(
          height: height,
          width: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(color: GlobalColors.darkThemeText, width: 2),
              boxShadow: [
                BoxShadow(color: GlobalColors.avatarShadow, blurRadius: 10, offset: Offset(0, 4))
              ]
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: buildContent(),
          )
      );
    }
    else {
      if (hasShadow) {
        return Container(
            height: height,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: GlobalColors.avatarShadow, blurRadius: 10, offset: Offset(0, 4))
                ]
            ),
            child: ClipRRect(
              borderRadius:BorderRadius.circular(height/2.0),
              child: buildContent(),
            )
        );
      }
      return Container(
          height: height,
          child: ClipRRect(
            borderRadius:BorderRadius.circular(height/2.0),
            child: buildContent(),
          )
      );
    }
  }

  Widget buildContent() {
    if (url?.isNotEmpty == true) {
      return CachedNetworkImage(
        imageUrl: url ?? '',
        fit: BoxFit.cover,
        width: height,
        height: height,
        placeholder: (context,url){
          return buildPlaceholder();
        },
      );
    } else {
      return buildPlaceholder();
    }
  }

  Image buildPlaceholder() => Image.asset(ImageNames.defaultAvatar, fit: BoxFit.cover,);
}
