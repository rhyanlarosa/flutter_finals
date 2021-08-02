import 'package:flutter_finals/services/remote_services_r.dart';
import 'package:get/state_manager.dart';

class Regions extends GetxController {
  RxList<dynamic> regionlistlist = [].obs;

  @override
  void onInit() {
    fetchregion();
    super.onInit();
  }

  void fetchregion() async {
    for (int i = 1; i < 9; i++) {
      var region = await RemoteServicesRegion(i).fetchRegion();
      if (region != null) {
        regionlistlist.add(region);
      }
    }
  }
}
