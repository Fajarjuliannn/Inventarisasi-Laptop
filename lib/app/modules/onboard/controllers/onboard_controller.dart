import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardController extends GetxController {
  final RxInt currentPageIndex = 0.obs;
  final PageController pageController = PageController();

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
