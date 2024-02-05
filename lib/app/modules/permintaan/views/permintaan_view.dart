import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventaris/app/routes/app_pages.dart';
import 'package:lottie/lottie.dart';
import '../controllers/permintaan_controller.dart';

class PermintaanView extends GetView<PermintaanController> {
  const PermintaanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1f1f1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF1f1f1),
        leading: IconButton(
          onPressed: () {
            Get.offAllNamed(Routes.HOME);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF22215B),
          ),
        ),
        title: const Text(
          'Data Permintaan',
          style: TextStyle(
            color: Color(0xFF22215B),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz,
              color: Color(0xFF22215B),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (controller.listAllPermintaan.isEmpty) {
            return Center(
              child: Lottie.asset(
                'animation/notfound.json',
                width: 400,
                height: 400,
                fit: BoxFit.fill,
              ),
            );
          }

          return ListView.builder(
            itemCount: controller.listAllPermintaan.length,
            itemBuilder: (context, index) {
              final permintaan = controller.listAllPermintaan[index];

              return Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 3.0,
                  horizontal: 8.0,
                ),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  title: Text(
                    permintaan.user.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    'Request : ${permintaan.laptop.merk}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Pilih Tindakan"),
                          content: const Text("Terima atau Tolak permintaan?"),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                controller.acceptPermintaan(permintaan.id);
                                Get.back();
                                Get.offNamed(Routes.PENGGUNAAN);
                              },
                              child: const Text("Terima"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                controller.rejectPermintaan(permintaan.id);
                                Get.back();
                              },
                              child: const Text("Tolak"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
