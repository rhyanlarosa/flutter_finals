import 'package:flutter_finals/models/characteristics.dart';
import 'package:http/http.dart' as http;

class RemoteServicesCharacteristics {
  const RemoteServicesCharacteristics(this.id);
  final int id;
  static var client = http.Client();

  Future<Characteristics?> fetchCharacteristic() async {
    var response = await client
        .get(Uri.parse('https://pokeapi.co/api/v2/characteristic/${id}/'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return characteristicsFromJson(jsonString);
    } else {
      print('Request failed: ${response.statusCode}.');
    }
  }
}
