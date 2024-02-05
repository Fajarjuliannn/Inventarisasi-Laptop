import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController oldPasswordController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF1f1f1),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(LineAwesomeIcons.angle_left),
            color: Colors.black,
          ),
          actions: const [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Text(
                      'Reset Password',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'animation/pass.json',
                          height: 150,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Manage Your Password',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF23B0B0),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          controller: oldPasswordController,
                          obscureText: !controller.isPasswordVisible.value,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.key,
                              color: Color(0xFF23B0B0),
                            ),
                            labelText: ("Old Password"),
                            hintText: ("Enter your old password"),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isPasswordVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: const Color(0xFF23B0B0),
                              ),
                              onPressed: () {
                                controller.isPasswordVisible.toggle();
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: newPasswordController,
                          obscureText: !controller.isPasswordVisible.value,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.key,
                              color: Color(0xFF23B0B0),
                            ),
                            labelText: ("New Password"),
                            hintText: ("Enter your new password"),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: confirmPasswordController,
                          obscureText: !controller.isPasswordVisible.value,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.key,
                              color: Color(0xFF23B0B0),
                            ),
                            labelText: ("Confirm Password"),
                            hintText: ("Confirm your new password"),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () async {
                            Get.defaultDialog(
                              title: "Reset Password",
                              middleText:
                                  "Apakah Anda yakin ingin mereset password?",
                              backgroundColor: Colors.white,
                              titleStyle: const TextStyle(
                                color: Color(0xFF23B0B0),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              middleTextStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              textConfirm: "Ya",
                              textCancel: "Batal",
                              confirmTextColor: Colors.white,
                              cancelTextColor: Colors.grey,
                              buttonColor: const Color(0xFF23B0B0),
                              radius: 10.0,
                              onConfirm: () {
                                Get.back();
                                controller.updatePassword(
                                  oldPasswordController.text,
                                  newPasswordController.text,
                                  confirmPasswordController.text,
                                );
                              },
                              onCancel: () {},
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF23B0B0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child: Text(
                              'Update Password',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'be careful, please remember the password',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Color(0xFF23B0B0),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
