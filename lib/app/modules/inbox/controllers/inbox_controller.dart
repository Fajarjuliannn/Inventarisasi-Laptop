import 'package:get/get.dart';
import 'package:inventaris/app/data/providers/inventaris_provider.dart';
import 'package:inventaris/app/data/session.dart';
import 'package:inventaris/app/modules/inbox/model/pesan_user_model.dart';

class InboxController extends GetxController {
  InventarisProvider provider = InventarisProvider();
  mySession session = Get.find<mySession>();

  var isLoading = false.obs;
  var listPesanUser = <PesanUserDatum>[].obs;

  fetchDataPesanUser() async {
    try {
      final userId = session.session.data?.id;
      if (userId != null) {
        var response = await provider.getDataPesanUser(session.session.data!.token);
        listPesanUser.assignAll(response);
      } else {
        // Handle case when user ID is null
      }
    } catch (e) {
      // Handle error
    }
  }

  Future<void> terimaPesan(int pesanId) async {
    try {
      // Assuming you have access to the user's token
      final token = session.session.data?.token;
      if (token != null) {
        await provider.terimaPesan(token, pesanId);
        // After updating the status, you may want to refresh the data
        fetchDataPesanUser();
      } else {
        // Handle case when token is null
      }
    } catch (e) {
      // Handle error
    }
  }
  @override
  void onInit() {
    fetchDataPesanUser();
    super.onInit();
  }
}
