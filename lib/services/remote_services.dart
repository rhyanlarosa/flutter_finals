import 'package:flutter_finals/models/teams.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  static Future<Teams?> fetchTeams() async {
    var teamResponse =
        await client.get(Uri.parse('https://www.balldontlie.io/api/v1/teams'));
    if (teamResponse.statusCode == 200) {
      var jsonString = teamResponse.body;
      return teamsFromJson(jsonString);
    } else {
      return null;
    }
  }
}
