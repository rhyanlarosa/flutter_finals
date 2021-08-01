import 'package:flutter_finals/models/characteristics.dart';
import 'package:flutter_finals/services/remote_services_c.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class CharacteristicsController extends GetxController {
  RxList<dynamic> statList = [].obs;
  var descList = <Characteristics>[].obs;

  @override
  void onInit() {
    fetchStats();
    fetchDescription();
    super.onInit();
  }

  void fetchStats() async {
    for (int id = 1; id < 7; id++) {
      var stats = await RemoteServicesCharacteristics(id).fetchCharacteristic();
      if (stats != null) {
        statList.add(stats);
      }
    }
  }

  void fetchDescription() async {
    for (int id = 1; id < 3; id++) {
      var desc = await RemoteServicesCharacteristics(id).fetchCharacteristic();
      if (desc != null) {
        descList.add(desc);
      }
    }
  }
}
