import 'package:get/get.dart';
import 'package:inventaris/app/data/providers/inventaris_provider.dart';
import 'package:inventaris/app/data/session.dart';
import 'package:lottie/lottie.dart';

class SettingsController extends GetxController {
  InventarisProvider provider = InventarisProvider(); // No need for Get.put in this case
   mySession session = Get.find<mySession>(); // Corrected the type name

  var nam = "".obs;

  Future<void> fetchDataSession() async {
    try {
      var value = await provider.getDataSession(session.session.data!.id.toString());
      session.session = value;

      // Handle the successful data fetch here
      nam.value = session.session.data?.noPegawai ?? ''; // Update 'nam' with the new value
    } catch (e) {
      // Handle errors here
      // print("Error fetching data: $e");
      Lottie.asset("animation/notfound.json");
    }
  }

  @override
  void onInit() {
    nam.value = session.session.data?.noPegawai ?? '';
    // fetchDataSession(); // Call fetchDataSession in onInit to fetch data when the controller is initialized
    super.onInit();
  }

  String get userNoPegawai => session.session.data?.noPegawai ?? 'Unknown';
  String get userName => session.session.data?.name ?? 'Unknown';
}
