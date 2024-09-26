import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:health_pal/utils/app_router.dart';
import 'package:health_pal/utils/assets.dart';
import 'package:health_pal/widgets/logo_text.dart';
import 'dart:async'; // For the Timer

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  _SplashViewBodyState createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();

    // Trigger fade-in animation
    Timer(const Duration(milliseconds: 800), () {
      setState(() {
        _isVisible = true;
      });
    });

    // Delay of 3 seconds before navigating to the next page
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).go(AppRouter.onBoardingView);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.assetsSplash),
          fit: BoxFit.fill,
        ),
      ),
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0.0, // Fade in when _isVisible is true
        duration: const Duration(milliseconds: 1500), // Animation duration
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(
              Assets.assetsLogoWhite,
            ),
            const SizedBox(
              height: 16,
            ),
            const LogoText(),
          ],
        ),
      ),
    );
  }
}
