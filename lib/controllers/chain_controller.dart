import 'package:flutter_finals/models/evolutionchain.dart';
import 'package:flutter_finals/services/remote_services_ec.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PokemonChain extends GetxController {
  final int id;
  var evo_chain = Evolutionchain(id: 0, chain: Chain(evolvesTo: [])).obs;

  PokemonChain(this.id);

  @override
  void onInit() {
    fetchchain();
    super.onInit();
  }

  void fetchchain() async {
    var chain = await RemoteServicesEvolutionChain(id).fetchChain();
    if (chain != null) {
      evo_chain.value = chain;
    }
  }
}