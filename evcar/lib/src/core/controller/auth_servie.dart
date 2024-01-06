import 'package:evcar/src/feature/login/repostiory/login_repository.dart';
import 'package:evcar/src/feature/register/repository/register_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthsSrvice extends GetxController {
  static AuthsSrvice get instance => Get.find();
  final RxString token = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadToken();
  }

  clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('LoginToken');
    prefs.remove('token');
    token.value = '';
  }

  loadToken() async {
    if (RegisterRepository().token.value.isEmpty) {
      token.value = RegisterRepository.instance.token.value;
      update();
    } else {
      token.value = LoginRepository.instance.token.value;
      update();
    }
  }
}
