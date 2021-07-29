import 'package:flutter_finals/models/types.dart';
import 'package:flutter_finals/services/remote_services.dart';
import 'package:get/state_manager.dart';

class TypesController extends GetxController {
  RxList<dynamic> typeList = [].obs;

  @override
  void onInit() {
    fetchtypes();
    super.onInit();
  }

  void fetchtypes() async {
    for (int id = 1; id < 19; id++) {
      var types = await RemoteServices(id).fetchtypes();
      if (types != null) {
        typeList.add(types);
      }
    }
  }
}
