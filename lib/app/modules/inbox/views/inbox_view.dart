import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventaris/app/modules/inbox/model/pesan_user_model.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../controllers/inbox_controller.dart';

class InboxView extends GetView<InboxController> {
  // ignore: use_key_in_widget_constructors
  const InboxView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1f1f1),
        title: const Text(
          'Inbox',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.listPesanUser.isEmpty) {
            return Center(
              child: Lottie.asset(
                'animation/notfound.json',
                width: 400,
                height: 400,
                fit: BoxFit.fill,
              ),
            );
          } else {
            return ListView.builder(
              itemCount: controller.listPesanUser.length,
              itemBuilder: (context, index) {
                final pesan = controller.listPesanUser[index];
                return InkWell(
                  onTap: () => _showMessageDialog(context, pesan),
                  child: Card(
                    elevation: 2,
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      title: const Text(
                        "Pesan",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.blue, // Customize text color
                        ),
                      ),
                      subtitle: Text(
                        "Dikirim Pada: ${DateFormat('yyyy-MM-dd').format(pesan.createdAt)}",
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.grey, // Customize text color
                        ),
                      ),
                      tileColor: Colors.white, // Customize tile color
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  void _showMessageDialog(BuildContext context, PesanUserDatum pesan) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Check the status of the message
        bool isDiterima = pesan.status == 'diterima';

        return AlertDialog(
          title: const Text(
            'Pesan',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.blue, // Customize text color
            ),
          ),
          content: Text(
            pesan.content,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          actions: [
            // Show different buttons based on the message status
            if (isDiterima)
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Close',
                  style: TextStyle(
                    color: Colors.grey, // Customize text color
                  ),
                ),
              ),
            if (!isDiterima)
              ElevatedButton(
                onPressed: () {
                  controller.terimaPesan(pesan.id);
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Customize button color
                ),
                child: const Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.white, // Customize text color
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
