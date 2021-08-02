import 'package:flutter_finals/models/regions.dart';
import 'package:http/http.dart' as http;

class RemoteServicesRegion {
  final int id;
  static var client = http.Client();

  RemoteServicesRegion(this.id);

  Future<Region?> fetchRegion() async {
    var regionResponse =
        await client.get(Uri.parse('https://pokeapi.co/api/v2/region/${id}'));
    if (regionResponse.statusCode == 200) {
      var jsonString = regionResponse.body;
      return regionFromJson(jsonString);
    } else {
      print(regionResponse.statusCode);
    }
  }
}
