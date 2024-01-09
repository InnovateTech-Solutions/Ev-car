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
    String stationId = model.id;
    if (model.isFav.value == true) {
      model.isFav.value = false;
      favoriteList.remove(model);
      print(model.isFav.value);
      print(stationId);
      print(favoriteList);
    } else {
      model.isFav.value = true;
      favoriteList.add(model);
      print(stationId);
      print(model.isFav.value);

      print(favoriteList);
    }
    saveFavorites();
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
