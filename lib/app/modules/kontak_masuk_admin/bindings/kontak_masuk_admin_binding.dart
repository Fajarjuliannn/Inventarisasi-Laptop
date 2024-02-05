import 'package:get/get.dart';

import '../controllers/kontak_masuk_admin_controller.dart';

class KontakMasukAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KontakMasukAdminController>(
      () => KontakMasukAdminController(),
    );
  }
}
