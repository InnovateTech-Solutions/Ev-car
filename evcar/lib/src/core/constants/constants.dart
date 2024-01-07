import 'package:evcar/src/feature/login/view/widget/login_widget.dart';
import 'package:evcar/src/feature/register/controller/register_subcontroller.dart';
import 'package:get/get.dart';

final LoginController loginController = Get.put(LoginController());
final SubRegisterController registerController =
    Get.put(SubRegisterController());
String loginToken = loginController.token.value;
String registerToken = registerController.token.value;
String concatenatedTokens = loginToken + registerToken;
