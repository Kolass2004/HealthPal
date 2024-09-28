import 'package:flutter/material.dart';
import 'package:health_pal/utils/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: null,
      style: TextButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(63),
        ),
      ),
      child: LoadingAnimationWidget.threeArchedCircle(
        color: AppColors.secondaryColor,
        size: 28,
      ),
    );
  }
}
