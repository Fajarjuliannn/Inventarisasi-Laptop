import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventaris/app/data/providers/inventaris_provider.dart';
import 'package:inventaris/app/data/session.dart';
import 'package:inventaris/app/modules/penggunaan/model/penggunaan_model.dart';

class PenggunaanController extends GetxController {
  InventarisProvider provider = Get.put(InventarisProvider());
  mySession session = Get.put(mySession());

  var isLoading = false.obs;
  var listPenggunaan = <PenggunaanDatum>[].obs;

  fetchDataPenggunaan() async {
    try {
      var token = session.session.data?.token.toString();
      if (token != null) {
        isLoading.value = true;
        var response = await provider.getDataPenggunaan(token);
        listPenggunaan.assignAll(response);
      } else {
        Get.snackbar('Error', 'Token is null', colorText: Colors.red);
      }
    } catch (e) {
      // Get.snackbar('Error', 'Data not found', colorText: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> kembalikanLaptop(int idPenggunaan) async {
    try {
      var token = session.session.data?.token.toString();
      if (token != null) {
        await provider.kembalikanLaptop(token, idPenggunaan);
        // Handle the response as needed (show message, update UI, etc.)
        Get.snackbar('Berhasil', 'Laptop telah dikembalikan', colorText: Colors.green);
        fetchDataPenggunaan();
      } else {
        Get.snackbar('Error', 'Token is null', colorText: Colors.red);
      }
    } catch (e) {
      // Handle error (show message, log, etc.)
      Get.snackbar('Error', 'Failed to return laptop', colorText: Colors.red);
    }
  }

  @override
  void onInit() {
    fetchDataPenggunaan();
    super.onInit();
  }

  // final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;
}
