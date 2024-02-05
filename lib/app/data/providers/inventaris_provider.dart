import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:inventaris/app/data/session.dart';
import 'package:inventaris/app/modules/asset/model/asset_model.dart';
import 'package:inventaris/app/modules/dashboard/model/dashboard_model.dart';
import 'package:inventaris/app/modules/inbox/model/pesan_user_model.dart';
import 'package:inventaris/app/modules/inbox/model/terima_pesan_model.dart';
import 'package:inventaris/app/modules/kirim_pesan/model/kirim_pesan_model.dart';
import 'package:inventaris/app/modules/kontak_masuk_admin/model/kontak_masuk_admin_model.dart';
import 'package:inventaris/app/modules/laporan/model/laporan_model.dart';
import 'package:inventaris/app/modules/list_pesan/model/list_pesan_model.dart';
import 'package:inventaris/app/modules/pegawai/model/pegawai_model.dart';
import 'package:inventaris/app/modules/asset/model/permintaan_model.dart';
import 'package:inventaris/app/modules/penggunaan/model/kembalikan_model.dart';
import 'package:inventaris/app/modules/penggunaan/model/penggunaan_model.dart';
import 'package:inventaris/app/modules/penggunaan_user/model/penggunaan_user_model.dart';
import 'package:inventaris/app/modules/permintaan/model/list_permintaan_model.dart';
import 'package:inventaris/app/modules/permintaan/model/respon_admin_model.dart';
import 'package:inventaris/app/modules/permintaan_user/model/permintaan_user_model.dart';
import 'package:inventaris/app/modules/regist/model/regist_model.dart';
import 'package:inventaris/app/modules/signin/model/signin_model.dart';

class InventarisProvider extends GetConnect {
  final String baseUrl1 = 'http://10.0.2.2:8000/api';
  // final String baseUrl1 = 'http://172.24.10.99:8000/api';

