import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_pal/utils/assets.dart';
import 'package:health_pal/widgets/logo_text.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

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
    );
  }
}
