import 'package:flutter/material.dart';
import 'package:health_pal/utils/app_colors.dart';
import 'package:health_pal/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.title,
    this.isReversed,
  });

  final void Function()? onPressed;
  final String title;
  final bool? isReversed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor:
            isReversed == null ? AppColors.primaryColor : AppColors.grey200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(63),
        ),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          title,
          style: Appstyles.styleMedium16.copyWith(
            color: isReversed == null
                ? AppColors.secondaryColor
                : AppColors.primaryColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
