import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventaris/app/data/providers/inventaris_provider.dart';
import 'package:inventaris/app/data/session.dart';
import 'package:inventaris/app/modules/permintaan/model/list_permintaan_model.dart';
import 'package:inventaris/app/routes/app_pages.dart';

class PermintaanController extends GetxController {
  InventarisProvider provider = Get.put(InventarisProvider());
  mySession session = Get.put(mySession());

  var isLoading = false.obs;
  var listAllPermintaan = <PermintaanListDatum>[].obs;

  fetchDataPermintaan() async {
    try {
      var token = session.session.data?.token.toString();
      if (token != null) {
        isLoading.value = true;
        var response = await provider.getDataPermintaan(token);
        listAllPermintaan.assignAll(response);
      } else {
        Get.snackbar('Error', 'Token is null', colorText: Colors.red);
      }
    } catch (e) {
      // Get.snackbar('Error', 'Data not found', colorText: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchDataPermintaan();
  }

  // Method to accept permintaan
  Future<void> acceptPermintaan(int idPermintaan) async {
    try {
      var token = session.session.data?.token.toString();
      if (token != null) {
        isLoading.value = true;
        await provider.acceptRequest(token, idPermintaan);
        Get.snackbar('Berhasil', 'Laptop Telah Diterima',
            colorText: Colors.green);
        fetchDataPermintaan(); // Panggil kembali fetchDataPermintaan setelah operasi selesai
      } else {
        Get.snackbar('Error', 'Token is null', colorText: Colors.red);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to accept permintaan',
          colorText: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  // Method to reject permintaan
  Future<void> rejectPermintaan(int idPermintaan) async {
    try {
      var token = session.session.data?.token.toString();
      if (token != null) {
        isLoading.value = true;
        await provider.rejectRequest(token, idPermintaan);
        fetchDataPermintaan(); // Panggil kembali fetchDataPermintaan setelah operasi selesai
        Get.offNamed(Routes.KIRIM_PESAN);
      } else {
        Get.snackbar('Error', 'Token is null', colorText: Colors.red);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to reject permintaan',
          colorText: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }
}
