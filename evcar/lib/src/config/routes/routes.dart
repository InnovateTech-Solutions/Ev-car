import 'package:evcar/src/feature/google_map/view/pages/google_map_page.dart';
import 'package:evcar/src/feature/profile/view/pages/profile_page.dart';
import 'package:evcar/src/feature/splash_screen/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String spalshPage = '/';
  static const String register = '/register';
  static const String mainPage = '/MainPage';
  static const String dashBoard = '/dashborad';

  static const String googleMap = '/GoogleMap';
  static const String profile = '/Profile';

  static final List<GetPage> routes = [
    GetPage(
      name: spalshPage,
      page: () => GoogleMapPage(),
    ),
    // GetPage(
    //   name: register,
    //   page: () => const DetailPage(),
    // ),
    GetPage(
      name: mainPage,
      page: () => const Scaffold(),
    ),
    GetPage(
      name: googleMap,
      page: () => const GoogleMapPage(),
    ),
    GetPage(
      name: profile,
      page: () => const ProfilePage(),
    ),
  ];
}
