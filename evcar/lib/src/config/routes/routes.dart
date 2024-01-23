import 'package:evcar/src/feature/about/view/about_page.dart';
import 'package:evcar/src/feature/contact/view/contact_page.dart';
import 'package:evcar/src/feature/forget_password/view/pages/forget_password.dart';
import 'package:evcar/src/feature/google_map/view/pages/google_map_page.dart';
import 'package:evcar/src/feature/information_page/view/page/information_page.dart';
import 'package:evcar/src/feature/intro_page/view/pages/Intro_page.dart';
import 'package:evcar/src/feature/login/view/pages/login_page.dart';
import 'package:evcar/src/feature/nav_bar/nav_bar.dart';
import 'package:evcar/src/feature/profile/view/pages/profile_page.dart';
import 'package:evcar/src/feature/register/view/pages/register_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String spalshPage = '/';
  static const String introPage = '/IntroPage';
  static const String register = '/Register';
  static const String login = '/Login';
  static const String otp = '/OTPage';
  static const String googleMap = '/GoogleMap';
  static const String homeCharching = '/HomeCharching';
  static const String moblieCharching = '/MobileCharching';
  static const String profile = '/Profile';
  static const String informatioPage = '/InformatioPage';
  static const String favourite = '/FavouritePage';
  static const String connectUs = '/ConnectPage';
  static const String aboutUs = '/AboutPage';
  static const String forgetPassword = '/ForgetPassword';
  static const String navBar = '/NavBar';

  static final List<GetPage> routes = [
    GetPage(
      name: introPage,
      page: () => const IntroPage(),
    ),
    GetPage(
      name: register,
      page: () => const RegisterPage(),
    ),
    GetPage(
      name: login,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: googleMap,
      page: () => const GoogleMapPage(),
    ),
    GetPage(
      name: profile,
      page: () => const ProfilePage(),
    ),
    GetPage(
      name: googleMap,
      page: () => const GoogleMapPage(),
    ),
    GetPage(name: informatioPage, page: () => const InformationPage()),
    GetPage(name: navBar, page: () => const NavBarWidget()),
    GetPage(name: aboutUs, page: () => const AboutPage()),
    GetPage(name: connectUs, page: () => const ContactPage()),
    GetPage(name: forgetPassword, page: () => const ForgetPasswordPage())
  ];
}
