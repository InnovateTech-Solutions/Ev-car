// ignore_for_file: file_names

import 'package:evcar/src/feature/favorite/controller/favorite_controller.dart';
import 'package:evcar/src/feature/favorite/widget/main_widgets/favorite_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favoritewidget extends GetView<FavoriteController> {
  const Favoritewidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Obx(() => controller.favoriteProducts.isEmpty
              ? Favorite.noFavoirteProduct()
              : Favorite.favoirteProduct()),
        ),
      ),
    );
  }
}
