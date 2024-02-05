import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splashscreen_controller.dart';
import 'package:lottie/lottie.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const Text(
            //   'VentoLaps Application', // Ganti dengan nama aplikasi Anda
            //   style: TextStyle(
            //     fontSize: 24,
            //     fontWeight: FontWeight.bold,
            //     color: Color(0xFF23B0B0), // Sesuaikan warna teks dengan tema aplikasi Anda
            //   ),
            // ),
            // const SizedBox(height: 20),
            Lottie.asset('animation/splash.json'),
            const SizedBox(height: 100),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF23B0B0)), // Sesuaikan warna loading indicator
            ),
          ],
        ),
      ),
    );
  }
}
