import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import '../controllers/laporan_penggunaan_controller.dart';

class LaporanPenggunaanView extends GetView<LaporanPenggunaanController> {
  // ignore: use_key_in_widget_constructors
  const LaporanPenggunaanView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1f1f1),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(LineAwesomeIcons.angle_left),
          color: Colors.black,
        ),
        actions: const [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Text(
                    'Lapor Penggunaan',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Lottie animation above the TextField
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Lottie.asset(
                  'animation/laporan1.json', // Sesuaikan dengan path animasi Lottie Anda
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              // Text above the TextField
              const Text(
                'Penggunaan Laptop',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF23B0B0),
                ),
              ),
              const SizedBox(height: 20),
              // Styled TextField
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: TextField(
                  controller: controller.isiController,
                  decoration: InputDecoration(
                    labelText: 'Isi Laporan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                  ),
                ),
              ),
              // Styled ElevatedButton
              ElevatedButton(
                onPressed: () {
                  controller
                      .createLaporanPenggunaan(controller.isiController.text);
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF23B0B0), // Customize button color
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 24,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Submit Laporan',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
