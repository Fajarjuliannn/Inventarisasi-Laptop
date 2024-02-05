import 'package:get/get.dart';

import '../controllers/userdetail_controller.dart';

class UserdetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserdetailController>(
      () => UserdetailController(),
    );
  }
}
