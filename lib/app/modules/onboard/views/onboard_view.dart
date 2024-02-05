import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:get/get.dart';
import 'package:inventaris/app/modules/login/views/login_view.dart';
import 'package:lottie/lottie.dart';

import '../controllers/onboard_controller.dart';

class OnboardView extends GetView<OnboardController> {
  const OnboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: OnBoarding(),
    );
  }
}

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
        headerBackgroundColor: Colors.transparent,
        finishButtonText: "Let's Start",
        finishButtonStyle: const FinishButtonStyle(
          backgroundColor: Color(0xFF23B0B0),
        ),
        skipTextButton: const Text(
          'Skip',
          style: TextStyle(
            color: Color(0xFF23B0B0),
          ),
        ),
        trailing: GestureDetector(
          onTap: () {
            Get.to(const LoginView());
          },
          child: const Text(
            'Login',
            style: TextStyle(
              color: Color(0xFF23B0B0),
            ),
          ),
        ),
        background: [
          LottieBuilder.asset('animation/welcome.json',
              width: 400, height: 400),
          LottieBuilder.asset('animation/fiture.json', width: 400, height: 400),
          LottieBuilder.asset('animation/start.json', width: 400, height: 400),
        ],
        totalPage: 3,
        speed: 1.8,
        pageBodies: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: const Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text(
                  'Welcome to Ventolaps',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xFF23B0B0),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Smart application to optimize your laptop inventory management with high accuracy.',
                  style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: const Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text(
                  'Superior Features',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xFF23B0B0),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Enjoy the effectiveness of laptop inventory management with simple features.',
                  style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: const Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text(
                  'Start Using the App Now',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xFF23B0B0),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Join and enjoy a new experience of managing your laptop inventory.',
                  style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
        onFinish: () {
          Get.to(const LoginView());
        });
  }
}
