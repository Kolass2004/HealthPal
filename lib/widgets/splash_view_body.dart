import 'package:flutter/material.dart';
import 'package:health_pal/utils/assets.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.assetsSplash),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
