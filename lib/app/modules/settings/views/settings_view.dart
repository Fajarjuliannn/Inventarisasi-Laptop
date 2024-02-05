import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:inventaris/app/routes/app_pages.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(Routes.HOME);

        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF1f1f1),
          leading: IconButton(
            onPressed: () {
              Get.offAllNamed(Routes.HOME);
            },
            icon: const Icon(LineAwesomeIcons.angle_left),
            color: Colors.black,
          ),
          title: const Text(
            'Information',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon:
                    Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/images/profile-dashboard.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color(0xFF23B0B0).withOpacity(0.7),
                        ),
                        child: const Icon(
                          LineAwesomeIcons.alternate_pencil,
                          size: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Text(controller.userName),
                Obx(() {
                  // Access the value property of the observable variable
                  return Text(controller.nam.value);
                }), // Menampilkan nama pengguna
                // Obx(() => Text(controller.nam.value),),  // Menampilkan nomor pegawai
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.PERSONALINFO);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF23B0B0),
                      side: BorderSide.none,
                      shape: const StadiumBorder(),
                    ),
                    child: const Text(
                      "Profile",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Divider(),
                const SizedBox(height: 10),
                ProfileMenuWidget(
                    title: "Settings",
                    icon: LineAwesomeIcons.cog,
                    onPress: () {
                      Get.toNamed(Routes.USERDETAIL);
                    }),
                ProfileMenuWidget(
                    title: "Password",
                    icon: LineAwesomeIcons.user_check,
                    onPress: () {
                      Get.toNamed(Routes.RESET_PASSWORD);
                      // print(controller.session.session.data?.token);
                    }),
                ProfileMenuWidget(
                    title: "Panduan",
                    icon: LineAwesomeIcons.book,
                    onPress: () {
                      Get.toNamed(Routes.PANDUAN);
                    }),
                const Divider(),
                const SizedBox(height: 10),
                ProfileMenuWidget(
                    title: "About Vento Laps",
                    icon: LineAwesomeIcons.info,
                    onPress: () {
                      Get.toNamed(Routes.ABOUT);
                    }),
                ProfileMenuWidget(
                  title: "Logout",
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                    Get.defaultDialog(
                      title: "Logout",
                      middleText: "Apakah Anda yakin ingin logout?",
                      backgroundColor:
                          Colors.white, // Ganti warna latar belakang dialog
                      titleStyle: const TextStyle(
                        color: Color(0xFF23B0B0), // Ganti warna teks judul
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      middleTextStyle: const TextStyle(
                        color: Colors.black, // Ganti warna teks pertanyaan
                        fontSize: 16,
                      ),
                      textConfirm: "Ya",
                      textCancel: "Batal",
                      confirmTextColor: Colors.white,
                      cancelTextColor: Colors.grey,
                      buttonColor: const Color(
                          0xFF23B0B0), // Ganti warna latar belakang tombol "Ya" dan "Batal"
                      radius: 10.0, // Atur radius sudut dialog
                      onConfirm: () {
                        controller.session.logout();
                        Get.offAllNamed(Routes.LOGIN);
                      },
                      onCancel: () {},
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? Colors.blue : const Color(0xFF23B0B0);
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: iconColor.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
      title: Text(title,
          style:
              Theme.of(context).textTheme.bodyLarge?.apply(color: textColor)),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(
                LineAwesomeIcons.angle_right,
                size: 18.0,
                color: Colors.grey,
              ),
            )
          : null,
    );
  }
}
