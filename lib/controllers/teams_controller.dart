import 'package:flutter_finals/models/teams.dart';
import 'package:flutter_finals/services/remote_services.dart';
import 'package:get/state_manager.dart';

class TeamsController extends GetxController {
  var teamsList = Teams(
    data: [],
  ).data.obs;

  @override
  void onInit() {
    fetchTeams();
    super.onInit();
  }

  void fetchTeams() async {
    var teams = await RemoteServices.fetchTeams();
    if (teams != null) {
      teamsList.value = teams.data;
    }
  }
}
