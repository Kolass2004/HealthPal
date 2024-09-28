import 'package:flutter/material.dart';
import 'package:health_pal/utils/app_colors.dart';
import 'package:health_pal/utils/app_styles.dart';
import 'package:toastification/toastification.dart';

void showToast(
  BuildContext context,
  String title,
  subtitle,
) {
  toastification.show(
    context: context, // optional if you use ToastificationWrapper
    title: Text(
      title,
      style: Appstyles.styleMedium14.copyWith(
        color: AppColors.primaryColor,
      ),
    ),
    type: ToastificationType.success,
    description: Text(
      subtitle,
      style: Appstyles.styleRegular12.copyWith(
        color: AppColors.grey500,
      ),
    ),
    autoCloseDuration: const Duration(seconds: 5),
  );
}
