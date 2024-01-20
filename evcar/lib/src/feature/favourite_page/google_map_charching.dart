import 'dart:convert';

import 'package:evcar/src/feature/charging_station/model/detail_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class GoogleMapCharchungStations extends StatefulWidget {
  const GoogleMapCharchungStations({super.key});

  @override
  State<GoogleMapCharchungStations> createState() =>
      _GoogleMapCharchungStationsState();
}

class _GoogleMapCharchungStationsState
    extends State<GoogleMapCharchungStations> {
  late Box<ChargingStation> googleMapCharchingBox;
  late Box<ChargingStation> charchingBox;

  @override
  void initState() {
    super.initState();
    googleMapCharchingBox =
        Hive.box<ChargingStation>('GoogleMapcharchingStation');
    charchingBox = Hive.box<ChargingStation>('charchingStation');
    fetchCharching();
  }

  Future<void> fetchCharching() async {
    final response = await http.get(Uri.parse(
        'https://adventurous-yak-pajamas.cyclic.app/stations/getStationsByType/charging_station'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);

      final List<ChargingStation> charching =
          jsonData.map((item) => ChargingStation.fromJson(item)).toList();

      for (var charching in charching) {
        if (googleMapCharchingBox.containsKey(charching.id)) {
          charching.liked = googleMapCharchingBox.get(charching.id)!.liked;
        }
        googleMapCharchingBox.put(charching.id, charching);
      }
      setState(() {});
    } else {
      throw Exception('Failed to load posts');
    }
  }

  void toggleLike(String charchingID) {
    ChargingStation chargingStation = googleMapCharchingBox.get(charchingID)!;
    chargingStation.liked = !chargingStation.liked;
    googleMapCharchingBox.put(charchingID, chargingStation);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: googleMapCharchingBox.listenable(),
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

class GoogleMapCharchingStationsAdapter extends TypeAdapter<ChargingStation> {
  @override
  final int typeId = 5;

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
