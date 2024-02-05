import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventaris/app/routes/app_pages.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import '../controllers/penggunaan_user_controller.dart';
import 'package:intl/intl.dart';

class PenggunaanUserView extends GetView<PenggunaanUserController> {
  const PenggunaanUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: const Color(0xFF23B0B0),
      //   onPressed: () {},
      //   child: const Icon(Icons.settings_backup_restore_rounded),
      // ),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1f1f1),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(LineAwesomeIcons.angle_left),
          color: Colors.black,
        ),
        title: const Text(
          'Informasi Penggunaan',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.listPenggunaanUser.isEmpty) {
            return Center(
              child: Lottie.asset(
                'animation/notfound.json',
                width: 400,
                height: 400,
                fit: BoxFit.fill,
              ),
            );
          } else {
            controller.listPenggunaanUser.sort((a, b) =>
                getStatusPriority(a.status)
                    .compareTo(getStatusPriority(b.status)));
            return PageView.builder(
              itemCount: controller.listPenggunaanUser.length,
              itemBuilder: (context, index) {
                var item = controller.listPenggunaanUser[index];
                var laptop = item.laptop;
                //var user = item.user;

                return Padding(
                  padding: const EdgeInsets.only(
                      top: 25, bottom: 40, left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                            child: Image.asset(
                              "assets/icons/laptopicon.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Data Laptop",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 10,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.laptop,
                                            color: Colors.blue,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      Text(
                                        laptop.merk,
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              const Padding(
                                padding: EdgeInsets.only(left: 50),
                                child: Divider(
                                  thickness: 0.2,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.storage,
                                        color: Colors.blue,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Text(
                                    laptop.ram,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              const Padding(
                                padding: EdgeInsets.only(left: 50),
                                child: Divider(
                                  thickness: 0.2,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.date_range,
                                        color: Colors.blue,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Text(
                                    // ignore: unnecessary_null_comparison
                                    item.createdAt != null
                                        ? DateFormat('dd-MM-yyyy')
                                            .format(item.createdAt)
                                        : 'Not available', // or any default message
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Status",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 90,
                            height: 22,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  item.status,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 10,
                              blurRadius: 10,
                              // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: const Center(
                                          child: Icon(
                                            Icons.mark_email_read_outlined,
                                            color: Colors.blue,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      const Text(
                                        "Ada Masalah?",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      )
                                    ],
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.offNamed(Routes.LAPORAN_PENGGUNAAN);
                                    },
                                    child: const Text(
                                      "Buat Laporan",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

int getStatusPriority(String status) {
  switch (status.toLowerCase()) {
    case 'digunakan':
      return 0;
    case 'dikembalikan':
      return 1;
    default:
      return 2; // Mengembalikan nilai tinggi untuk status tidak dikenali
  }
}
