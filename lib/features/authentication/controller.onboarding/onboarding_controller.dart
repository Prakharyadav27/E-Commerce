import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/login/login_Screen.dart';

class OnboardingController extends GetxController {
  // const OnboardingController({super.key});
  static OnboardingController get instance => Get.find();

  // Variables
  // final pageController = PageController();
  // Rx<int> currentPageIndex = 0.obs;
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  // Update curr page idx when scroll
  void updatePageIndicator(index) {
    currentPageIndex.value = index;
  }

  // Jump to specific dot navigated page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  // Update curr idx and jump to nextpage
  void nextPage() {
    if (currentPageIndex.value == 2) {
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // Update curr idx and jump to lastpage
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
