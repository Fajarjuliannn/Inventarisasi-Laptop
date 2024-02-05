import 'package:get/get.dart';

import '../controllers/laporan_permintaan_controller.dart';

class LaporanPermintaanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanPermintaanController>(
      () => LaporanPermintaanController(),
    );
  }
}
