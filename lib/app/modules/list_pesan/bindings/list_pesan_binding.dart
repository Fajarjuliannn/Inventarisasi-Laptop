import 'package:get/get.dart';

import '../controllers/list_pesan_controller.dart';

class ListPesanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListPesanController>(
      () => ListPesanController(),
    );
  }
}
