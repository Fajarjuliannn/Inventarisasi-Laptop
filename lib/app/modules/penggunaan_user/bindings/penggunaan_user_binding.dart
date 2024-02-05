import 'package:get/get.dart';

import '../controllers/penggunaan_user_controller.dart';

class PenggunaanUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PenggunaanUserController>(
      () => PenggunaanUserController(),
    );
  }
}
