import 'package:get_storage/get_storage.dart';
import 'package:inventaris/app/modules/signin/model/signin_model.dart';

// ignore: camel_case_types
class mySession {
  final box = GetStorage();

  LoginModel get session {
    if (box.read('loginSession') != null) {
      return LoginModel.fromJson(box.read('loginSession'));
    } else {
      return LoginModel(
        success: false,
        message: '',
        data: null,
      );
    }
  }

  set session(LoginModel? loginModel) {
    // String? token = session.data?.token;

    // if (loginModel != null && token != null) {
    //   box.write('loginSession', loginModel.toJson());
    // }

    box.write('loginSession', loginModel?.toJson());
  }

//   set session(LoginModel? loginModel) {
//     print("=========");
//   String? existingToken = box.read('loginSession')?.data?.token;
//   String? newToken = loginModel?.data?.token;

//   print(existingToken);
//   print(newToken);

//   // Jika token baru tidak null dan tidak sama dengan token yang ada, update session
//   // if (existingToken != null && newToken == "kosong") {
//   //   print("ini");
//   //   loginModel?.data?.token = existingToken!;
//   //   box.write('loginSession', loginModel?.toJson());

//   // }else{
//   //   print("itu");
//   //   box.write('loginSession', loginModel?.toJson());

//   // }
//   box.write('loginSession', loginModel?.toJson());
// }

  bool get isLoggedIn => box.read('loginSession') != null;

  void logout() {
    box.remove('loginSession');
  }
}
