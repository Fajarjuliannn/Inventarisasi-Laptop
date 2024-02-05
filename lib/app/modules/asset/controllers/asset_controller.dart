import 'package:get/get.dart';
import 'package:inventaris/app/data/providers/inventaris_provider.dart';
import 'package:inventaris/app/data/session.dart';
import 'package:inventaris/app/modules/asset/model/asset_model.dart';
import 'package:lottie/lottie.dart';

class AssetController extends GetxController {
  InventarisProvider provider = Get.put(InventarisProvider());
  mySession session = Get.put(mySession());

  var isLoading = false.obs;
  var listLaptop = <Datum>[].obs;

  bool isAdmin() {
    return session.session.data?.role == 'admin';
  }

  fetchDataKontak() async {
    try {
      var token = session.session.data?.token.toString();
      if (token != null) {
        var response = await provider.getDataLaptopp(token);
        isLoading.value = true;
        listLaptop.assignAll(response);
      } else {
        // print("Error: Token is null");
      }
    } catch (e) {
      // print("Error fetching data: $e");
      Lottie.asset("animation/notfound.json");
    }
  }

  Future<void> updateDataLaptop(
      int idLaptop, Map<String, dynamic> updatedData) async {
    try {
      var token = session.session.data?.token.toString();
      if (token != null) {
        await provider.updateLaptop(token, idLaptop, updatedData);
        fetchDataKontak(); // Refresh the data after updating
      } else {
        // print("Error: Token is null");
      }
    } catch (e) {
      // print("Error updating laptop data: $e");
      Get.snackbar('Error', 'Failed to update laptop data');
    }
  }

  Future<void> createDataLaptop(Map<String, dynamic> laptopData) async {
    try {
      var token = session.session.data?.token.toString();
      if (token != null) {
        var success = await provider.createLaptop(token, laptopData);
        if (success) {
          fetchDataKontak(); // Refresh data setelah membuat laptop baru
        }
      } else {
        // print("Error: Token is null");
      }
    } catch (e) {
      // print("Error creating data: $e");
      Get.snackbar('Error', 'Failed to create data');
    }
  }

  Future<void> deleteDataLaptop(int idLaptop) async {
    try {
      var token = session.session.data?.token.toString();
      if (token != null) {
        await provider.deleteLaptop(token, idLaptop);

        fetchDataKontak(); // Refresh data setelah menghapus laptop
      } else {
        // print("Error: Token is null");
      }
    } catch (e) {
      // print("Error deleting data: $e");
      Get.snackbar('Error', 'Failed to delete data');
    }
  }

  Future<void> requestLaptop(int idLaptop, {String status = 'proses'}) async {
    isLoading.value = true;
    try {
      var token = session.session.data?.token.toString();
      if (token != null) {
        await provider.requestLaptop(token, idLaptop, status: status);
        // Optionally, you can show a success message or perform other actions
        Get.snackbar('Success', 'Laptop request submitted successfully');
      } else {
        // print("Error: Token is null");
      }
    } catch (e) {
      // print("Error requesting laptop: $e");
      Get.snackbar('Error', 'Failed to request laptop');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    fetchDataKontak();
    super.onInit();
  }
}
