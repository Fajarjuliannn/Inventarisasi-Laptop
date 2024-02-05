import 'package:get/get.dart';
import 'package:inventaris/app/data/providers/inventaris_provider.dart';
import 'package:inventaris/app/data/session.dart';
import 'package:inventaris/app/modules/pegawai/model/pegawai_model.dart';


class PegawaiController extends GetxController {
  InventarisProvider provider = Get.put(InventarisProvider());
  mySession session = Get.put(mySession());

  var isLoading = false.obs;
  var listUser = <UserDatum>[].obs;

  bool isAdmin() {
    return session.session.data?.role == 'admin';
  }

  fetchDataUserr() async {
    try {
      var token = session.session.data?.token.toString();
      if (token != null) {
        var response = await provider.getDataUserr(token);
        isLoading.value = true;
        listUser.assignAll(response);
      } else {
        // print("Error: Token is null");
      }
    } catch (e) {
      // print("Error fetching data: $e");
      // Get.snackbar('Error', 'Data not found', colorText: Colors.red);
    }
  }

  Future<void> updateUserData(int userId, Map<String, dynamic> userData) async {
    isLoading.value = true;
    try {
      var token = session.session.data?.token.toString();
      if (token != null) {
        await provider.updateUser(token, userId, userData);
        // Optionally, you can refetch the updated data after a successful update
        fetchDataUserr();
      } else {
        // print("Error: Token is null");
      }
    } catch (e) {
      // print("Error updating user data: $e");
      Get.snackbar('Error', 'Failed to update user data');
    }
  }

  Future<void> deleteUserData(int userId) async {
    try {
      var token = session.session.data?.token.toString();
      if (token != null) {
        await provider.deleteUserData(token, userId);
        fetchDataUserr(); // Refresh data pegawai setelah berhasil dihapus
      } else {
        // print("Error: Token is null");
      }
    } catch (e) {
      // print("Error deleting data: $e");
      Get.snackbar('Error', 'Failed to delete data');
    }
  }

  Future<void> updatePassword(
      int userId, String oldPassword, String newPassword) async {
    isLoading.value = true;
    try {
      var token = session.session.data?.token.toString();
      if (token != null) {
        // You may want to include a check for old password validity on the server
        // before proceeding with the password update
        await provider.updatePassword(token, userId, oldPassword, newPassword);
        // Optionally, you can show a success message or perform other actions
        Get.snackbar('Success', 'Password updated successfully');
      } else {
        // print("Error: Token is null");
      }
    } catch (e) {
      // print("Error updating password: $e");
      Get.snackbar('Error', 'Failed to update password');
    } finally {
      isLoading.value = false;
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    fetchDataUserr();
    super.onInit();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  void increment() => count.value++;
}
