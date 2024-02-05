import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventaris/app/data/providers/inventaris_provider.dart';
import 'package:inventaris/app/data/session.dart';

class LaporanPermintaanController extends GetxController {
  InventarisProvider provider = InventarisProvider();
  mySession session = Get.put(mySession());

  final isiController = TextEditingController();

  Future<void> createLaporanPermintaan(String isi) async {
    try {
      var token = session.session.data?.token.toString();
      var userId = session.session.data?.id.toString();
      if (token != null && userId != null) {
        await provider.createPermintaanLaporan(token, isi);
        Get.snackbar('Success', 'Laporan permintaan created successfully');
      } else {
        Get.snackbar('Error', 'Token or userId is null');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to create laporan permintaan');
    }
  }
}
