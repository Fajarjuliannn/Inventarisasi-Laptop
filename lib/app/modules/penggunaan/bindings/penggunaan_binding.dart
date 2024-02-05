import 'package:get/get.dart';

import '../controllers/penggunaan_controller.dart';

class PenggunaanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PenggunaanController>(
      () => PenggunaanController(),
    );
  }
}
