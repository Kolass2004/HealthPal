import 'package:flutter/material.dart';
import 'package:health_pal/utils/app_colors.dart';
import 'package:health_pal/utils/app_styles.dart';

class OrLineWidget extends StatelessWidget {
  const OrLineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Row(
        children: [
          const Expanded(
            flex: 5,
            child: Divider(
              height: 0,
              color: AppColors.grey200,
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Text(
            "or",
            style: Appstyles.styleMedium16.copyWith(
              color: AppColors.grey500,
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          const Expanded(
            flex: 5,
            child: Divider(
              height: 0,
              color: AppColors.grey200,
            ),
          ),
         
        ],
      ),
    );
  }
}
