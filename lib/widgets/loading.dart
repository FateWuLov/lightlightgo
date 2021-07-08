import 'package:flutter/material.dart';
import 'package:lifeaste/common/medias.dart';
import 'package:lottie/lottie.dart';

class LoadingView extends StatelessWidget {
  final double size;
  LoadingView({this.size = 120});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      lottieLoading,
      repeat: true,
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }
}
