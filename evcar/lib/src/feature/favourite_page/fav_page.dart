import 'package:evcar/src/feature/charging_station/model/detail_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class LikedItemsScreen extends StatefulWidget {
  const LikedItemsScreen({Key? key}) : super(key: key);

  @override
  State<LikedItemsScreen> createState() => _LikedItemsScreenState();
}

class _LikedItemsScreenState extends State<LikedItemsScreen> {
  late Box<ChargingStation> allcharchingBox;
  late Box<ChargingStation> homecharchingBox;
  late Box<ChargingStation> mobileCharchingBox;
  late Box<ChargingStation> googleMapCharchingBox;

  @override
  void initState() {
    super.initState();
    allcharchingBox = Hive.box<ChargingStation>('charchingStation');

    homecharchingBox = Hive.box<ChargingStation>('HomecharchingStation');

    mobileCharchingBox = Hive.box<ChargingStation>('MobilecharchingStation');

    googleMapCharchingBox =
        Hive.box<ChargingStation>('GoogleMapcharchingStation');
  }

  List<ChargingStation> getLikedItems() {
    return allcharchingBox.values
        .where((chargingStation) => chargingStation.liked)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    List<ChargingStation> likedItems = getLikedItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Liked Items'),
      ),
      body: ListView.builder(
        itemCount: likedItems.length,
        itemBuilder: (context, index) {
          ChargingStation chargingStation = likedItems[index];
          return ListTile(
            title: Text(chargingStation.title),
            trailing: IconButton(
              onPressed: () => {
                toggleLike(chargingStation.id),
                if (chargingStation.type == "home_charging_provider")
                  {savedFavHome(chargingStation)}
                else if (chargingStation.type == "mobile_charging")
                  {savedFavMobile(chargingStation)}
                else if (chargingStation.type == "charging_station")
                  {savedFavGoogleMap(chargingStation)},
                print(chargingStation.id),
                print(chargingStation.type)
              },
              icon: Icon(
                chargingStation.liked ? Icons.favorite : Icons.favorite_border,
                color: chargingStation.liked ? Colors.red : null,
              ),
            ),
          );
        },
      ),
    );
  }

  void savedFavHome(ChargingStation chargingID) {
    String x = chargingID.id;
    ChargingStation? chargingStation = homecharchingBox.get(x);

    if (chargingStation != null) {
      // ChargingStation found in the box, toggle the liked status
      chargingStation.liked = !chargingStation.liked;
      homecharchingBox.put(x, chargingStation);
    } else {
      // ChargingStation not found in the box, add a new one
      chargingStation = ChargingStation(
          id: x,
          liked: true,
          title: chargingID.title,
          features: chargingID.features,
          type: chargingID.type); // Adjust constructor as needed
      homecharchingBox.put(x, chargingStation);
    }

    setState(() {});
  }

  void toggleLike(String charchingID) {
    ChargingStation chargingStation = allcharchingBox.get(charchingID)!;
    chargingStation.liked = !chargingStation.liked;
    allcharchingBox.put(charchingID, chargingStation);
    setState(() {});
  }

  void savedFavMobile(ChargingStation chargingID) {
    String x = chargingID.id;
    ChargingStation? chargingStation = mobileCharchingBox.get(x);

    if (chargingStation != null) {
      // ChargingStation found in the box, toggle the liked status
      chargingStation.liked = !chargingStation.liked;
      mobileCharchingBox.put(x, chargingStation);
    } else {
      // ChargingStation not found in the box, add a new one
      chargingStation = ChargingStation(
          id: x,
          liked: true,
          title: chargingID.title,
          features: chargingID.features,
          type: chargingID.type); // Adjust constructor as needed
      mobileCharchingBox.put(x, chargingStation);
    }

    setState(() {});
  }

  void savedFavGoogleMap(ChargingStation chargingID) {
    String x = chargingID.id;
    ChargingStation? chargingStation = googleMapCharchingBox.get(x);

    if (chargingStation != null) {
      // ChargingStation found in the box, toggle the liked status
      chargingStation.liked = !chargingStation.liked;
      googleMapCharchingBox.put(x, chargingStation);
    } else {
      // ChargingStation not found in the box, add a new one
      chargingStation = ChargingStation(
          id: x,
          liked: true,
          title: chargingID.title,
          features: chargingID.features,
          type: chargingID.type); // Adjust constructor as needed
      googleMapCharchingBox.put(x, chargingStation);
    }

    setState(() {});
  }
}
