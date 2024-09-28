import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_pal/models/on_boarding_model.dart';
import 'package:health_pal/utils/app_colors.dart';
import 'package:health_pal/utils/app_router.dart';
import 'package:health_pal/utils/app_styles.dart';
import 'package:health_pal/utils/assets.dart';
import 'package:health_pal/widgets/custom_button.dart';
import 'package:health_pal/widgets/on_boarding_widget.dart';
import 'package:health_pal/widgets/tapper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  PageController pageController = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Stack(
      children: [
        PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              onLastPage = index == 2 ? true : false;
            });
          },
          children: const [
            OnBoardingWidget(
              onBoardingModel: OnBoardingModel(
                img: Assets.assetsFirstDoctor,
                title: "Meet Doctors Online",
                subTitle:
                    "Connect with Specialized Doctors Online for Convenient and Comprehensive Medical Consultations.",
              ),
            ),
            OnBoardingWidget(
              onBoardingModel: OnBoardingModel(
                img: Assets.assetsSecoundDoctor,
                title: "Connect with Specialists",
                subTitle:
                    "Connect with Specialized Doctors Online for Convenient and Comprehensive Medical Consultations.",
              ),
            ),
            OnBoardingWidget(
              onBoardingModel: OnBoardingModel(
                img: Assets.assetsThirdDoctor,
                title: "Thousands of Online Specialists",
                subTitle:
                    "Connect with Specialized Doctors Online for Convenient and Comprehensive Medical Consultations.",
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          child: SizedBox(
            height: height * .19,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Expanded(
                  child: SizedBox(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 39.5),
                  child: onLastPage
                      ? CustomButton(
                          title: "Done",
                          onPressed: () {
                            GoRouter.of(context).push(AppRouter.loginView);
                          },
                        )
                      : CustomButton(
                          title: "Next",
                          onPressed: () {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                        ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Center(
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      dotColor: Color(0xff9B9B9B),
                      activeDotColor: Color(0xff26232F),
                      dotHeight: 8,
                      dotWidth: 8,
                      expansionFactor: 4,
                    ),
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Center(
                  child: Tapper(
                    onTap: () {
                      pageController.jumpToPage(2);
                    },
                    borderRadius: BorderRadius.circular(18),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Skip",
                        style: Appstyles.styleRegular14.copyWith(
                          color: AppColors.grey500,
                        ),
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
