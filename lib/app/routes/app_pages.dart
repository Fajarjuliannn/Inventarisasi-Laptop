import 'package:get/get.dart';

import '../modules/about/bindings/about_binding.dart';
import '../modules/about/views/about_view.dart';
import '../modules/asset/bindings/asset_binding.dart';
import '../modules/asset/views/asset_view.dart';
import '../modules/contact/bindings/contact_binding.dart';
import '../modules/contact/views/contact_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/inbox/bindings/inbox_binding.dart';
import '../modules/inbox/views/inbox_view.dart';
import '../modules/kirim_pesan/bindings/kirim_pesan_binding.dart';
import '../modules/kirim_pesan/views/kirim_pesan_view.dart';
import '../modules/kontak_masuk_admin/bindings/kontak_masuk_admin_binding.dart';
import '../modules/kontak_masuk_admin/views/kontak_masuk_admin_view.dart';
import '../modules/laporan/bindings/laporan_binding.dart';
import '../modules/laporan/views/laporan_view.dart';
import '../modules/laporan_lainnya/bindings/laporan_lainnya_binding.dart';
import '../modules/laporan_lainnya/views/laporan_lainnya_view.dart';
import '../modules/laporan_penggunaan/bindings/laporan_penggunaan_binding.dart';
import '../modules/laporan_penggunaan/views/laporan_penggunaan_view.dart';
import '../modules/laporan_permintaan/bindings/laporan_permintaan_binding.dart';
import '../modules/laporan_permintaan/views/laporan_permintaan_view.dart';
import '../modules/list_pesan/bindings/list_pesan_binding.dart';
import '../modules/list_pesan/views/list_pesan_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/onboard/bindings/onboard_binding.dart';
import '../modules/onboard/views/onboard_view.dart';
import '../modules/panduan/bindings/panduan_binding.dart';
import '../modules/panduan/views/panduan_view.dart';
import '../modules/pegawai/bindings/pegawai_binding.dart';
import '../modules/pegawai/views/pegawai_view.dart';
import '../modules/penggunaan/bindings/penggunaan_binding.dart';
import '../modules/penggunaan/views/penggunaan_view.dart';
import '../modules/penggunaan_user/bindings/penggunaan_user_binding.dart';
import '../modules/penggunaan_user/views/penggunaan_user_view.dart';
import '../modules/permintaan/bindings/permintaan_binding.dart';
import '../modules/permintaan/views/permintaan_view.dart';
import '../modules/permintaan_user/bindings/permintaan_user_binding.dart';
import '../modules/permintaan_user/views/permintaan_user_view.dart';
import '../modules/personalinfo/bindings/personalinfo_binding.dart';
import '../modules/personalinfo/views/personalinfo_view.dart';
import '../modules/regist/bindings/regist_binding.dart';
import '../modules/regist/views/regist_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';
import '../modules/user-dashboard/bindings/user_dashboard_binding.dart';
import '../modules/user-dashboard/views/user_dashboard_view.dart';
import '../modules/userdetail/bindings/userdetail_binding.dart';
import '../modules/userdetail/views/userdetail_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => const SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.INBOX,
      page: () => const InboxView(),
      binding: InboxBinding(),
    ),
    GetPage(
      name: _Paths.REGIST,
      page: () => const RegistView(),
      binding: RegistBinding(),
    ),
    GetPage(
      name: _Paths.ASSET,
      page: () => const AssetView(),
      binding: AssetBinding(),
    ),
    GetPage(
      name: _Paths.PEGAWAI,
      page: () => const PegawaiView(),
      binding: PegawaiBinding(),
    ),
    GetPage(
      name: _Paths.PERMINTAAN,
      page: () => const PermintaanView(),
      binding: PermintaanBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN,
      page: () => const LaporanView(),
      binding: LaporanBinding(),
    ),
    GetPage(
      name: _Paths.USER_DASHBOARD,
      page: () => const UserDashboardView(),
      binding: UserDashboardBinding(),
    ),
    GetPage(
      name: _Paths.USERDETAIL,
      page: () => const UserdetailView(),
      binding: UserdetailBinding(),
    ),
    GetPage(
      name: _Paths.PERSONALINFO,
      page: () => const PersonalinfoView(),
      binding: PersonalinfoBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.PENGGUNAAN,
      page: () => const PenggunaanView(),
      binding: PenggunaanBinding(),
    ),
    GetPage(
      name: _Paths.PERMINTAAN_USER,
      page: () => const PermintaanUserView(),
      binding: PermintaanUserBinding(),
    ),
    GetPage(
      name: _Paths.PENGGUNAAN_USER,
      page: () => const PenggunaanUserView(),
      binding: PenggunaanUserBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.PANDUAN,
      page: () => const PanduanView(),
      binding: PanduanBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARD,
      page: () => const OnboardView(),
      binding: OnboardBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT,
      page: () => const ContactView(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN_PERMINTAAN,
      page: () => const LaporanPermintaanView(),
      binding: LaporanPermintaanBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN_PENGGUNAAN,
      page: () => const LaporanPenggunaanView(),
      binding: LaporanPenggunaanBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN_LAINNYA,
      page: () => const LaporanLainnyaView(),
      binding: LaporanLainnyaBinding(),
    ),
    GetPage(
      name: _Paths.KONTAK_MASUK_ADMIN,
      page: () => const KontakMasukAdminView(),
      binding: KontakMasukAdminBinding(),
    ),
    GetPage(
      name: _Paths.KIRIM_PESAN,
      page: () => const KirimPesanView(),
      binding: KirimPesanBinding(),
    ),
    GetPage(
      name: _Paths.LIST_PESAN,
      page: () => const ListPesanView(),
      binding: ListPesanBinding(),
    ),
  ];
}
