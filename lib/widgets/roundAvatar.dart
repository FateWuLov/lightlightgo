import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lifeaste/common/images.dart';
import 'package:lifeaste/common/styles.dart';

class RoundAvatar extends StatelessWidget {
  final double height;
  final String? url;
  RoundAvatar(this.height, this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        child: ClipRRect(
          borderRadius:BorderRadius.circular(height/2.0),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: GlobalColors.shadowColor, blurRadius: 18, offset: Offset(0, 8), spreadRadius: 0)
              ]
            ),
            child: buildContent(),
          ),
        )
    );
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
