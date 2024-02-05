import 'package:get/get.dart';
import 'package:inventaris/app/data/providers/inventaris_provider.dart';
import 'package:inventaris/app/data/session.dart';
import 'package:inventaris/app/modules/list_pesan/model/list_pesan_model.dart';

class ListPesanController extends GetxController {
  InventarisProvider provider = Get.put(InventarisProvider());
  mySession session = Get.put(mySession());

  var isLoading = false.obs;
  var listPesan= <ListPesanDatum>[].obs;



  fetchDataUserr() async {
    try {
      var token = session.session.data?.token.toString();
      if (token != null) {
        var response = await provider.getListPesan(token);
        listPesan.assignAll(response);
      } else {
        // print("Error: Token is null");
      }
    } catch (e) {
      // print("Error fetching data: $e");
      // Get.snackbar('Error', 'Data not found', colorText: Colors.red);
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchDataUserr();
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
