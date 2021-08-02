import 'package:flutter_finals/models/evolutionchain.dart';
import 'package:http/http.dart' as http;

class RemoteServicesEvolutionChain {
  const RemoteServicesEvolutionChain(this.id);
  final int id;
  static var client = http.Client();

  Future<Evolutionchain?> fetchChain() async {
    var response = await client
        .get(Uri.parse('https://pokeapi.co/api/v2/evolution-chain/${id}/'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return evolutionchainFromJson(jsonString);
    } else {
      print('Request failed: ${response.statusCode}.');
    }
  }
}