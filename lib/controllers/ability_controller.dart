import 'package:flutter_finals/models/ability.dart';
import 'package:flutter_finals/services/remote_services_a.dart';
import 'package:get/state_manager.dart';

class AbilityController extends GetxController {
  var abilityList = <Ability>[].obs;
  var generationList = <Ability>[].obs;

  @override
  void onInit() {
    fetchAbility();
    super.onInit();
  }

  void fetchAbility() async {
    for (int i = 9; i <= 20; i++) {
      var ability = await RemoteServicesAbility(i).fetchAbility();
      if (ability != null) {
        abilityList.add(ability);
      }
    }
  }

  void fetchGeneration() async {
    for (int i = 8; i < 20; i++) {
      var generation = await RemoteServicesAbility(i).fetchAbility();
      if (generation != null) {
        generationList.add(generation);
      }
    }
  }
}
