// To parse this JSON data, do
//
//     final types = typesFromJson(jsonString);

import 'dart:convert';

Types typesFromJson(String str) => Types.fromJson(json.decode(str));

String typesToJson(Types data) => json.encode(data.toJson());

class Types {
  Types({
    required this.id,
    required this.name,
    required this.names,
    required this.pokemon,
  });

  int id;
  String name;
  List<Name> names;
  List<Pokemon> pokemon;

  factory Types.fromJson(Map<String, dynamic> json) => Types(
        id: json["id"],
        name: json["name"],
        names: List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
        pokemon:
            List<Pokemon>.from(json["pokemon"].map((x) => Pokemon.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "names": List<dynamic>.from(names.map((x) => x.toJson())),
        "pokemon": List<dynamic>.from(pokemon.map((x) => x.toJson())),
      };
}

class Name {
  Name({
    required this.name,
    required this.language,
  });

  String name;
  Language language;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        name: json["name"],
        language: Language.fromJson(json["language"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "language": language.toJson(),
      };
}

class Language {
  Language({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Pokemon {
  Pokemon({
    required this.slot,
    required this.pokemon,
  });

  int slot;
  Language pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        slot: json["slot"],
        pokemon: Language.fromJson(json["pokemon"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "pokemon": pokemon.toJson(),
      };
}
