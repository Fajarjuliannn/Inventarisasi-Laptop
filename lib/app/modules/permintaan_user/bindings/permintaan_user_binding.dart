import 'package:get/get.dart';

import '../controllers/permintaan_user_controller.dart';

class PermintaanUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PermintaanUserController>(
      () => PermintaanUserController(),
    );
  }
}
