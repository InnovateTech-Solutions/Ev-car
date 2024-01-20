import 'dart:convert';

import 'package:evcar/src/feature/charging_station/model/detail_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class HomeCharchingStations extends StatefulWidget {
  const HomeCharchingStations({super.key});

  @override
  State<HomeCharchingStations> createState() => _HomeCharchingStationsState();
}

class _HomeCharchingStationsState extends State<HomeCharchingStations> {
  late Box<ChargingStation> homecharchingBox;
  late Box<ChargingStation> charchingBox;
  @override
  void initState() {
    super.initState();
    fetchCharching();
    homecharchingBox = Hive.box<ChargingStation>('HomecharchingStation');
    charchingBox = Hive.box<ChargingStation>('charchingStation');
  }

  Future<void> fetchCharching() async {
    final response = await http.get(Uri.parse(
        'https://adventurous-yak-pajamas.cyclic.app/stations/getStationsByType/home_charging_provider'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);

      final List<ChargingStation> charching =
          jsonData.map((item) => ChargingStation.fromJson(item)).toList();

      for (var charching in charching) {
        if (homecharchingBox.containsKey(charching.id)) {
          charching.liked = homecharchingBox.get(charching.id)!.liked;
        }
        homecharchingBox.put(charching.id, charching);
      }
      setState(() {});
    } else {
      throw Exception('Failed to load posts');
    }
  }

  void toggleLike(String charchingID) {
    ChargingStation chargingStation = homecharchingBox.get(charchingID)!;
    chargingStation.liked = !chargingStation.liked;
    homecharchingBox.put(charchingID, chargingStation);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: homecharchingBox.listenable(),
        builder: (context, Box<ChargingStation> box, _) {
          return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                ChargingStation chargingStation = box.getAt(index)!;
                return ListTile(
                  title: Text(chargingStation.title),
                  trailing: IconButton(
                    onPressed: () => {
                      toggleLike(chargingStation.id),
                      savedFav(chargingStation)
                    },
                    icon: Icon(
                      chargingStation.liked
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: chargingStation.liked ? Colors.red : null,
                    ),
                  ),
                );
              });
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
          type: chargingID.type); // Adjust constructor as needed
      charchingBox.put(x, chargingStation);
    }

    setState(() {});
  }
}

class HomeCharchingStationsAdapter extends TypeAdapter<ChargingStation> {
  @override
  final int typeId = 2;

  @override
  ChargingStation read(BinaryReader reader) {
    return ChargingStation(
        id: reader.read(),
        title: reader.read(),
        liked: reader.read(),
        features: reader.read(),
        type: reader.read());
  }

  @override
  void write(BinaryWriter writer, ChargingStation obj) {
    writer.write(obj.id);
    writer.write(obj.title);
    writer.write(obj.liked);
    writer.write(obj.features);
    writer.write(obj.type);
  }
}
