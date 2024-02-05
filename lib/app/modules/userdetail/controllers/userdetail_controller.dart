import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventaris/app/data/providers/inventaris_provider.dart';
import 'package:inventaris/app/data/session.dart';
import 'package:inventaris/app/modules/pegawai/model/pegawai_model.dart';
import 'package:inventaris/app/routes/app_pages.dart';
import 'package:lottie/lottie.dart';

class UserdetailController extends GetxController {
 InventarisProvider provider = InventarisProvider(); // No need for Get.put in this case
   mySession session = Get.find<mySession>(); // Corrected the type name

  var isLoading = false.obs;
  var listUser = <UserDatum>[].obs;

  TextEditingController noPegawaiC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();

  int getUserId() {
    return session.session.data?.id ?? 0; // Replace 0 with a default value or appropriate logic
  }

  fetchDataUser() async {
    try {
      var token = session.session.data?.token.toString();
      if (token != null) {
        var response = await provider.getDataUserr(token);
        isLoading.value = true;
        listUser.assignAll(response);
      } else {
        // Handle the case where the token is null
        Get.snackbar('Error', 'Token is null', colorText: Colors.red);
      }
    } catch (e) {
      // Handle errors here
      // print("Error fetching user data: $e");
      Get.snackbar('Error', 'Data not found', colorText: Colors.red);
    }
  }

  fetchDataSession() async {
    try {
      var response = await provider.getDataSession(session.session.data!.id.toString());
      session.session = response;
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      // Handle errors here
      // print("Error fetching session data: $e");
      Lottie.asset("animation/notfound.json");
    }
  }

  Future<void> updateUserData(int userId, Map<String, dynamic> userData) async {
    isLoading.value = true;
    try {
      var token = session.session.data?.token.toString();
      if (token != null) {
        await provider.updateUser(token, userId, userData);
        // Optionally, you can refetch the updated data after a successful update
        fetchDataUser();
      } else {
        // Handle the case where the token is null
        Get.snackbar('Error', 'Token is null', colorText: Colors.red);
      }
    } catch (e) {
      // Handle errors here
      // print("Error updating user data: $e");
      Get.snackbar('Error', 'Failed to update user data', colorText: Colors.red);
    }
  }
}
