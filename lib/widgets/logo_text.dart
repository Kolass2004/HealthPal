import 'package:flutter/material.dart';
import 'package:health_pal/utils/app_colors.dart';
import 'package:health_pal/utils/app_styles.dart';

class LogoText extends StatelessWidget {
  const LogoText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "Health",
            style: Appstyles.styleRegular20.copyWith(
              color: AppColors.logoTextColor,
            ),
          ),
          TextSpan(
            text: "Pal",
            style: Appstyles.styleRegular20.copyWith(
              color: AppColors.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
