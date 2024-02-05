import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inventaris/app/data/session.dart';
import 'package:inventaris/app/routes/app_pages.dart';

class SplashscreenController extends GetxController {
  final mySession session = Get.find<mySession>();

  final box = GetStorage();

  @override
  void onReady() {
    super.onReady();
    navigateToNextScreen();
  }

  void navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));

    bool isFirstInstall = box.read('first_install') ?? true;

    if (isFirstInstall) {
      // Aplikasi baru diinstal, tampilkan halaman onboarding
      Get.offAllNamed(Routes.ONBOARD);
      // Setelah menampilkan onboarding, tandai bahwa aplikasi sudah diinstal
      box.write('first_install', false);
    } else {
      // Aplikasi sudah diinstal sebelumnya, lakukan pengecekan sesi
      final mySession session = Get.find<mySession>();
      if (session.isLoggedIn) {
        final role = session.session.data?.role;
        if (role == 'admin') {
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.offAllNamed(Routes.HOME);
        }
      } else {
        Get.offAllNamed(Routes.LOGIN);
      }
    }
  }
}
