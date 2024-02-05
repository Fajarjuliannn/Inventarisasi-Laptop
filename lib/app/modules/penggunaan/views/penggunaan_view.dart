import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/penggunaan_controller.dart';

class PenggunaanView extends GetView<PenggunaanController> {
  const PenggunaanView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF1f1f1),
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'Penggunaan',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Digunakan'),
              Tab(text: 'Dikembalikan'),
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
        body: Obx(
          () {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (controller.listPenggunaan.isEmpty) {
              return Center(
                child: Lottie.asset(
                  'animation/notfound.json',
                  width: 400,
                  height: 400,
                  fit: BoxFit.fill,
                ),
              );
            } else {
              return TabBarView(
                children: [
                  buildListViewByStatus('digunakan'),
                  buildListViewByStatus('dikembalikan'),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildListViewByStatus(String status) {
    final filteredList = controller.listPenggunaan
        .where((penggunaan) => penggunaan.status.toLowerCase() == status)
        .toList();

    return ListView.builder(
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        var penggunaan = filteredList[index];

        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            dense: true,
            title: Text(
              penggunaan.user.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  'Laptop : ${penggunaan.laptop.merk}',
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 8),
              ],
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              if (penggunaan.status != 'dikembalikan') {
                showReturnDialog(penggunaan.id, controller);
              } else {
                Fluttertoast.showToast(msg: "Laptop Telah Dikembalikan");
              }
            },
          ),
        );
      },
    );
  }

  void showReturnDialog(int idPenggunaan, PenggunaanController controller) {
    Get.defaultDialog(
      title: 'Kembalikan Laptop',
      content: Column(
        children: [
          const Text('Apakah Anda yakin ingin mengembalikan laptop?'),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Batal'),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.kembalikanLaptop(idPenggunaan);
                  Get.back();
                },
                child: const Text('Kembalikan'),
              ),
            ],
          ),
        ],
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
      return 2;
  }
}
