import 'package:flutter/material.dart';
import 'package:health_pal/utils/app_colors.dart';
import 'package:health_pal/utils/app_styles.dart';

class SwitchBetweenSignInUpText extends StatelessWidget {
  const SwitchBetweenSignInUpText({
    super.key,
    required this.text,
    required this.page,
    required this.onPressed,
  });

  final String text, page;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$text ",
              style: Appstyles.styleRegular14.copyWith(
                color: AppColors.grey500,
              ),
            ),
            InkWell(
              onTap: onPressed,
              child: Text(
                page,
                style: Appstyles.styleRegular14.copyWith(
                  color: const Color(0xff1C64F2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
