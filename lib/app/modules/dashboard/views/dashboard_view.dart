import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventaris/app/routes/app_pages.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
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
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'logout') {
                Get.defaultDialog(
                  title: "Logout",
                  middleText: "Apakah Anda yakin ingin logout?",
                  backgroundColor: Colors.white,
                  titleStyle: const TextStyle(
                    color: Color(0xFF23B0B0),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  middleTextStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  textConfirm: "Ya",
                  textCancel: "Batal",
                  confirmTextColor: Colors.white,
                  cancelTextColor: Colors.grey,
                  buttonColor: const Color(0xFF23B0B0),
                  radius: 10.0,
                  onConfirm: () {
                    controller.session.logout();
                    Get.offAllNamed(Routes.LOGIN);
                  },
                  onCancel: () {},
                );
              }
            },
            icon: const Icon(
              Icons.more_horiz,
              color: Color(0xFF22215B),
            ),
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'logout',
                child: Text('Logout'),
              ),
            ],
          ),
        ],
        centerTitle: true,
      ),
      body: Obx(
        () => ListView(
          children: [
            Container(
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
                      const Text(
                        "Fullstack Developer",
                        style: TextStyle(
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
                    child: Container(
                      width: 60,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF317B),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: const Center(
                        child: Text(
                          "Admin",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
                      Get.toNamed(Routes.PEGAWAI);
                    },
                    child: CardFolder(
                      image: Image.asset("assets/images/folder1-d.png"),
                      title: "Data Pegawai",
                      dataCount:
                          "${controller.listCount.isNotEmpty ? controller.listCount[0].data.usersCount : 0} Data",
                      color: const Color(0xFF415EB6),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.ASSET);
                    },
                    child: CardFolder(
                      image: Image.asset("assets/images/folder2-d.png"),
                      title: "Asset",
                      dataCount:
                          "${controller.listCount.isNotEmpty ? controller.listCount[0].data.assetsCount : 0} Data",
                      color: const Color(0xFFFFB110),
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
                      Get.toNamed(Routes.PERMINTAAN);
                    },
                    child: CardFolder(
                      image: Image.asset("assets/images/folder3-d.png"),
                      title: "Permintaan",
                      dataCount:
                          "${controller.listCount.isNotEmpty ? controller.listCount[0].data.permintaansCount : 0} Data",
                      color: const Color(0xFFAC4040),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.PENGGUNAAN);
                    },
                    child: CardFolder(
                      image: Image.asset("assets/images/folder4-d.png"),
                      title: "Penggunaan",
                      dataCount:
                          "${controller.listCount.isNotEmpty ? controller.listCount[0].data.penggunaansCount : 0} Data",
                      color: const Color(0xFF23B0B0),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class CardFolder extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const CardFolder({
    Key? key,
    required this.title,
    required this.dataCount,
    required this.color,
    required this.image,
  });

  final String title;
  final String dataCount; // Ubah properti date menjadi dataCount
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
            dataCount, // Menggunakan properti dataCount
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
