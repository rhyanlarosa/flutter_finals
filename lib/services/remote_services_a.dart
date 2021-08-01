import 'package:flutter_finals/models/ability.dart';
import 'package:http/http.dart' as http;

class RemoteServicesAbility {
  static var client = http.Client();
  final int id;
  RemoteServicesAbility(this.id);

  Future<Ability?> fetchAbility() async {
    var response =
        await client.get(Uri.parse('https://pokeapi.co/api/v2/ability/${id}/'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return abilityFromJson(jsonString);
    } else {
      print('Request failed: ${response.statusCode}.');
    }
  }
}
