// To parse this JSON data, do
//
//     final evolutiontrigger = evolutiontriggerFromJson(jsonString);

import 'dart:convert';

Evolutiontrigger evolutiontriggerFromJson(String str) =>
    Evolutiontrigger.fromJson(json.decode(str));

String evolutiontriggerToJson(Evolutiontrigger data) =>
    json.encode(data.toJson());

class Evolutiontrigger {
  Evolutiontrigger({
    required this.id,
    required this.name,
    required this.names,
    required this.pokemonSpecies,
  });

  int id;
  String name;
  List<Name> names;
  List<PokemonSpecy> pokemonSpecies;

  factory Evolutiontrigger.fromJson(Map<String, dynamic> json) =>
      Evolutiontrigger(
        id: json["id"],
        name: json["name"],
        names: List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
        pokemonSpecies: List<PokemonSpecy>.from(
            json["pokemon_species"].map((x) => PokemonSpecy.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "names": List<dynamic>.from(names.map((x) => x.toJson())),
        "pokemon_species":
            List<dynamic>.from(pokemonSpecies.map((x) => x.toJson())),
      };
}

class Name {
  Name({
    required this.name,
    required this.language,
  });

  String name;
  PokemonSpecy language;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        name: json["name"],
        language: PokemonSpecy.fromJson(json["language"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "language": language.toJson(),
      };
}

class PokemonSpecy {
  PokemonSpecy({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory PokemonSpecy.fromJson(Map<String, dynamic> json) => PokemonSpecy(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
