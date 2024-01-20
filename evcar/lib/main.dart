import 'package:evcar/src/config/routes/routes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/charging_station/model/detail_model.dart';
import 'package:evcar/src/feature/favourite_page/google_map_charching.dart';
import 'package:evcar/src/feature/favourite_page/home_charching.dart';
import 'package:evcar/src/feature/favourite_page/mobile_charching.dart';
import 'package:evcar/src/feature/home_page/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(HomeCharchingStationsAdapter());
  Hive.registerAdapter(MobileCharchingStationsAdapter());
  Hive.registerAdapter(GoogleMapCharchingStationsAdapter());
  await Hive.openBox<ChargingStation>('charchingStation');
  await Hive.openBox<ChargingStation>('HomecharchingStation');
  await Hive.openBox<ChargingStation>('MobilecharchingStation');
  await Hive.openBox<ChargingStation>('GoogleMapcharchingStation');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Use Get.put outside of the build method to ensure a consistent instance.
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ev Car',
      theme: AppTheme.light,
      locale: const Locale('ar', 'AE'),
      home: const MainWidget(),
      getPages: AppRoutes.routes,
    );
  }
}
