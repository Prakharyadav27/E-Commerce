import 'package:ecommerce/features/authentication/controller.onboarding/onboarding_controller.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:ecommerce/utils/device/device_utility.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import './widgets/onboarding_page.dart';
import 'package:iconsax/iconsax.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(
    //     OnboardingController()); //We are creating an instance of OnBoardingController which we ussualy create by new keyword

    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          // Horizontal scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnboardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubTitle1,
              ),
              OnboardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubTitle2,
              ),
              OnboardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          // Skip button
          OnBoardingSkip(),

          // Dot Navigation Page Indicator
          OnboardingNavigation(),

          // Circular Button
          OnboardingCircularButton()
        ],
      ),
    );
  }
}

class OnboardingCircularButton extends StatelessWidget {
  const OnboardingCircularButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      right: TSizes.defaultSpace,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              backgroundColor: dark ? TColors.buttonPrimary : TColors.black),
          onPressed: () {
            OnboardingController.instance.nextPage();
          },
          child: const Icon(
            Iconsax.arrow_right_3,
          )),
    );
  }
}
