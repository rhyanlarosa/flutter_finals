// To parse this JSON data, do
//
//     final region = regionFromJson(jsonString);

import 'dart:convert';

Region regionFromJson(String str) => Region.fromJson(json.decode(str));

String regionToJson(Region data) => json.encode(data.toJson());

class Region {
  Region({
    required this.id,
    required this.name,
    required this.locations,
    required this.mainGeneration,
    required this.names,
    required this.pokedexes,
    required this.versionGroups,
  });

  int id;
  String name;
  List<MainGeneration> locations;
  MainGeneration mainGeneration;
  List<Name> names;
  List<MainGeneration> pokedexes;
  List<MainGeneration> versionGroups;

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        id: json["id"],
        name: json["name"],
        locations: List<MainGeneration>.from(
            json["locations"].map((x) => MainGeneration.fromJson(x))),
        mainGeneration: MainGeneration.fromJson(json["main_generation"]),
        names: List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
        pokedexes: List<MainGeneration>.from(
            json["pokedexes"].map((x) => MainGeneration.fromJson(x))),
        versionGroups: List<MainGeneration>.from(
            json["version_groups"].map((x) => MainGeneration.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "locations": List<dynamic>.from(locations.map((x) => x.toJson())),
        "main_generation": mainGeneration.toJson(),
        "names": List<dynamic>.from(names.map((x) => x.toJson())),
        "pokedexes": List<dynamic>.from(pokedexes.map((x) => x.toJson())),
        "version_groups":
            List<dynamic>.from(versionGroups.map((x) => x.toJson())),
      };
}

class MainGeneration {
  MainGeneration({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory MainGeneration.fromJson(Map<String, dynamic> json) => MainGeneration(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Name {
  Name({
    required this.name,
    required this.language,
  });

  String name;
  MainGeneration language;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        name: json["name"],
        language: MainGeneration.fromJson(json["language"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "language": language.toJson(),
      };
}
