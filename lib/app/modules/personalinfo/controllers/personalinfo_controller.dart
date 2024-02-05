import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:inventaris/app/data/session.dart';

class PersonalinfoController extends GetxController {
  final mySession session = Get.find<mySession>();

  String get userId => session.session.data?.id.toString() ?? 'Unknown';
  String get userName => session.session.data?.name ?? 'Unknown';
  String get userNoPegawai => session.session.data?.noPegawai ?? 'Unknown';
  String get userEmail => session.session.data?.email ?? 'Unknown';
  String get userPassword => session.session.data?.role ?? 'Unknown';
  String get userUpdateAt => session.session.data?.updatedAt ?? 'Unknown';

  DateTime? get userJoinAtDateTime {
    // Parse the createdAt string into DateTime
    return DateTime.tryParse(session.session.data?.createdAt ?? '');
  }

  String get formattedJoinDate {
    // Format the DateTime into your desired format
    return DateFormat('dd MMMM yyyy').format(userJoinAtDateTime ?? DateTime.now());
  }
}
