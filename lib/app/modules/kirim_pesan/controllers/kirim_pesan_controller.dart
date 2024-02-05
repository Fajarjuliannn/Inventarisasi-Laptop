import 'package:get/get.dart';
import 'package:inventaris/app/data/providers/inventaris_provider.dart';
import 'package:inventaris/app/data/session.dart';
import 'package:inventaris/app/modules/pegawai/model/pegawai_model.dart';

class KirimPesanController extends GetxController {
  InventarisProvider provider = Get.put(InventarisProvider());
  mySession session = Get.put(mySession());

  var isLoading = false.obs;
  var listUser = <UserDatum>[].obs;

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

  Future<void> kirimPesanToUser(int receiverId, String content) async {
    try {
      var token = session.session.data?.token.toString();
      if (token != null) {
        await provider.kirimPesan(token, receiverId, content);

        // Anda dapat menambahkan logika lain seperti menampilkan snackbar atau navigasi ke layar lain
      } else {
        // Handle the case where the token is null
      }
    } catch (e) {
      // Handle errors during sending a message
      // Anda dapat menambahkan logika lain seperti menampilkan snackbar atau pesan kesalahan
    }
  }

  @override
  void onInit() {
    fetchDataUserr();
    super.onInit();
  }
}
