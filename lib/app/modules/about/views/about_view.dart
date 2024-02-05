import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({super.key});

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
                    'About',
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
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Lottie.asset('animation/about.json'),
                  const SizedBox(height: 20),
                  const Text(
                    "VentoLaps Application",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // height: Get.height,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      controller.toggleAboutAppDropdown();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Tentang Aplikasi',
                            style: TextStyle(fontSize: 18),
                          ),
                          Icon(
                            controller.isAboutAppDropdownVisible.value
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(thickness: 2),
                  Obx(
                    () => Visibility(
                      visible: controller.isAboutAppDropdownVisible.value,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            controller.selectedAboutAppContent.value,
                            style: const TextStyle(fontSize: 15),
                            textAlign:
                                TextAlign.justify, // Tambahkan properti ini
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.toggleAboutUsDropdown();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Tentang Kami',
                            style: TextStyle(fontSize: 18),
                          ),
                          Icon(
                            controller.isAboutUsDropdownVisible.value
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(thickness: 2),
                  Obx(
                    () => Visibility(
                      visible: controller.isAboutUsDropdownVisible.value,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            controller.selectedAboutUsContent.value,
                            style: const TextStyle(fontSize: 15),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.togglePolicyDropdown();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Kebijakan dan Privasi',
                            style: TextStyle(fontSize: 18),
                          ),
                          Icon(
                            controller.isPolicyDropdownVisible.value
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(thickness: 2),
                  Obx(
                    () => Visibility(
                      visible: controller.isPolicyDropdownVisible.value,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            controller.selectedPolicyContent.value,
                            style: const TextStyle(fontSize: 15),
                            textAlign: TextAlign.justify,
                          ),
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
    );
  }
}
