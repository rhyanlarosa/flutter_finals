import 'package:flutter_finals/models/types.dart';
import 'package:flutter_finals/services/remote_services_et.dart';
import 'package:get/state_manager.dart';

class PokemonTrigger extends GetxController {
  RxList<dynamic> triggerlist = [].obs;

  @override
  void onInit() {
    fetchtrigger();
    super.onInit();
  }

  void fetchtrigger() async {
    triggerlist = [].obs;
    for (int i = 1; i < 6; i++) {
      var trigger = await RemoteServicesEvolutionTrigger(i).fetchTrigger();
      if (trigger != null) {
        triggerlist.add(trigger);
      }
    }
  }
}