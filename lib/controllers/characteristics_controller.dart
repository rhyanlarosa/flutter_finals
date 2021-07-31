import 'package:flutter_finals/services/remote_services.c.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CharacteristicsController extends GetxController {
  RxList<dynamic> characteristicsList = [].obs;
  // var characteristicsList = <Characteristics>[].obs;

  @override
  void onInit() {
    fetchCharacteristics();
    super.onInit();
  }

  void fetchCharacteristics() async {
    for (int id = 1; id < 7; id++) {
      var characteristics =
          await RemoteServicesCharacteristics(id).fetchCharacteristic();
      if (characteristics != null) {
        characteristicsList.add(characteristics);
      }
    }
    // var characteristics =
    //     await RemoteServicesCharacteristics.fetchCharacteristic();
    // if (characteristics != null) {
    //   characteristicsList.add(characteristics);
    //   print('Added successfully!');
    // } else {
    //   print('fetchCharacteristics failed!');
    // }
  }
}
