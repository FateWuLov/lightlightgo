import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

import '../common/medias.dart';

class LoadingView extends StatelessWidget {
  final double size;
  const LoadingView({super.key, this.size = 100});

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