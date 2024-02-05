import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:inventaris/app/data/providers/inventaris_provider.dart';
import 'package:inventaris/app/data/session.dart';

class ResetPasswordController extends GetxController {
  InventarisProvider provider = Get.put(InventarisProvider());
  mySession session = Get.put(mySession());

  var isLoading = false.obs;

  final formKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = false.obs;

  int getUserId() {
    return session.session.data?.id ?? 0;
  }

  Future<void> updatePassword(
      String oldPassword, String newPassword, String confirmPassword) async {
    int userId = getUserId();

    if (newPassword != confirmPassword) {
      Get.snackbar('Error', 'Passwords do not match',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;
    try {
      var token = session.session.data?.token.toString();
      if (token != null) {
        await provider.updatePassword(token, userId, oldPassword, newPassword);
        Get.back();
        Get.snackbar('Success', 'Password updated successfully');
      } else {
        Get.snackbar('Error', 'Token is null');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update password');
    } finally {
      isLoading.value = false;
    }
  }
}
