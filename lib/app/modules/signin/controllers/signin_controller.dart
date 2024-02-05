import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
import 'package:inventaris/app/data/providers/inventaris_provider.dart';
import 'package:inventaris/app/data/session.dart';
import 'package:inventaris/app/modules/signin/model/signin_model.dart';


class SigninController extends GetxController {
  InventarisProvider provider = Get.put(InventarisProvider());

  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  final formKey = GlobalKey<FormState>();
  //final session = Get.find<mySession>();
  mySession session = Get.put(mySession());

  RxBool isPasswordVisible = false.obs;

  Future<LoginModel> login(String email, String password)  async{
    return provider.login(email, password).then((value) {
      return value;
    });
  }

  void onLogin(int id) {
    
  }
}
