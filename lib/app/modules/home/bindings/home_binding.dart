import 'package:get/get.dart';
import 'package:inventaris/app/modules/contact/controllers/contact_controller.dart';
import 'package:inventaris/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:inventaris/app/modules/kirim_pesan/controllers/kirim_pesan_controller.dart';
import 'package:inventaris/app/modules/kontak_masuk_admin/controllers/kontak_masuk_admin_controller.dart';
import 'package:inventaris/app/modules/settings/controllers/settings_controller.dart';
import 'package:inventaris/app/modules/user-dashboard/controllers/user_dashboard_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.put(UserDashboardController());
    Get.put(ContactController());
    Get.put(SettingsController());
    Get.put(DashboardController());
    Get.put(KontakMasukAdminController());
    Get.put(KirimPesanController());
  }
}
