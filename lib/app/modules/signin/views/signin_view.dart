import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:inventaris/app/routes/app_pages.dart';
import 'package:lottie/lottie.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Center(
                child: Lottie.asset('animation/2.json'),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Text(
                "Welcome Back,",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text("Make it work, make it right, make it fast."),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              child: Container(
                height: Get.height,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 241, 242, 242),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Form(
                    key: controller.formKey,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: controller.txtEmail,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email tidak boleh kosong";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.mail),
                              labelText: ("Email"),
                              hintText: ("Enter your email"),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Obx(
                            () => TextFormField(
                              obscureText: !controller.isPasswordVisible.value,
                              controller: controller.txtPassword,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password tidak boleh kosong";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.key),
                                labelText: ("Password"),
                                hintText: ("Enter your password"),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                suffixIcon: IconButton(
                                    icon: Icon(
                                      controller.isPasswordVisible.value
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      controller.isPasswordVisible.toggle();
                                    }),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Forget Password?",
                                style: TextStyle(
                                  color: Color(0xFF23B0B0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                var email = controller.txtEmail.text;
                                var password = controller.txtPassword.text;

                                if (controller.formKey.currentState!
                                    .validate()) {
                                  controller
                                      .login(email, password)
                                      .then((value) {
                                    if (value.success == true) {
                                      controller.session.session = value;
                                      if (value.data?.role == 'admin') {
                                        Get.offAllNamed(Routes.HOME);
                                      } else {
                                        Get.offAllNamed(Routes.HOME);
                                      }
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Email/Password Salah");
                                    }
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(
                                    0xFF23B0B0), // Ganti warna latar belakang tombol di sini
                              ),
                              child: const Text("LOGIN"),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text("OR"),
                              SizedBox(
                                width: double.infinity,
                                child: OutlinedButton.icon(
                                  onPressed: () {
                                    //Get.offAllNamed(Routes.DASHBOARD);
                                  },
                                  icon: const Image(
                                    image:
                                        AssetImage("assets/images/google.png"),
                                    width: 20.0,
                                  ),
                                  label: const Text(
                                    "Sign-in with Google",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextButton(
                                onPressed: () {
                                  controller.session.logout();
                                  Get.offNamed(Routes.REGIST);
                                },
                                child: const Text.rich(
                                  TextSpan(
                                    text: "Dont have an account? ",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "Register",
                                        style: TextStyle(
                                          color: Color(0xFF23B0B0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
