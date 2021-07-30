import 'package:flutter_finals/models/types.dart';
import 'package:http/http.dart' as http;

class RemoteServicesType {
  final int id;
  static var client = http.Client();

  RemoteServicesType(this.id);

  Future<Types?> fetchtypes() async {
    var typesResponse =
        await client.get(Uri.parse('https://pokeapi.co/api/v2/type/${id}'));
    if (typesResponse.statusCode == 200) {
      var jsonString = typesResponse.body;
      return typesFromJson(jsonString);
    } else {
      print(typesResponse.statusCode);
    }
  }
}
