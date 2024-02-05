import 'package:get/get.dart';

class AboutController extends GetxController {
  var isAboutAppDropdownVisible = false.obs;
  var isAboutUsDropdownVisible = false.obs;
  var isPolicyDropdownVisible = false.obs;

  // Options for "Tentang Aplikasi"
  var aboutAppOptions = ['Tentang Aplikasi'];

  // Options for "Tentang Kami"
  var aboutUsOptions = ['Tentang Kami'];

  // Options for "Kebijakan dan Privasi"
  var policyOptions = ['Kebijakan dan Privasi'];

  // Selected values for "Tentang Aplikasi"
  var selectedAboutApp = 'Tentang Aplikasi'.obs;
  var selectedAboutAppContent = '"VentoLaps adalah aplikasi yang dapat meningkatkan efektivitas pengelolaan inventaris laptop Dinas Kominfo. Aplikasi ini diharapkan dapat mengatasi permasalahan pendataan manual dan mendukung keberlanjutan operasional dalam era teknologi informasi yang berkembang."'.obs;

  // Selected values for "Tentang Kami"
  var selectedAboutUs = 'Tentang Kami'.obs;
  var selectedAboutUsContent = '"Dalam pengembangan aplikasi inventaris laptop ini, seorang pengembang yang berdedikasi telah menyatukan keahlian dan kreativitasnya. Dengan ketekunan yang luar biasa, pengembang ini tidak hanya sekadar menciptakan sebuah aplikasi, tetapi juga merangkul visi untuk memudahkan pengelolaan inventaris laptop dengan efisien. Dari desain antarmuka yang menarik hingga implementasi fitur-fitur canggih, setiap aspek aplikasi ini mencerminkan komitmen dan keahlian yang dimiliki oleh pengembang tunggal ini. Dengan begitu, ia membuktikan bahwa satu individu pun mampu menciptakan solusi yang inovatif untuk memenuhi kebutuhan pengelolaan inventaris teknologi."'.obs;

  // Selected values for "Kebijakan dan Privasi"
  var selectedPolicy = 'Kebijakan dan Privasi'.obs;
  var selectedPolicyContent = '"Kebijakan dan Privasi Aplikasi Inventaris Laptop kami bertujuan untuk melindungi dan menjaga privasi setiap pengguna. Kami mengumpulkan informasi yang diperlukan hanya untuk keperluan internal dan pengembangan aplikasi, serta menjamin bahwa data yang dikumpulkan tidak akan disalahgunakan atau dibagikan kepada pihak ketiga tanpa izin. Kami berkomitmen untuk memberikan pengalaman pengguna yang aman dan terpercaya, serta senantiasa memperbarui kebijakan ini sesuai dengan perkembangan teknologi dan kebutuhan pengguna. Dengan menggunakan aplikasi ini, Anda menyetujui dan memahami kebijakan privasi kami."'.obs;

  // Toggle visibility of "Tentang Aplikasi" dropdown
  void toggleAboutAppDropdown() {
    isAboutAppDropdownVisible.toggle();
    isAboutUsDropdownVisible.value = false;
    isPolicyDropdownVisible.value = false;
  }

  // Toggle visibility of "Tentang Kami" dropdown
  void toggleAboutUsDropdown() {
    isAboutUsDropdownVisible.toggle();
    isAboutAppDropdownVisible.value = false;
    isPolicyDropdownVisible.value = false;
  }

  // Toggle visibility of "Kebijakan dan Privasi" dropdown
  void togglePolicyDropdown() {
    isPolicyDropdownVisible.toggle();
    isAboutAppDropdownVisible.value = false;
    isAboutUsDropdownVisible.value = false;
  }
}
