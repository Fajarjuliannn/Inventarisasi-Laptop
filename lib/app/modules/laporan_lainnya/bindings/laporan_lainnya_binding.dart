import 'package:get/get.dart';

import '../controllers/laporan_lainnya_controller.dart';

class LaporanLainnyaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanLainnyaController>(
      () => LaporanLainnyaController(),
    );
  }
}
