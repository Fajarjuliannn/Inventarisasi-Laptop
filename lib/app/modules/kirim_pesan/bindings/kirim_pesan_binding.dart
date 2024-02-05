import 'package:get/get.dart';

import '../controllers/kirim_pesan_controller.dart';

class KirimPesanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KirimPesanController>(
      () => KirimPesanController(),
    );
  }
}
