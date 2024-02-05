import 'package:get/get.dart';
import 'package:inventaris/app/data/providers/inventaris_provider.dart';
import 'package:inventaris/app/data/session.dart';
import 'package:inventaris/app/modules/dashboard/model/dashboard_model.dart';

class DashboardController extends GetxController {
  InventarisProvider provider = InventarisProvider();
  mySession session = Get.put(mySession());

  var listCount = <CountModel>[].obs;

  final count = 0.obs;

  Future<void> fetchDataCount() async {
    try {
      var response = await provider.getCount();
      listCount.assignAll(
          [response]); // Assuming CountModel is a single item, not a list
      count.value = response.data
          .assetsCount; // Adjust accordingly based on the structure of CountModel
      count.value = response.data
          .usersCount; // Adjust accordingly based on the structure of CountModel
      count.value = response.data
          .permintaansCount; // Adjust accordingly based on the structure of CountModel
      count.value = response.data
          .penggunaansCount; // Adjust accordingly based on the structure of CountModel
    } catch (e) {
      // Handle error, you can show a snackbar or any other error handling mechanism
      // print("Error fetching data: $e");
    }
  }

  @override
  void onInit() {
    fetchDataCount();
    super.onInit();
  }
}
