import 'package:evcar/src/feature/favourite_page/fav_page.dart';
import 'package:evcar/src/feature/favourite_page/google_map_charching.dart';
import 'package:evcar/src/feature/favourite_page/home_charching.dart';
import 'package:evcar/src/feature/favourite_page/mobile_charching.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavMainWidget extends StatelessWidget {
  const FavMainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ElevatedButton(
            //     onPressed: () => Get.to(const CharchingScreen()),
            //     child: const Text('Error Fixed')),
            ElevatedButton(
                onPressed: () => Get.to(const LikedItemsScreen()),
                child: const Text('All Liked Data')),
            ElevatedButton(
                onPressed: () => Get.to(const MobileCharchingStations()),
                child: const Text('Mobile charching')),
            ElevatedButton(
                onPressed: () => Get.to(const HomeCharchingStations()),
                child: const Text('Home charching statios')),
            ElevatedButton(
                onPressed: () => Get.to(const GoogleMapCharchungStations()),
                child: const Text('Google Map charching statios')),
          ],
        ),
      ),
    );
  }
}
