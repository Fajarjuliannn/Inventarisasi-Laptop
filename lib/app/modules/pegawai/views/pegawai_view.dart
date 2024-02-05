import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventaris/app/modules/pegawai/model/pegawai_model.dart';
import 'package:inventaris/app/routes/app_pages.dart';
import 'package:lottie/lottie.dart';

import '../controllers/pegawai_controller.dart';

class PegawaiView extends GetView<PegawaiController> {
  // ignore: use_key_in_widget_constructors
  const PegawaiView({Key? key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(Routes.HOME);

        return false;
      },
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
            'Users',
            style: TextStyle(
              color: Color(0xFF22215B),
            ),
          ),
          centerTitle: true,
        ),
        body: Obx(() {
          if (controller.listUser.isEmpty) {
            // Tampilkan animasi Lottie jika data tidak ditemukan
            return Center(
              child: Lottie.asset(
                'animation/notfound.json', // Sesuaikan dengan path animasi Lottie Anda
                width: 400,
                height: 400,
                fit: BoxFit.fill,
              ),
            );
          }
    
          return ListView.builder(
            itemCount: controller.listUser.length,
            itemBuilder: (context, index) {
              if (controller.listUser[index].role.toLowerCase() != 'admin') {
                Color color = Colors.black;
    
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.horizontal, // Allow both directions
                  confirmDismiss: (direction) async {
                    // Show a confirmation dialog for deletion
                    if (direction == DismissDirection.endToStart) {
                      bool? confirmDelete = await Get.dialog<bool>(
                        AlertDialog(
                          title: const Text(
                            'Confirm Deletion',
                            style: TextStyle(
                              color: Colors
                                  .red, // Sesuaikan dengan warna yang diinginkan
                            ),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Are you sure you want to delete this user?',
                                style: TextStyle(
                                  color: Colors
                                      .black, // Sesuaikan dengan warna yang diinginkan
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Get.back(result: false);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey[
                                          300], // Sesuaikan dengan warna yang diinginkan
                                    ),
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Get.back(result: true);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors
                                          .red, // Sesuaikan dengan warna yang diinginkan
                                    ),
                                    child: const Text(
                                      'Delete',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
    
                      return confirmDelete ?? false;
                    } else if (direction == DismissDirection.startToEnd) {
                      // Show a dialog for editing password
                      _showEditPasswordDialog(
                          controller.listUser[index], controller);
                      return false; // Do not allow immediate dismissal
                    }
    
                    return false;
                  },
                  onDismissed: (direction) async {
                    if (direction == DismissDirection.endToStart) {
                      // Delete user
                      await controller
                          .deleteUserData(controller.listUser[index].id);
                    }
                  },
                  background: Container(
                    alignment: Alignment.centerLeft,
                    color: Colors.blue, // Background color for password edit
                    child: const Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                  ),
                  secondaryBackground: Container(
                    alignment: Alignment.centerRight,
                    color: Colors.red, // Background color for deletion
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 3.0, horizontal: 8.0),
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/profile-dashboard.png"),
                      ),
                      title: Text(
                        controller.listUser[index].name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: color,
                        ),
                      ),
                      subtitle: Text(
                        controller.listUser[index].noPegawai,
                        style: TextStyle(
                          fontSize: 12,
                          color: color,
                        ),
                      ),
                      onTap: () {
                        if (controller.listUser[index].role.toLowerCase() ==
                            'admin') {
                          Get.snackbar(
                              'Permission Denied', 'Admins cannot be updated.');
                        } else {
                          _showUpdateDialog(controller.listUser[index]);
                        }
                      },
                    ),
                  ),
                );
              } else {
                return Container();
              }
            },
          );
        }),
      ),
    );
  }

  void _showUpdateDialog(UserDatum user) {
    TextEditingController noPegawaiController =
        TextEditingController(text: user.noPegawai);
    TextEditingController nameController =
        TextEditingController(text: user.name);
    TextEditingController emailController =
        TextEditingController(text: user.email);

    Get.defaultDialog(
      title: '',
      content: Container(
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
            TextField(
              controller: noPegawaiController,
              decoration: InputDecoration(
                labelText: 'No Pegawai',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back(); // Tutup dialog
          },
          child: const Text(
            'Cancel',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            controller.updateUserData(
              user.id,
              {
                'no_pegawai': noPegawaiController.text,
                'name': nameController.text,
                'email': emailController.text,
              },
            );
            Get.back(); // Tutup dialog
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                Colors.blue, // Sesuaikan dengan warna yang diinginkan
          ),
          child: const Text(
            'Update',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
      barrierDismissible: false,
      backgroundColor: Colors.transparent,
    );
  }

  void _showEditPasswordDialog(UserDatum user, PegawaiController controller) {
    TextEditingController oldPasswordController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    Get.defaultDialog(
      title: 'Change Password', // Add a title to the dialog
      content: Container(
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
            // Old Password TextField
            TextField(
              controller: oldPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Old Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // New Password TextField
            TextField(
              controller: newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'New Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Confirm Password TextField
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      actions: [
        // Cancel Button
        TextButton(
          onPressed: () {
            Get.back(); // Close the dialog
          },
          child: const Text('Cancel'),
        ),
        // Reset Button
        ElevatedButton(
          onPressed: () {
            // Check if passwords match
            if (newPasswordController.text != confirmPasswordController.text) {
              Get.snackbar('Error', 'Passwords do not match',
                  snackPosition: SnackPosition.BOTTOM);
            } else {
              // Call the updatePassword function
              controller.updatePassword(
                user.id,
                oldPasswordController.text,
                newPasswordController.text,
              );
              Get.back(); // Close the dialog
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Set the button's background color
          ),
          child: const Text('Reset'),
        ),
      ],
      barrierDismissible: false,
      backgroundColor: Colors.transparent,
    );
  }
}
