import 'package:flutter/material.dart';
import 'package:health_pal/utils/app_colors.dart';
import 'package:health_pal/utils/app_styles.dart';
import 'package:toastification/toastification.dart';

void showToast(
  String title,
  String subtitle,
  ToastificationType type,
  BuildContext context,
) {
  toastification.show(
    context: context,
    title: Text(
      title,
      style: Appstyles.styleMedium14.copyWith(
        color: AppColors.primaryColor,
      ),
    ),
    style: ToastificationStyle.minimal,
    type: type,
    description: Text(
      subtitle,
      style: Appstyles.styleRegular12.copyWith(
        color: AppColors.grey500,
      ),
    ),
    autoCloseDuration: const Duration(seconds: 5),
  );
}
