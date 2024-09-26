import 'package:flutter/material.dart';
import 'package:health_pal/models/on_boarding_model.dart';
import 'package:health_pal/utils/app_colors.dart';
import 'package:health_pal/utils/app_styles.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({super.key, required this.onBoardingModel});

  final OnBoardingModel onBoardingModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Image.asset(
            onBoardingModel.img,
            width: width,
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            color: AppColors.secondaryColor,
            child: Column(
              children: [
                const SizedBox(
                  height: 28,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.5),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      onBoardingModel.title,
                      style: Appstyles.styleBold18.copyWith(
                        color: AppColors.primaryColor2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 39.5),
                  child: Text(
                    onBoardingModel.subTitle,
                    style: Appstyles.styleRegular14.copyWith(
                      color: const Color(0xff6B7280),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
