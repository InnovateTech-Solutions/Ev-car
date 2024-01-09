import 'dart:convert';

import 'package:evcar/src/feature/charging_station/model/detail_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteController extends GetxController {
  RxList<ChargingStationModel> favoriteList = <ChargingStationModel>[].obs;
  RxMap isFavMap = {}.obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
    print(favoriteList);
  }

  void addFavorite(ChargingStationModel model) {
    if (!favoriteList.contains(model)) {
      favoriteList.add(model);
      model.isFav.value = false;
      print(favoriteList);
      update();
    } else {
      favoriteList.remove(model);

      model.isFav.value = true;
      print(favoriteList);
      update();
    }
  }

  Future<void> saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteListJson =
        favoriteList.map((e) => jsonEncode(e.toJson())).toList();
    prefs.setStringList('favoriteList', favoriteListJson);
  }

  Future<void> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteListJson = prefs.getStringList('favoriteList');
    if (favoriteListJson != null) {
      favoriteList.assignAll(favoriteListJson
          .map((e) => ChargingStationModel.fromJson(jsonDecode(e))));
    }
  }
}
