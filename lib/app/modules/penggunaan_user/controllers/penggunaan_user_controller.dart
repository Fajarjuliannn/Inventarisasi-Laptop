import 'package:get/get.dart';
import 'package:inventaris/app/data/providers/inventaris_provider.dart';
import 'package:inventaris/app/data/session.dart';
import 'package:inventaris/app/modules/penggunaan_user/model/penggunaan_user_model.dart';

class PenggunaanUserController extends GetxController {
  InventarisProvider provider = InventarisProvider();
  mySession session = Get.find<mySession>();

  var isLoading = false.obs;
  var listPenggunaanUser = <PenggunaanUserDatum>[].obs;

fetchDataPenggunaanUser() async {
    try {
      final userId = session.session.data?.id;
      if (userId != null) {
        var response = await provider.getPenggunaanUser(userId);
        listPenggunaanUser.assignAll(response.data);
      } else {
        // Handle case when user ID is null
      }
    } catch (e) {
      // Handle error
    }
  }

  


  @override
  void onInit() {
    fetchDataPenggunaanUser();
    super.onInit();
  }
}
