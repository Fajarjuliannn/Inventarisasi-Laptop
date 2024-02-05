import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../controllers/personalinfo_controller.dart';

class PersonalinfoView extends GetView<PersonalinfoController> {
  const PersonalinfoView({super.key});
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
                    'Profile',
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
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "assets/images/profile-dashboard.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Change Profile Picture",
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: Color(0xFF23B0B0),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Profile Information",
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ProfileMenu(
                    title: 'Name',
                    value: controller.userName,
                    onPressed: () {},
                    icon: LineAwesomeIcons.angle_right,
                  ),
                  const SizedBox(height: 15),
                  ProfileMenu(
                    title: 'No. Pegawai',
                    value: controller.userNoPegawai,
                    onPressed: () {},
                    icon: LineAwesomeIcons.angle_right,
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    thickness: 0.5,
                    color: Color(0xFF23B0B0),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Personal Information",
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ProfileMenu(
                    title: 'User ID',
                    value: controller.userId,
                    onPressed: () {},
                    icon: LineAwesomeIcons.angle_right,
                  ),
                  const SizedBox(height: 15),
                  ProfileMenu(
                    title: 'Email',
                    value: controller.userEmail,
                    onPressed: () {},
                    icon: LineAwesomeIcons.angle_right,
                  ),
                  const SizedBox(height: 15),
                  ProfileMenu(
                    title: 'Phone Number',
                    value: '+62',
                    onPressed: () {},
                    icon: LineAwesomeIcons.angle_right,
                  ),
                  const SizedBox(height: 15),
                  ProfileMenu(
                    title: 'Gender',
                    value: 'L/P',
                    onPressed: () {},
                    icon: LineAwesomeIcons.angle_right,
                  ),
                  const SizedBox(height: 15),
                  ProfileMenu(
                    title: 'Join Date',
                    value: controller.formattedJoinDate,
                    onPressed: () {},
                    icon: LineAwesomeIcons.angle_right,
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    thickness: 0.5,
                    color: Color(0xFF23B0B0),
                  ),
                ],
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    'Close Profile',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Expanded(
            child: Icon(
              LineAwesomeIcons.angle_right,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}
