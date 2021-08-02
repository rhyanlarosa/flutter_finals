import 'package:flutter_finals/models/types.dart';
import 'package:flutter_finals/services/remote_services_p.dart';
import 'package:get/state_manager.dart';

class PokemonController extends GetxController {
  final String type;
  final List<PokemonElement> url;
  RxList<dynamic> pokelist = [].obs;

  PokemonController(this.type, this.url);

  @override
  void onInit() {
    fetchpokemon();
    super.onInit();
  }

  void fetchpokemon() async {
    pokelist = [].obs;
    for (int i = 0; i < url.length; i++) {
      var pokemon = await RemoteServicesPoke(url[i].pokemon.url).fetchpokemon();
      if (pokemon != null) {
        pokelist.add(pokemon);
      }
    }
  }
}
