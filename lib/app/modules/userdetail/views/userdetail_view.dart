import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../controllers/userdetail_controller.dart';

class UserdetailView extends GetView<UserdetailController> {
  const UserdetailView({super.key});

  @override
  Widget build(BuildContext context) {
    var noPegawai = controller.session.session.data?.noPegawai;
    var name = controller.session.session.data?.name;
    var email = controller.session.session.data?.email;
    controller.noPegawaiC.text = noPegawai ?? "";
    controller.nameC.text = name ?? "";
    controller.emailC.text = email ?? "";

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
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Text(
                  'User Profile',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  // Handle image tap action
                },
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/images/profile-dashboard.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0xFF23B0B0).withOpacity(0.7),
                      ),
                      child: const Icon(
                        LineAwesomeIcons.camera,
                        size: 18.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Form(
                child: Column(
                  children: [
                    _buildTextField(
                      controller.noPegawaiC,
                      'Employee ID',
                      LineAwesomeIcons.bell,
                    ),
                    const SizedBox(height: 15),
                    _buildTextField(
                      controller.nameC,
                      'Full Name',
                      Icons.person_outline_rounded,
                    ),
                    const SizedBox(height: 15),
                    _buildTextField(
                      controller.emailC,
                      'Email Address',
                      Icons.email_outlined,
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () async {
                          await controller.updateUserData(
                            controller.getUserId(),
                            {
                              'no_pegawai': controller.noPegawaiC.text,
                              'name': controller.nameC.text,
                              'email': controller.emailC.text,
                            },
                          ).then((value) {
                            controller.fetchDataSession();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF23B0B0),
                          shape: const StadiumBorder(),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            "Edit Profile",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        prefixIcon: Icon(icon),
      ),
    );
  }
}
