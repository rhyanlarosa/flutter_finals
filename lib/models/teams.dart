// To parse this JSON data, do
//
//     final teams = teamsFromJson(jsonString);

import 'dart:convert';

Teams teamsFromJson(String str) => Teams.fromJson(json.decode(str));

String teamsToJson(Teams data) => json.encode(data.toJson());

class Teams {
  Teams({
    required this.data,
  });

  List<Datum> data;

  factory Teams.fromJson(Map<String, dynamic> json) => Teams(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.abbreviation,
    required this.city,
    required this.conference,
    required this.division,
    required this.fullName,
    required this.name,
  });

  int id;
  String abbreviation;
  String city;
  Conference conference;
  String division;
  String fullName;
  String name;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        abbreviation: json["abbreviation"],
        city: json["city"],
        conference: conferenceValues.map[json["conference"]]!,
        division: json["division"],
        fullName: json["full_name"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "abbreviation": abbreviation,
        "city": city,
        "conference": conferenceValues.reverse[conference],
        "division": division,
        "full_name": fullName,
        "name": name,
      };
}

enum Conference { EAST, WEST }

final conferenceValues =
    EnumValues({"East": Conference.EAST, "West": Conference.WEST}, Map());

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map, this.reverseMap);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
