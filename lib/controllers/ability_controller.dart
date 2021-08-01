import 'package:flutter_finals/models/ability.dart';
import 'package:flutter_finals/services/remote_services_a.dart';
import 'package:get/state_manager.dart';

class AbilityController extends GetxController {
  var isLoading = true.obs;
  var abilityList = <Ability>[].obs;

  @override
  void onInit() {
    fetchAbility();
    super.onInit();
  }

  void fetchAbility() async {
    for (int id = 1; id < 50; id++) {
      var ability = await RemoteServicesAbility(id).fetchAbility();
      if (ability != null) {
        abilityList.add(ability);
      }
    }
  }
}
