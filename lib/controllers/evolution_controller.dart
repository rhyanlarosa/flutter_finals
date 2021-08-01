import 'package:flutter_finals/models/evolution.dart';
import 'package:flutter_finals/services/remote_services_e.dart';
import 'package:get/get.dart';

class EvolutionController extends GetxController {
  final List<Chain> url;
  
  EvolutionController(this.url);

  RxList<dynamic> evoList = [].obs;
  
  @override
  void onInit() {
    fetchEvolution();
    super.onInit();
  }


void fetchEvolution() async {
  evoList = [].obs;
  for (int i = 0; i < url.length; i++) {
    var evolution = await RemoteServicesEvolution(url[i].evolution.url).fetchEvolution();
    if (evolution != null) {
      evoList.add(evolution);
    }
  }
  evoList.length;
}
}