import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:inventaris/app/data/session.dart';

import 'app/routes/app_pages.dart';

void main() {
  Get.put(mySession()); 
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: Routes.SPLASHSCREEN,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
    ),
  );
}
