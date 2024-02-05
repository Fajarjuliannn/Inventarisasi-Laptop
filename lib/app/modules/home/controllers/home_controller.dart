import 'package:get/get.dart';
import 'package:inventaris/app/data/session.dart';
import 'package:inventaris/app/modules/contact/views/contact_view.dart';
import 'package:inventaris/app/modules/kirim_pesan/views/kirim_pesan_view.dart';
import 'package:inventaris/app/modules/kontak_masuk_admin/views/kontak_masuk_admin_view.dart';
import 'package:inventaris/app/modules/settings/views/settings_view.dart';

class HomeController extends GetxController {
  mySession session = Get.put(mySession());

  final RxInt page = 1.obs; // Use RxInt for observability

  void changePage(int value) {
    if (value == 0 || value == 2) {
      // Gunakan Get.to untuk pindah ke halaman tanpa menampilkan bottom navigation bar
      if (value == 0) {
        session.session.data?.role == "admin" ? 
        Get.to(() => const KontakMasukAdminView()) : Get.to(() => const ContactView()) ;
      } else {
        session.session.data?.role == "admin" ? 
        Get.to(() => const KirimPesanView()) : Get.to(() => const SettingsView());
      }
    } else {
      page.value = value;
    }
  }

  

  // final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;
}
