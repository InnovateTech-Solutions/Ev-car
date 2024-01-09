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
    final String stationId = model.id;
    if (model.isFav.value == true) {
      model.isFav.value = false;
      favoriteList.remove(model);
      print(model.isFav.value);

      print(stationId);
      print(favoriteList);
    } else if (model.isFav.value == false) {
      model.isFav.value = true;
      favoriteList.add(model);
      print(stationId);
      print(model.isFav.value);

      print(favoriteList);
    } else {
      favoriteList.clear();
    }
    saveFavorites();
  }

  Future<void> saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Create a list of maps, each containing 'isFav' and 'data' keys
    List<Map<String, dynamic>> favoriteListJson = favoriteList.map((e) {
      return {
        'isFav': favoriteList.contains(e),
        'data': jsonEncode(e.toJson()),
      };
    }).toList();

    // Save the list of maps as a JSON string
    prefs.setStringList(
        'favoriteList', favoriteListJson.map((e) => jsonEncode(e)).toList());
  }

  Future<void> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteListJson = prefs.getStringList('favoriteList');

    if (favoriteListJson != null) {
      favoriteList.assignAll(favoriteListJson.map((e) {
        final Map<String, dynamic> map = jsonDecode(e);
        final bool isFav = map['isFav'];
        final ChargingStationModel model =
            ChargingStationModel.fromJson(jsonDecode(map['data']));

        // Update the isFav value for the model
        if (isFav) {
          model.isFav.value = true;
        }

        return model;
      }));
    }
  }
}
