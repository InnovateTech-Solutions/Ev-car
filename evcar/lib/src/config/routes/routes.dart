import 'package:evcar/src/future/google_map/view/pages/google_map_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String spalshPage = '/';
  static const String register = '/register';
  static const String mainPage = '/MainPage';
  static const String dashBoard = '/dashborad';
  static final List<GetPage> routes = [
    GetPage(
      name: spalshPage,
      page: () => const GoogleMapPage(),
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
      name: dashBoard,
      page: () => const Scaffold(),
    ),
  ];
}
