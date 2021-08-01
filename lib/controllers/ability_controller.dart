import 'package:flutter_finals/models/ability.dart';
import 'package:flutter_finals/services/remote_services_a.dart';
import 'package:get/state_manager.dart';

class AbilityController extends GetxController {
  var abilityList = <Ability>[].obs;
  var textEntryList = <Ability>[].obs;

  @override
  void onInit() {
    fetchAbility();
    super.onInit();
  }

  void fetchAbility() async {
    for (int i = 2; i < 4; i++) {
      var ability = await RemoteServicesAbility(i).fetchAbility();
      if (ability != null) {
        abilityList.add(ability);
      }
    }
  }

  void fetchFlavorTextEntry() async {
    for (int i = 1; i < 4; i++) {
      var textEntry = await RemoteServicesAbility(i).fetchAbility();
      if (textEntry != null) {
        textEntryList.add(textEntry);
      }
    }
  }
}
