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
    required this.pokemon,
  });

  int id;
  String name;
  List<PokemonElement> pokemon;

  factory Types.fromJson(Map<String, dynamic> json) => Types(
        id: json["id"],
        name: json["name"],
        pokemon: List<PokemonElement>.from(
            json["pokemon"].map((x) => PokemonElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "pokemon": List<dynamic>.from(pokemon.map((x) => x.toJson())),
      };
}

class PokemonElement {
  PokemonElement({
    required this.slot,
    required this.pokemon,
  });

  int slot;
  PokemonPokemon pokemon;

  factory PokemonElement.fromJson(Map<String, dynamic> json) => PokemonElement(
        slot: json["slot"],
        pokemon: PokemonPokemon.fromJson(json["pokemon"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "pokemon": pokemon.toJson(),
      };
}

class PokemonPokemon {
  PokemonPokemon({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory PokemonPokemon.fromJson(Map<String, dynamic> json) => PokemonPokemon(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
