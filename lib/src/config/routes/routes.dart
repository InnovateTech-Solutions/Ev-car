import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String onBoard = '/';
  static const String register = '/register';
  static const String mainPage = '/MainPage';
  static const String dashBoard = '/dashborad';
  static final List<GetPage> routes = [
    GetPage(
      name: onBoard,
      page: () => const Scaffold(),
    ),
    GetPage(
      name: register,
      page: () => const Scaffold(),
    ),
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
