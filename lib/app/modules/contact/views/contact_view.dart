import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';

import '../controllers/contact_controller.dart';

class ContactView extends GetView<ContactController> {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                Get.back(); // Kembali ke halaman sebelumnya
              },
              icon: const Icon(Icons.close),
              iconSize: 30,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Perlu Bantuan?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF23B0B0),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Silakan pilih salah satu opsi di bawah ini',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                Card(
                  elevation: 5.0,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: const Icon(Icons.headset_mic_rounded,
                        color: Color(0xFF23B0B0)),
                    title: const Text(
                      'Hubungi VentoLaps Call Center',
                      style: TextStyle(
                        color: Color(0xFF23B0B0),
                      ),
                    ),
                    tileColor: Colors.white,
                    onTap: () async {
                      final Uri launchUri = Uri(
                        scheme: 'tel',
                        path: '082210398227',
                      );
                      // ignore: deprecated_member_use
                      await launch(launchUri.toString());
                    },
                  ),
                ),
                Card(
                  elevation: 5.0,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading:
                        const Icon(Icons.whatshot, color: Color(0xFF23B0B0)),
                    title: const Text(
                      'WhatsApp',
                      style: TextStyle(
                        color: Color(0xFF23B0B0),
                      ),
                    ),
                    tileColor: Colors.white,
                    onTap: () async {
                      // ignore: deprecated_member_use
                      await launch('https://wa.me/6282210398227?');
                    },
                  ),
                ),
                Card(
                  elevation: 5.0,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: const Icon(Icons.info, color: Color(0xFF23B0B0)),
                    title: const Text(
                      'Email',
                      style: TextStyle(
                        color: Color(0xFF23B0B0),
                      ),
                    ),
                    tileColor: Colors.white,
                    onTap: () {
                      String? bebas(Map<String, String> params) {
                        return params.entries
                            .map((MapEntry<String, String> e) =>
                                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                            .join('&');
                      }

                      final Uri emailLaunchUrl = Uri(
                        scheme: 'mailto',
                        path: 'fajarreal2@gmail.com',
                        query: bebas(<String, String>{
                          'body': "",
                        }),
                      );
                      launchUrl(emailLaunchUrl);
                    },
                  ),
                ),
                Card(
                  elevation: 5.0,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: const Icon(Icons.developer_board_off_rounded,
                        color: Color(0xFF23B0B0)),
                    title: const Text(
                      'Hapus Akun VentoLaps',
                      style: TextStyle(
                        color: Color(0xFF23B0B0),
                      ),
                    ),
                    tileColor: Colors.white,
                    onTap: () =>
                        Fluttertoast.showToast(msg: "feature not available"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
