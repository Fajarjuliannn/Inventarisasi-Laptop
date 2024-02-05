import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventaris/app/modules/contact/views/contact_view.dart';
import 'package:inventaris/app/modules/dashboard/views/dashboard_view.dart';
import 'package:inventaris/app/modules/kirim_pesan/views/kirim_pesan_view.dart';
import 'package:inventaris/app/modules/kontak_masuk_admin/views/kontak_masuk_admin_view.dart';
import 'package:inventaris/app/modules/settings/views/settings_view.dart';
import 'package:inventaris/app/modules/user-dashboard/views/user_dashboard_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  // final RxInt page = 1.obs; // Use RxInt for observability

  // final List<Widget> _listPage = [
  //   ContactView(),
  //   UserDashboardView(),
  //   SettingsView()
  // ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<HomeController>(
          builder: (controller) {
            // Gunakan Get.to jika page.value adalah 0 atau 2
            if (controller.page.value == 0) {
              return controller.session.session.data?.role == "admin"
                  ? const KontakMasukAdminView()
                  : const ContactView();
            } else if (controller.page.value == 2) {
              return controller.session.session.data?.role == "admin"
                  ? const KirimPesanView()
                  : const SettingsView();
            } else {
              return controller.session.session.data?.role == "admin"
                  ? const DashboardView()
                  : const UserDashboardView();
            }
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Colors.white,
          backgroundColor: const Color(0xFFF1f1f1),
          onTap: (value) {
            controller.changePage(value);
          },
          currentIndex: controller.page.value,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.lightBlueAccent,
          items: [
            controller.session.session.data?.role == "admin"
                ? const BottomNavigationBarItem(
                    icon: Icon(
                      Icons.mail,
                      size: 30,
                      color: Color(0xFFAC4040),
                    ),
                    label: '',
                  )
                : const BottomNavigationBarItem(
                    icon: Icon(
                      Icons.headset_mic_rounded,
                      size: 30,
                      color: Color(0xFFAC4040),
                    ),
                    label: '',
                  ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
                color: Color(0xFF415EB6),
              ),
              label: '',
            ),
            controller.session.session.data?.role == "admin"
                ? const BottomNavigationBarItem(
                    icon: Icon(
                      Icons.send_time_extension_sharp,
                      size: 30,
                      color: Color(0xFF23B0B0),
                    ),
                    label: '',
                  )
                : const BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings,
                      size: 30,
                      color: Color(0xFF23B0B0),
                    ),
                    label: '',
                  )
          ],
        ),
      ),
    );
  }
}
