import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventaris/app/data/providers/inventaris_provider.dart';

class RegistController extends GetxController {
  InventarisProvider provider = InventarisProvider();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController noPegawaiController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();

  final RxBool isLoading = false.obs;

  final formKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = false.obs;

  Future<void> registerUser() async {
    try {
      isLoading.value = true;

      if (passwordController.text != passwordConfirmationController.text) {
        // Passwords do not match
        Get.snackbar('Error', 'Passwords do not match',
            snackPosition: SnackPosition.BOTTOM);
        return;
      }

      final response = await provider.register(
        nameController.text,
        emailController.text,
        passwordController.text,
        noPegawaiController.text,
      );

      if (response.success) {
        Get.snackbar('Success', 'Registration successful',
            snackPosition: SnackPosition.BOTTOM);
        clearTextControllers();
      } else {
        Get.snackbar('Error', 'Registration failed: ${response.message}',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', 'Error during registration: $e',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  void clearTextControllers() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    passwordConfirmationController.clear(); // Clear password confirmation
    noPegawaiController.clear();
  }
}
