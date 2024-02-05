import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventaris/app/routes/app_pages.dart';

import '../controllers/user_dashboard_controller.dart';

class UserDashboardView extends GetView<UserDashboardController> {
  const UserDashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1f1f1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF1f1f1),
        title: const Text(
          'Dashboard',
          style: TextStyle(
            color: Color(0xFF22215B),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.LAPORAN_LAINNYA);
            },
            icon: const Icon(
              Icons.help_outline_outlined,
              color: Color(0xFF22215B),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: ListView(
        children: [
          GestureDetector(
            onDoubleTap: () {
              Get.toNamed(Routes.USERDETAIL);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 75,
                        height: 75,
                        child: Image.asset(
                          "assets/images/profile-dashboard.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "${controller.session.session.data?.name}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF22215B),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "${controller.session.session.data?.noPegawai}",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Payakumbuh Maju, Sejahtera dan Bermartabat dengan Semangat Kebersamaan Menuju Payakumbuh Menang",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF22215B).withOpacity(0.6),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: (){
                        // print(controller.session.session.data?.name);
                        // print(controller.session.session.data?.noPegawai);
                      },
                      child: Container(
                        width: 60,
                        height: 30,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF317B),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: const Center(
                          child: Text(
                            "User",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Menu",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    //print(controller.session.session.data?.email);
                    Get.toNamed(Routes.ASSET);
                  },
                  child: CardFolder(
                    image: Image.asset("assets/images/folder2-d.png"),
                    title: "Asset",
                    date: "December 14.2020",
                    color: const Color(0xFFFFB110),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.PERMINTAAN_USER);
                  },
                  child: CardFolder(
                    image: Image.asset("assets/images/folder4-d.png"),
                    title: "Permintaan",
                    date: "Novemaber 10.2020",
                    color: const Color(0xFF23B0B0),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.PENGGUNAAN_USER);
                  },
                  child: CardFolder(
                    image: Image.asset("assets/images/folder1-d.png"),
                    title: "Penggunaan",
                    date: "December 20.2020",
                    color: const Color(0xFF415EB6),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.INBOX);
                  },
                  child: CardFolder(
                    image: Image.asset("assets/images/folder3-d.png"),
                    title: "Kontak Masuk",
                    date: "Novemaber 22.2020",
                    color: const Color(0xFFAC4040),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     IconButton(
          //       onPressed: () {
          //         Get.toNamed(Routes.CONTACT);
          //       },
          //       icon: const Icon(
          //         Icons.headset_mic_rounded,
          //         size: 30,
          //         color: Color(0xFFAC4040),
          //       ),
          //     ),
          //     IconButton(
          //       onPressed: () {
          //         Get.toNamed(Routes.USER_DASHBOARD);
          //       },
          //       icon: const Icon(
          //         Icons.home,
          //         size: 30,
          //         color: Color(0xFF415EB6),
          //       ),
          //     ),
          //     IconButton(
          //       onPressed: () {
          //         Get.toNamed(Routes.SETTINGS);
          //       },
          //       icon: const Icon(
          //         Icons.settings,
          //         size: 30,
          //         color: Color(0xFF23B0B0),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}

class CardFolder extends StatelessWidget {
  const CardFolder({
    super.key,
    required this.title,
    required this.date,
    required this.color,
    required this.image,
  });

  final String title;
  final String date;
  final Color color;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: Get.width * 0.4,
      height: 120,
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          image,
          const SizedBox(height: 15),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            date,
            style: TextStyle(
              fontSize: 12,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
