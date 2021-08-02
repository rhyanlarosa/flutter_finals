import 'package:flutter_finals/models/evolutiontrigger.dart';
import 'package:http/http.dart' as http;

class RemoteServicesEvolutionTrigger {
  const RemoteServicesEvolutionTrigger(this.id);
  final int id;
  static var client = http.Client();

  Future<Evolutiontrigger?> fetchTrigger() async {
    var response = await client
        .get(Uri.parse('https://pokeapi.co/api/v2/evolution-trigger/${id}/'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return evolutiontriggerFromJson(jsonString);
    } else {
      print('Request failed: ${response.statusCode}.');
    }
  }
}