    Future<CountModel> getCount() async {
    try {
      httpClient.baseUrl = baseUrl1;
      final response = await get(
        "/counts",
        
      ).timeout(const Duration(seconds: 30));

      //print(response.body.toString()); // Print the response for debugging

      if (response.statusCode == 200) {
        return CountModel.fromJson(response.body);
      
      } else {
        throw Exception("Failed to fetch data");
      }
    } on TimeoutException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  // login
  Future<LoginModel> login(String email, String password) async {
    try {
      httpClient.baseUrl = baseUrl1;

      Map<String, dynamic> loginForm = {'email': email, 'password': password};

      final formData = FormData(loginForm);

      final response =
          await post('/login', formData).timeout(const Duration(seconds: 30));

      var loginModel = LoginModel.fromJson(response.body);

      return loginModel;
    } on TimeoutException {
      Fluttertoast.showToast(msg: "Masalah Jaringan");
      rethrow;
    } catch (e) {
      Fluttertoast.showToast(msg: "Username/Password Salah");
      rethrow;
    }
  }

  Future<RegisterModel> register(
    String name,
    String email,
    String password,
    String noPegawai,
  ) async {
    try {
      httpClient.baseUrl = baseUrl1;

      Map<String, dynamic> registerData = {
        'name': name,
        'email': email,
        'password': password,
        'no_pegawai': noPegawai,
      };

      final formData = FormData(registerData);

      final response = await post(
        '/register', // Adjust the endpoint based on your API
        formData,
      ).timeout(const Duration(seconds: 30));

      var registerModel = RegisterModel.fromJson(response.body);

      return registerModel;
    } on TimeoutException {
      // Handle timeout error
      rethrow;
    } catch (e) {
      // Handle other errors
      rethrow;
    }
  }

  Future<List<UserDatum>> getDataUserr(String token) async {
    try {
      httpClient.baseUrl = baseUrl1;
      final response = await get(
        "/users",
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      //print(response.body.toString()); // Print the response for debugging

      if (response.statusCode == 200) {
        final List<dynamic> data = response.body['data'];
        return data.map((item) => UserDatum.fromJson(item)).toList();
      } else {
        throw Exception("Failed to fetch data");
      }
    } on TimeoutException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateUser(
      String token, int userId, Map<String, dynamic> userData) async {
    try {
      httpClient.baseUrl = baseUrl1;

      final response = await put(
        "/users/$userId", // Adjust the endpoint based on your API
        userData, // Include the URL as the first argument
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        // User data updated successfully
        Fluttertoast.showToast(msg: "User data updated successfully");
      } else {
        // Failed to update user data
        throw Exception("Failed to update user data");
      }
    } on TimeoutException {
      // Timeout error
      Fluttertoast.showToast(msg: "Timeout error");
      rethrow;
    } catch (e) {
      // Other errors
      Fluttertoast.showToast(msg: "Failed to update user data");
      rethrow;
    }
  }

  Future<LoginModel> updateUserr(
      String token, int userId, Map<String, dynamic> userData) async {
    try {
      httpClient.baseUrl = baseUrl1;

      final response = await put(
        "/users/$userId", // Adjust the endpoint based on your API
        userData, // Include the URL as the first argument
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        // User data updated successfully
        Fluttertoast.showToast(msg: "User data updated successfully");
        return LoginModel.fromJson(response.body);
      } else {
        // Failed to update user data
        throw Exception("Failed to update user data");
      }
    } on TimeoutException {
      // Timeout error
      Fluttertoast.showToast(msg: "Timeout error");
      rethrow;
    } catch (e) {
      // Other errors
      Fluttertoast.showToast(msg: "Failed to update user data");
      rethrow;
    }
  }

// DELETE USER
  Future<bool> deleteUserData(String token, int userId) async {
    try {
      httpClient.baseUrl = baseUrl1;

      final response = await delete(
        "/users/$userId", // Adjust the endpoint based on your API
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        return true;
      } else {
        Fluttertoast.showToast(msg: "Failed to delete user");
        return false;
      }
    } on TimeoutException {
      Fluttertoast.showToast(msg: "Request timeout");
      return false;
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed to delete user");
      return false;
    }
  }

  Future<void> updatePassword(
      String token, int userId, String oldPassword, String newPassword) async {
    try {
      httpClient.baseUrl = baseUrl1;

      final response = await put(
        "/users/$userId/editpass",
        '{"old_password": "$oldPassword", "password": "$newPassword"}',
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        // Password updated successfully
        Fluttertoast.showToast(msg: "Password updated successfully");
      } else if (response.statusCode == 401) {
        // Old password is incorrect
        Fluttertoast.showToast(msg: "Old password is incorrect");
      } else {
        // Failed to update password
        throw Exception("Failed to update password");
      }
    } on TimeoutException {
      // Timeout error
      Fluttertoast.showToast(msg: "Timeout error");
      rethrow;
    } catch (e) {
      // Other errors
      Fluttertoast.showToast(msg: "Failed to update password");
      rethrow;
    }
  }

  // DATA LAPTOP

  //ambil data laptop
  Future<List<Datum>> getDataLaptopp(String token) async {
    try {
      httpClient.baseUrl = baseUrl1;
      final response = await get(
        "/laptops",
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      //print(response.body.toString()); // Print the response for debugging

      if (response.statusCode == 200) {
        final List<dynamic> data = response.body['data'];
        return data.map((item) => Datum.fromJson(item)).toList();
      } else {
        throw Exception("Failed to fetch data");
      }
    } on TimeoutException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  //bikin laptop baru
  Future<bool> createLaptop(String token, Map<String, dynamic> newData) async {
    try {
      httpClient.baseUrl = baseUrl1;

      final response = await post(
        "/laptops", // Sesuaikan dengan endpoint API untuk create laptop
        newData,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        return true;
      } else {
        Fluttertoast.showToast(
            msg: "Failed to create laptop: ${response.statusText}");
        return false;
      }
    } on TimeoutException {
      Fluttertoast.showToast(msg: "Request timeout");
      return false;
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed to create laptop: $e");
      return false;
    }
  }

  //perbarui laptop
  Future<bool> updateLaptop(
      String token, int laptopId, Map<String, dynamic> updatedData) async {
    try {
      httpClient.baseUrl = baseUrl1;

      final response = await put(
        "/laptops/$laptopId", // Adjust the endpoint based on your API
        updatedData,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        Get.snackbar(
          'Success',
          'Laptop data updated successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        return true;
      } else {
        Fluttertoast.showToast(msg: "Failed to update laptop");
        return false;
      }
    } on TimeoutException {
      Fluttertoast.showToast(msg: "Request timeout");
      return false;
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed to update laptop");
      return false;
    }
  }

  //hapus laptop
  Future<bool> deleteLaptop(String token, int laptopId) async {
    try {
      httpClient.baseUrl = baseUrl1;

      final response = await delete(
        "/laptops/$laptopId", // Sesuaikan dengan endpoint API untuk delete laptop
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        return true;
      } else {
        Fluttertoast.showToast(msg: "Failed to delete laptop");
        return false;
      }
    } on TimeoutException {
      Fluttertoast.showToast(msg: "Request timeout");
      return false;
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed to delete laptop");
      return false;
    }
  }

  Future<List<PermintaanListDatum>> getDataPermintaan(String token) async {
    try {
      httpClient.baseUrl = baseUrl1;
      final response = await get(
        "/permintaan",
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      //print(response.body.toString()); // Print the response for debugging

      if (response.statusCode == 200) {
        final List<dynamic> data = response.body['data'];
        return data.map((item) => PermintaanListDatum.fromJson(item)).toList();
      } else {
        throw Exception("Failed to fetch data");
      }
    } on TimeoutException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<PermintaanModel> requestLaptop(String token, int idLaptop,
      {String status = 'proses'}) async {
    try {
      httpClient.baseUrl = baseUrl1;

      final response = await post(
        "/permintaan/$idLaptop",
        {'status': status},
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        return PermintaanModel.fromJson(response.body);
      } else {
        throw Exception("Failed to request laptop");
      }
    } on TimeoutException {
      Fluttertoast.showToast(msg: "Request timeout");
      rethrow;
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed to request laptop");
      rethrow;
    }
  }

  Future<ResponAdminModel> acceptRequest(String token, int idPermintaan) async {
    try {
      httpClient.baseUrl = baseUrl1;

      final response = await post(
        "/accept/$idPermintaan",
        {},
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        return ResponAdminModel.fromJson(response.body);
      } else {
        // If the request fails, throw an exception with an error message
        throw Exception("Failed to accept laptop request");
      }
    } on TimeoutException {
      // Handle timeout error
      throw Exception("Request timeout");
    } catch (e) {
      // Handle other errors
      throw Exception("Failed to accept laptop request: $e");
    }
  }

  Future<ResponAdminModel> rejectRequest(String token, int idPermintaan) async {
    try {
      httpClient.baseUrl = baseUrl1;

      final response = await post(
        "/reject/$idPermintaan",
        {},
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        // If the request is successful, return a PermintaanModel
        return ResponAdminModel.fromJson(response.body);
      } else {
        // If the request fails, throw an exception with an error message
        throw Exception("Failed to reject laptop request");
      }
    } on TimeoutException {
      // Handle timeout error
      throw Exception("Request timeout");
    } catch (e) {
      // Handle other errors
      throw Exception("Failed to reject laptop request: $e");
    }
  }

  Future<PermintaanUserModel> getPermintaanUser(int userId) async {
    try {
      httpClient.baseUrl = baseUrl1;

      final session = Get.find<mySession>();
      final token = session.session.data?.token.toString();

      final response = await get(
        "/permintaanUser?userId=$userId",
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        return PermintaanUserModel.fromJson(response.body);
      } else {
        throw Exception("Failed to fetch data");
      }
    } on TimeoutException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<PenggunaanUserModel> getPenggunaanUser(int userId) async {
    try {
      httpClient.baseUrl = baseUrl1;

      final session = Get.find<mySession>();
      final token = session.session.data?.token.toString();

      final response = await get(
        "/penggunaanUser?userId=$userId",
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        return PenggunaanUserModel.fromJson(response.body);
      } else {
        throw Exception("Failed to fetch data");
      }
    } on TimeoutException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<PenggunaanDatum>> getDataPenggunaan(String token) async {
    try {
      httpClient.baseUrl = baseUrl1;
      final response = await get(
        "/penggunaan",
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      //print(response.body.toString()); // Print the response for debugging

      if (response.statusCode == 200) {
        final List<dynamic> data = response.body['data'];
        return data.map((item) => PenggunaanDatum.fromJson(item)).toList();
      } else {
        throw Exception("Failed to fetch data");
      }
    } on TimeoutException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<KembalikanModel> kembalikanLaptop(
      String token, int idPenggunaan) async {
    try {
      httpClient.baseUrl = baseUrl1;

      final response = await put(
        "/kembalikan/$idPenggunaan",
        {},
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        return KembalikanModel.fromJson(response.body);
      } else {
        throw Exception("Failed to return laptop");
      }
    } on TimeoutException {
      Fluttertoast.showToast(msg: "Request timeout");
      rethrow;
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed to return laptop");
      rethrow;
    }
  }

  Future<LaporanModel> createPermintaanLaporan(String token, String isi) async {
    try {
      httpClient.baseUrl = baseUrl1;

      final session = Get.find<mySession>();
      final userId = session.session.data?.id.toString();

      final response = await post(
        "/laporan/permintaan",
        {'isi': isi, 'user_id': userId},
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        return LaporanModel.fromJson(response.body);
      } else {
        throw Exception("Failed to create permintaan laporan");
      }
    } on TimeoutException {
      Fluttertoast.showToast(msg: "Request timeout");
      rethrow;
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed to create permintaan laporan");
      rethrow;
    }
  }

  Future<LaporanModel> createPenggunaanLaporan(String token, String isi) async {
    try {
      httpClient.baseUrl = baseUrl1;

      final session = Get.find<mySession>();
      final userId = session.session.data?.id.toString();

      final response = await post(
        "/laporan/penggunaan",
        {'isi': isi, 'user_id': userId},
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        return LaporanModel.fromJson(response.body);
      } else {
        throw Exception("Failed to create permintaan laporan");
      }
    } on TimeoutException {
      Fluttertoast.showToast(msg: "Request timeout");
      rethrow;
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed to create permintaan laporan");
      rethrow;
    }
  }

  Future<LaporanModel> createLainnyaLaporan(String token, String isi) async {
    try {
      httpClient.baseUrl = baseUrl1;

      final session = Get.find<mySession>();
      final userId = session.session.data?.id.toString();

      final response = await post(
        "/laporan/lainnya",
        {'isi': isi, 'user_id': userId},
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        return LaporanModel.fromJson(response.body);
      } else {
        throw Exception("Failed to create permintaan laporan");
      }
    } on TimeoutException {
      Fluttertoast.showToast(msg: "Request timeout");
      rethrow;
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed to create permintaan laporan");
      rethrow;
    }
  }

  Future<List<AllLaporanDatum>> getDataLaporan(String token) async {
    try {
      httpClient.baseUrl = baseUrl1;
      final response = await get(
        "/laporan",
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      //print(response.body.toString()); // Print the response for debugging

      if (response.statusCode == 200) {
        final List<dynamic> data = response.body['data'];
        return data.map((item) => AllLaporanDatum.fromJson(item)).toList();
      } else {
        throw Exception("Failed to fetch data");
      }
    } on TimeoutException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<LaporanModel> markLaporanSelesai(String token, int laporanId) async {
    try {
      httpClient.baseUrl = baseUrl1;

      final response = await put(
        "/selesai/$laporanId",
        {}, // You may pass any additional data if needed
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        return LaporanModel.fromJson(response.body);
      } else {
        throw Exception("Failed to mark laporan as selesai");
      }
    } on TimeoutException {
      Fluttertoast.showToast(msg: "Request timeout");
      rethrow;
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed to mark laporan as selesai");
      rethrow;
    }
  }

  Future<KirimPesanModel> kirimPesan(
      String token, int receiverId, String content) async {
    try {
      httpClient.baseUrl = baseUrl1;

      final response = await post(
        "/kirimPesan/$receiverId",
        {
          'content': content,
        },
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        return KirimPesanModel.fromJson(response.body);
      } else {
        throw Exception("Failed to send message");
      }
    } on TimeoutException {
      Fluttertoast.showToast(msg: "Request timeout");
      rethrow;
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed to send message");
      rethrow;
    }
  }

  Future<List<PesanUserDatum>> getDataPesanUser(String token) async {
    try {
      httpClient.baseUrl = baseUrl1;
      final response = await get(
        "/lihatpesan",
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final List<dynamic> data = response.body['data'];
        return data.map((item) => PesanUserDatum.fromJson(item)).toList();
      } else {
        throw Exception('Failed to fetch messages');
      }
    } on TimeoutException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<TerimaPesanModel> terimaPesan(String token, int pesanId) async {
    try {
      httpClient.baseUrl = baseUrl1;
      final response = await put(
        "/terima/$pesanId",
        {},
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        return TerimaPesanModel.fromJson(response.body);
      } else {
        // If the request fails, throw an exception with an error message
        throw Exception("Failed to update pesan status to diterima");
      }
    } on TimeoutException {
      // Handle timeout error
      rethrow;
    } catch (e) {
      // Handle other errors
      rethrow;
    }
  }

  Future<List<ListPesanDatum>> getListPesan(String token) async {
    try {
      httpClient.baseUrl = baseUrl1;

      final response = await get(
        "/pesan",
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final List<dynamic> data = response.body['data'];
        return data.map((item) => ListPesanDatum.fromJson(item)).toList();
      } else {
        throw Exception("Failed to fetch messages");
      }
    } on TimeoutException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<LoginModel> getDataSession(String idUser) async {
    try {
      httpClient.baseUrl = baseUrl1;
      final response = await get(
        "/ceksession/$idUser",
        
      ).timeout(const Duration(seconds: 30));

      //print(response.body.toString()); // Print the response for debugging

      if (response.statusCode == 200) {
        return LoginModel.fromJson(response.body);
      
      } else {
        throw Exception("Failed to fetch data");
      }
    } on TimeoutException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }
}
