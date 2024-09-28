import 'package:flutter/material.dart';
import 'package:health_pal/utils/app_colors.dart';
import 'package:health_pal/utils/app_styles.dart';
import 'package:health_pal/utils/constants.dart';

class LogoText extends StatelessWidget {
  const LogoText({super.key, this.color1, this.color2});

  final Color? color1, color2;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "Health",
            style: Appstyles.styleRegular20.copyWith(
              color: color1 ?? AppColors.logoTextColor,
              fontFamily: logoFontFamily,
            ),
          ),
          TextSpan(
            text: "Pal",
            style: Appstyles.styleRegular20.copyWith(
              color: color2 ?? AppColors.secondaryColor,
              fontFamily: logoFontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
