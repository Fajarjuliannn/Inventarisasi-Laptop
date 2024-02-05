import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventaris/app/modules/kontak_masuk_admin/model/kontak_masuk_admin_model.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../controllers/kontak_masuk_admin_controller.dart';

class KontakMasukAdminView extends GetView<KontakMasukAdminController> {
  const KontakMasukAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF1f1f1),
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'Data Laporan',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Proses'),
              Tab(text: 'Selesai'),
            ],
            labelColor: Color(0xFF23B0B0),
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFF23B0B0),
                  width: 2.0,
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            // Content for the "Proses" tab
            _buildTabContent('Proses'),

            // Content for the "Selesai" tab
            _buildTabContent('Selesai'),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(String status) {
    return Obx(() {
      if (controller.allLaporanList.isEmpty) {
        return Center(
          child: Lottie.asset(
            'animation/notfound.json',
            width: 400,
            height: 400,
            fit: BoxFit.fill,
          ),
        );
      }

      // Filter laporan based on the status
      final filteredLaporanList = controller.allLaporanList
          .where(
              (laporan) => laporan.status.toLowerCase() == status.toLowerCase())
          .toList();

      if (filteredLaporanList.isEmpty) {
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
        itemCount: filteredLaporanList.length,
        itemBuilder: (context, index) {
          final laporan = filteredLaporanList[index];
          final user = laporan.user;

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/images/profile-dashboard.png"),
                  ),
                  title: Text(
                    user.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    'Jenis Laporan : ${laporan.jenisLaporan}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    _showLaporanDetailDialog(laporan);
                  },
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    DateFormat('yyyy-MM-dd')
                        .format(laporan.createdAt), // Format as needed
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }

  _showLaporanDetailDialog(AllLaporanDatum laporan) {
    Get.defaultDialog(
      title: 'Laporan Detail',
      content: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Isi Laporan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              laporan.isi,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (laporan.status.toLowerCase() == 'proses')
                  ElevatedButton(
                    onPressed: () {
                      // Panggil fungsi untuk merubah status menjadi selesai
                      controller.markLaporanSelesai(laporan.id);
                      Get.back();
                    },
                    child: const Text('Selesai'),
                  ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Close'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
