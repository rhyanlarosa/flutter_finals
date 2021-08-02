import 'package:flutter_finals/models/evolutiontrigger.dart';
import 'package:http/http.dart' as http;

class RemoteServicesEvolutionTrigger {
  final int id;
  static var client = http.Client();

  RemoteServicesEvolutionTrigger(this.id);

  Future<Evolutiontrigger?> fetchTrigger() async {
    var evoResponse = await client
        .get(Uri.parse('https://pokeapi.co/api/v2/evolution-trigger/${id}'));
    if (evoResponse.statusCode == 200) {
      var jsonString = evoResponse.body;
      return evolutiontriggerFromJson(jsonString);
    } else {
      print(evoResponse.statusCode);
    }
  }
}
