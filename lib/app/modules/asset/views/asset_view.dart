import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventaris/app/modules/asset/controllers/asset_controller.dart';
import 'package:inventaris/app/modules/asset/model/asset_model.dart';
import 'package:inventaris/app/routes/app_pages.dart';
import 'package:lottie/lottie.dart';
//import 'package:inventaris/app/routes/app_pages.dart';
// import 'package:quickalert/quickalert.dart';

class AssetView extends GetView<AssetController> {
  const AssetView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Jumlah tab
      child: Scaffold(
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
            'Office Assets',
            style: TextStyle(
              color: Color(0xFF22215B),
            ),
          ),
          centerTitle: true,
          actions: [
            // Pernyataan kondisional untuk menampilkan tombol tambah hanya untuk role admin
            if (controller.isAdmin())
              IconButton(
                onPressed: () {
                  _showAddDialog(context);
                },
                icon: const Icon(
                  Icons.add,
                  color: Color(0xFF22215B),
                ),
              ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Tersedia'),
              Tab(text: 'Digunakan'),
              Tab(text: 'Diperbaiki'),
            ],
            labelColor: Colors.black,
            indicatorColor: Colors.grey,
          ),
        ),
        body: TabBarView(
          children: [
            _buildAssetList(context, 'tersedia'),
            _buildAssetList(context, 'digunakan'),
            _buildAssetList(context, 'diperbaiki'),
          ],
        ),
      ),
    );
  }

  Widget _buildAssetList(BuildContext context, String status) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 8.0), // Adjust the top padding as needed
      child: Obx(
        () {
          List<Datum> sortedList = List.from(controller.listLaptop
              .where((laptop) => laptop.status.toLowerCase() == status));

          if (sortedList.isEmpty) {
            // Tampilkan animasi Lottie jika data tidak ditemukan
            return Center(
              child: Lottie.asset(
                'animation/notfound.json',
                width: 400,
                height: 400,
                fit: BoxFit.fill,
              ),
            );
          }

          sortedList.sort((a, b) {
            return getStatusPriority(a.status)
                .compareTo(getStatusPriority(b.status));
          });

          return GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            children: sortedList.map((x) {
              Color color = getStatusColor(x.status);

              return InkWell(
                onTap: () {
                  controller.isAdmin()
                      ? _showEditDialog(context, x)
                      : _showDetailDialog(context, x);
                },
                child: CardFolder(
                  image: Image.asset("assets/images/folder4-d.png"),
                  title: x.merk,
                  subtitle: x.status.toUpperCase(),
                  color: color,
                  status: '',
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  void _showDetailDialog(BuildContext context, Datum laptop) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Detail Laptop",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailRow("Merk:", laptop.merk),
              _buildDetailRow("RAM:", laptop.ram),
              _buildDetailRow("Prosesor:", laptop.prosesor),
              _buildDetailRow("Harddisk:", laptop.harddisk),
              _buildDetailRow(
                "Status:",
                laptop.status.toUpperCase(),
                textColor: getStatusColor(laptop.status),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Kembali"),
            ),
            if (laptop.status.toLowerCase() == 'tersedia')
              ElevatedButton(
                onPressed: () {
                  _showRequestDialog(context, laptop.id);
                },
                child: const Text("Request"),
              ),
          ],
        );
      },
    );
  }

  Widget _buildDetailRow(String label, String value,
      {Color textColor = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showRequestDialog(BuildContext context, int idLaptop) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Request Laptop"),
          content:
              const Text("Anda yakin ingin melakukan permintaan laptop ini?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () async {
                Get.back();
                Get.back();
                await controller.requestLaptop(idLaptop);
              },
              child: const Text(
                "Request",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(BuildContext context, Datum laptop) {
    if (!controller.isAdmin()) {
      return;
    }

    TextEditingController merkController =
        TextEditingController(text: laptop.merk);
    TextEditingController ramController =
        TextEditingController(text: laptop.ram.toString());
    TextEditingController prosesorController =
        TextEditingController(text: laptop.prosesor);
    TextEditingController harddiskController =
        TextEditingController(text: laptop.harddisk);
    TextEditingController statusController =
        TextEditingController(text: laptop.status);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[100],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  _buildEditTextField("Merk", merkController),
                  const SizedBox(height: 16),
                  _buildEditTextField("RAM", ramController),
                  const SizedBox(height: 16),
                  _buildEditTextField("Prosesor", prosesorController),
                  const SizedBox(height: 16),
                  _buildEditTextField("Harddisk", harddiskController),
                  const SizedBox(height: 16),
                  _buildReadOnlyTextField("Status", statusController),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildDeleteButton(context, laptop.id),
                      const SizedBox(width: 8),
                      _buildDialogButton("Batal", Colors.grey, () {
                        Navigator.of(context).pop();
                      }),
                      const SizedBox(width: 8),
                      _buildDialogButton("Simpan", Colors.blue, () async {
                        Map<String, dynamic> updatedData = {
                          'merk': merkController.text,
                          'ram': ramController.text,
                          'prosesor': prosesorController.text,
                          'harddisk': harddiskController.text,
                          'status': statusController.text,
                        };

                        Get.back();
                        await controller.updateDataLaptop(
                            laptop.id, updatedData);
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildEditTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.blue),
        ),
      ),
    );
  }

  Widget _buildReadOnlyTextField(
      String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildDeleteButton(BuildContext context, int laptopId) {
    return IconButton(
      icon: const Icon(
        Icons.delete,
        color: Colors.red,
      ),
      onPressed: () {
        _showDeleteConfirmation(context, laptopId);
      },
    );
  }

  Widget _buildDialogButton(String label, Color color, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: color,
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, int laptopId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Hapus Data Laptop"),
          content: const Text("Anda yakin ingin menghapus data laptop ini?"),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Batal"),
            ),
            TextButton(
              onPressed: () async {
                await controller.deleteDataLaptop(laptopId);

                Get.back();
                Get.back();

                // ignore: use_build_context_synchronously
                // QuickAlert.show(
                //     context: context,
                //     type: QuickAlertType.success,
                //     text: "Delete Successfully");
              },
              child: const Text(
                "Hapus",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showAddDialog(BuildContext context) {
    if (!controller.isAdmin()) {
      return;
    }

    TextEditingController merkController = TextEditingController();
    TextEditingController ramController = TextEditingController();
    TextEditingController prosesorController = TextEditingController();
    TextEditingController harddiskController = TextEditingController();
    TextEditingController statusController =
        TextEditingController(text: 'tersedia'); // Set nilai default 'tersedia'

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: Colors.transparent,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[100],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  _buildTextField("Merk", merkController),
                  _buildTextField("RAM", ramController),
                  _buildTextField("Prosesor", prosesorController),
                  _buildTextField("Harddisk", harddiskController),
                  _buildReadOnlyTextField("Status", statusController),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildDialogButton("Batal", Colors.grey, () {
                        Navigator.of(context).pop();
                      }),
                      const SizedBox(width: 8),
                      _buildDialogButton("Tambah", Colors.blue, () async {
                        Map<String, dynamic> newData = {
                          'merk': merkController.text,
                          'ram': ramController.text,
                          'prosesor': prosesorController.text,
                          'harddisk': harddiskController.text,
                          'status': statusController.text,
                        };

                        await controller.createDataLaptop(newData);
                        Get.back();
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardFolder extends StatelessWidget {
  const CardFolder({
    super.key,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.image,
    required this.color,
  });

  final String title;
  final String subtitle;
  final String status;
  final Image image;
  final Color color;

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
          Center(
            child: ClipOval(
              child: Container(
                width: 60, // Sesuaikan ukuran lingkaran sesuai kebutuhan
                height: 60,
                color: Colors.white, // Warna latar belakang lingkaran
                child: Center(child: image),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              )),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Text(
              subtitle,
              style: TextStyle(
                fontSize: 14,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Color getStatusColor(String status) {
  switch (status.toLowerCase()) {
    case 'tersedia':
      return Colors.green;
    case 'digunakan':
      return Colors.red;
    case 'diperbaiki':
      return const Color.fromARGB(255, 0, 0, 0);
    default:
      return Colors.grey; // Warna default jika status tidak dikenali
  }
}

int getStatusPriority(String status) {
  switch (status.toLowerCase()) {
    case 'tersedia':
      return 0;
    case 'digunakan':
      return 1;
    case 'diperbaiki':
      return 2;
    default:
      return 3; // Mengembalikan nilai tinggi untuk status tidak dikenali
  }
}
