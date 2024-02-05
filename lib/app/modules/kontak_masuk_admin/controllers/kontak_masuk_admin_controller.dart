import 'package:get/get.dart';
import 'package:inventaris/app/data/providers/inventaris_provider.dart';
import 'package:inventaris/app/data/session.dart';
import 'package:inventaris/app/modules/kontak_masuk_admin/model/kontak_masuk_admin_model.dart';
import 'package:lottie/lottie.dart';

class KontakMasukAdminController extends GetxController {
  InventarisProvider provider = InventarisProvider();
  mySession session = Get.put(mySession());

  var isLoading = false.obs;
  var allLaporanList = <AllLaporanDatum>[].obs;

  fetchDataLaporan() async {
    try {
      var token = session.session.data?.token.toString();
      if (token != null) {
        var response = await provider.getDataLaporan(token);
        isLoading.value = true;
        allLaporanList.assignAll(response);
      } else {
        // Handle the case where the token is null
        // print("Error: Token is null");
      }
    } catch (e) {
      // Handle the error during data fetching
      // print("Error fetching data: $e");
      Lottie.asset("animation/notfound.json");
    }
  }

  markLaporanSelesai(int laporanId) async {
    try {
      var token = session.session.data?.token.toString();
      if (token != null) {
        // Call the method from the provider to mark laporan as selesai
        await provider.markLaporanSelesai(token, laporanId);

        // After marking laporan as selesai, refresh the laporan list
        fetchDataLaporan();
      } else {
        // Handle the case where the token is null
        // print("Error: Token is null");
      }
    } catch (e) {
      // Handle the error during marking laporan as selesai
      // print("Error marking laporan as selesai: $e");
    }
  }

  @override
  void onInit() {
    fetchDataLaporan();
    super.onInit();
  }
}
