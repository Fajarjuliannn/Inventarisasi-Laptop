import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventaris/app/modules/list_pesan/model/list_pesan_model.dart';
import 'package:lottie/lottie.dart';
import '../controllers/list_pesan_controller.dart';

class ListPesanView extends GetView<ListPesanController> {
  // ignore: use_key_in_widget_constructors
  const ListPesanView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1f1f1),
        title: const Text(
          'List Pesan',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      body: Obx(
        () {
          // Check if there is no data
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.listPesan.isEmpty) {
            return Center(
              child: Lottie.asset(
                'animation/notfound.json',
                width: 400,
                height: 400,
                fit: BoxFit.fill,
              ),
            );
          } else {
            // Build the list of messages with a more attractive design
            return ListView.builder(
              itemCount: controller.listPesan.length,
              itemBuilder: (context, index) {
                final message = controller.listPesan[index];

                // You can customize the UI based on your ListPesanDatum properties
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Card(
                    elevation: 2,
                    child: ListTile(
                      title: Text(
                        'Penerima: ${message.receiverId.name}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Status: ${message.status}'),
                      // Add more details as needed
                      onTap: () {
                        _showMessageDialog(
                            context, message); // Show the dialog on tap
                      },
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

  // Function to show the dialog alert
  void _showMessageDialog(BuildContext context, ListPesanDatum message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Message Details',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailRow('Pesan', message.content),
              _buildDetailRow('Dibuat', message.createdAt.toString()),
              // Add more details as needed
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label : ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
