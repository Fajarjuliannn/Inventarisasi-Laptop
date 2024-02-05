// lib/modules/permintaan_user/controller/permintaan_user_controller.dart
import 'package:get/get.dart';
import 'package:inventaris/app/data/providers/inventaris_provider.dart';
import 'package:inventaris/app/data/session.dart';
import 'package:inventaris/app/modules/permintaan_user/model/permintaan_user_model.dart';

class PermintaanUserController extends GetxController {
  InventarisProvider provider = InventarisProvider();
  mySession session = Get.find<mySession>();

  var isLoading = false.obs;
  var listPermintaanUser = <PermintaanUserDatum>[].obs;

fetchDataPermintaanUser() async {
    try {
      final userId = session.session.data?.id;
      if (userId != null) {
        var response = await provider.getPermintaanUser(userId);
        listPermintaanUser.assignAll(response.data);
      } else {
        // Handle case when user ID is null
      }
    } catch (e) {
      // Handle error
    }
  }
  @override
  void onInit() {
    fetchDataPermintaanUser();
    super.onInit();
  }
}
