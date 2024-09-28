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
    var height = MediaQuery.sizeOf(context).height;
    return Column(
      children: [
        Image.asset(
          onBoardingModel.img,
          width: width,
          height: height * .60,
          fit: BoxFit.fill,
        ),
        Container(
          color: AppColors.secondaryColor,
          height: height * 0.20,
          child: Column(
            children: [
              const Expanded(
                flex: 1,
                child: SizedBox(),
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
                padding: EdgeInsets.symmetric(horizontal: width * 0.025),
                child: Text(
                  onBoardingModel.subTitle,
                  style: Appstyles.styleRegular14.copyWith(
                    color: const Color(0xff6B7280),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
