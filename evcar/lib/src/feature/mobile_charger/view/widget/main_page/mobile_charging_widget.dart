import 'dart:convert';

import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/feature/home_charging_station/model/charging_model.dart';
import 'package:evcar/src/feature/mobile_charger/view/widget/widget_collection/mobile_charger_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class MobileCharchingStations extends StatefulWidget {
  const MobileCharchingStations({super.key});

  @override
  State<MobileCharchingStations> createState() =>
      _MobileCharchingStationsState();
}

class _MobileCharchingStationsState extends State<MobileCharchingStations> {
  late Box<ChargingStation> mobileCharchingBox;
  late Box<ChargingStation> charchingBox;

  @override
  void initState() {
    super.initState();
    mobileCharchingBox = Hive.box<ChargingStation>('MobilecharchingStation');
    charchingBox = Hive.box<ChargingStation>('charchingStation');
    fetchCharching();
  }

  Future<void> fetchCharching() async {
    final response = await http.get(Uri.parse(
        'https://adventurous-yak-pajamas.cyclic.app/stations/getStationsByType/mobile_charging'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);

      final List<ChargingStation> charching =
          jsonData.map((item) => ChargingStation.fromJson(item)).toList();

      for (var charching in charching) {
        if (mobileCharchingBox.containsKey(charching.id)) {
          charching.liked = mobileCharchingBox.get(charching.id)!.liked;
        }
        mobileCharchingBox.put(charching.id, charching);
      }
      setState(() {});
    } else {
      throw Exception('Failed to load posts');
    }
  }

  void toggleLike(String charchingID) {
    ChargingStation chargingStation = mobileCharchingBox.get(charchingID)!;
    chargingStation.liked = !chargingStation.liked;
    mobileCharchingBox.put(charchingID, chargingStation);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ValueListenableBuilder(
        valueListenable: mobileCharchingBox.listenable(),
        builder: (context, Box<ChargingStation> box, _) {
          return ListView.separated(
            itemCount: box.length,
            itemBuilder: (context, index) {
              ChargingStation chargingStation = box.getAt(index)!;
              return MobileChargerCard(
                model: chargingStation,
                seeMore: false.obs,
                widget: Container(
                    margin: const EdgeInsets.all(8),
                    child: GestureDetector(
                        onTap: () => {
                              toggleLike(chargingStation.id),
                              savedFav(chargingStation)
                            },
                        child: !chargingStation.liked
                            ? SvgPicture.asset('assets/images/favFalseIcon.svg')
                            : SvgPicture.asset(
                                'assets/images/favTrueHeart.svg'))),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 0.04 * context.screenHeight,
              );
            },
          );
        },
      ),
    );
  }

  void savedFav(ChargingStation chargingID) {
    String x = chargingID.id;
    ChargingStation? chargingStation = charchingBox.get(x);

    if (chargingStation != null) {
      // ChargingStation found in the box, toggle the liked status
      chargingStation.liked = !chargingStation.liked;
      charchingBox.put(x, chargingStation);
    } else {
      // ChargingStation not found in the box, add a new one
      chargingStation = ChargingStation(
          id: x,
          liked: true,
          title: chargingID.title,
          features: chargingID.features,
          type: chargingID.type,
          image: chargingID.image); // Adjust constructor as needed
      charchingBox.put(x, chargingStation);
    }

    setState(() {});
  }
}

class MobileCharchingStationsAdapter extends TypeAdapter<ChargingStation> {
  @override
  final int typeId = 4;

  @override
  ChargingStation read(BinaryReader reader) {
    return ChargingStation(
        id: reader.read(),
        title: reader.read(),
        liked: reader.read(),
        features: reader.read(),
        type: reader.read(),
        image: reader.read());
  }

  @override
  void write(BinaryWriter writer, ChargingStation obj) {
    writer.write(obj.id);
    writer.write(obj.title);
    writer.write(obj.liked);
    writer.write(obj.features);
    writer.write(obj.type);
    writer.write(obj.image);
  }
}
