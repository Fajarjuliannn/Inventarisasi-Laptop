import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:inventaris/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // background
            SizedBox(
              width: Get.width,
              child:
                  Image.asset("assets/images/bg_login.png", fit: BoxFit.cover),
            ),
            // layer body
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 135),
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset(
                      "assets/images/pic1_login.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Welcome to ",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  const Text(
                    "VentoLaps",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(
                    width: 300,
                    child: Text(
                      "Best application for viewing information regarding laptop inventory from DISKOMINFO Payakumbuh",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          //zGet.offAllNamed(Routes.DASHBOARD);
                          Fluttertoast.showToast(msg: "feature not available");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFEEF7FE),
                          fixedSize: const Size(150, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/icons/finger.png"),
                            const SizedBox(width: 10),
                            const Text(
                              "Smart Id",
                              style: TextStyle(
                                color: Color(0xFF567DF4),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed(Routes.SIGNIN);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF567DF4),
                          fixedSize: const Size(150, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Sign in",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Image.asset("assets/icons/right.png"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const Center(
                    child: Text(
                      "Use Social Login",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/icons/ig.png"),
                      const SizedBox(width: 60),
                      Image.asset("assets/icons/tw.png"),
                      const SizedBox(width: 60),
                      Image.asset("assets/icons/fb.png"),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.offNamed(Routes.REGIST);
                      },
                      child: const Text(
                        "Create an account",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
