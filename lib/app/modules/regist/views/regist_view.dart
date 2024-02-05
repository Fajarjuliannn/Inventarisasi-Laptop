import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:inventaris/app/routes/app_pages.dart';
import '../controllers/regist_controller.dart';

class RegistView extends GetView<RegistController> {
  const RegistView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          () => Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Image(
                  image: const AssetImage('assets/icons/icapp.png'),
                  height: size.height * 0.1,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Create Account,",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text("Make it work, make it right, make it fast."),
                const SizedBox(height: 20),
                Form(
                  key: controller.formKey,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: controller.nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Nama tidak boleh kosong";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.person_outline_rounded),
                            labelText: ("Username"),
                            hintText: ("Enter your username"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: controller.noPegawaiController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "No Pegawai tidak boleh kosong";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.data_usage_sharp),
                            labelText: ("No Pegawai"),
                            hintText: ("Enter your pegawai number"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: controller.emailController,
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
                        TextFormField(
                          controller: controller.passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password tidak boleh kosong";
                            } else {
                              return null;
                            }
                          },
                          obscureText: !controller.isPasswordVisible.value,
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
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: controller.passwordConfirmationController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password tidak boleh kosong";
                            } else if (value !=
                                controller.passwordController.text) {
                              return "Password tidak sesuai";
                            } else {
                              return null;
                            }
                          },
                          obscureText: !controller
                              .isPasswordVisible.value, // Toggle visibility
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.key),
                            labelText: ("Confirm Password"),
                            hintText: ("Enter your password again"),
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
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (controller.formKey.currentState!.validate()) {
                                controller.registerUser();
                                Get.offAllNamed(Routes.SIGNIN);
                              } else {
                                Fluttertoast.showToast(msg: "Register Gagal");
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(
                                  0xFF23B0B0), // Ganti warna latar belakang tombol di sini
                            ),
                            child: Obx(() => controller.isLoading.value
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text("REGISTER")),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () {
                                  Get.offAllNamed(Routes.SIGNIN);
                                },
                                child: const Text.rich(
                                  TextSpan(
                                    text: "Already have an account? ",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "Login",
                                        style: TextStyle(
                                          color: Color(0xFF23B0B0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}