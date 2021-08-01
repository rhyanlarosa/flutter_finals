import 'package:flutter_finals/models/evolution.dart';
import 'package:http/http.dart' as http;

class RemoteServicesEvolution {
  static var client = http.Client();
  final int id;
  RemoteServicesEvolution(this.id);

  Future<Evolution?> fetchEvolution() async {
    var response =
        await client.get(Uri.parse('https://pokeapi.co/api/v2/evolution-chain/{id}/'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return evolutionFromJson(jsonString);
    } else {
      print('Request failed: ${response.statusCode}.');
    }
  }
}
