import 'package:flutter_finals/models/pokemon.dart';
import 'package:http/http.dart' as http;

class RemoteServicesPoke {
  final String url;
  static var client = http.Client();

  RemoteServicesPoke(this.url);

  Future<PokemonMaster?> fetchpokemon() async {
    var pokemonResponse = await client.get(Uri.parse(url));
    if (pokemonResponse.statusCode == 200) {
      var jsonString = pokemonResponse.body;
      return pokemonMasterFromJson(jsonString);
    } else {
      print(pokemonResponse.statusCode);
    }
  }
}
