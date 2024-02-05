import 'package:get/get.dart';

import '../controllers/laporan_penggunaan_controller.dart';

class LaporanPenggunaanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanPenggunaanController>(
      () => LaporanPenggunaanController(),
    );
  }
}
