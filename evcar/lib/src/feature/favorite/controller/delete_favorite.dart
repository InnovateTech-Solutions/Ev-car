import 'package:http/http.dart' as http;

class DeleteFavorite {
  static DeleteFavorite get instance => DeleteFavorite();

  Future<void> deleteChargingStation(String chargingStationId) async {
    final apiUrl =
        'https://adventurous-yak-pajamas.cyclic.app/stations/getStationsByType/mobile_charging/$chargingStationId';

    try {
      final response = await http.delete(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Handle success
        print('Charging station deleted successfully');
      } else {
        // Handle error
        print(
            'Failed to delete charging station. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exception
      print('Error deleting charging station: $e');
    }
  }
}
