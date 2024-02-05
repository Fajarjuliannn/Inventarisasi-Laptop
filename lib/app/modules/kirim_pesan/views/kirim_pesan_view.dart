import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventaris/app/routes/app_pages.dart';

import '../controllers/kirim_pesan_controller.dart';

class KirimPesanView extends GetView<KirimPesanController> {
  const KirimPesanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1f1f1),
        title: const Text(
          'Kirim Pesan',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
            color: Colors.black), // Mengubah warna ikon back
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'allMessages') {
                Get.toNamed(Routes.LIST_PESAN);
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'allMessages',
                child: Text('All Messages'),
              ),
            ],
            icon: const Icon(Icons.more_vert), // Ikon PopupMenuButton
            offset: const Offset(0, 40), // Atur offset jika diperlukan
          ),
        ],
      ),
      body: Obx(() {
        if (controller.listUser.isEmpty) {
          return const Center(
            child: Text(
              'Tidak ada pegawai yang tersedia.',
              style: TextStyle(fontSize: 18),
            ),
          );
        }
        return ListView.builder(
          itemCount: controller.listUser.length,
          itemBuilder: (context, index) {
            final user = controller.listUser[index];

            if (user.role.toLowerCase() != 'admin') {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Card(
                  elevation: 2,
                  child: ListTile(
                    title: Text(
                      user.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('No Pegawai: ${user.noPegawai}'),
                    onTap: () {
                      // Show a more attractive bottom sheet
                      _showSendMessageBottomSheet(context, user.id, user.name);
                    },
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        );
      }),
    );
  }

  // Function to show a more attractive bottom sheet for sending messages
  void _showSendMessageBottomSheet(
      BuildContext context, int receiverId, String receiverName) {
    TextEditingController messageController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Ensure the modal can be scrolled
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Kirim Pesan ke $receiverName',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: messageController,
                    decoration: const InputDecoration(labelText: 'Pesan'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      controller.kirimPesanToUser(
                          receiverId, messageController.text);
                      Navigator.pop(context);
                    },
                    child: const Text('Kirim'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
