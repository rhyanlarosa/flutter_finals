// To parse this JSON data, do
//
//     final pokemonMaster = pokemonMasterFromJson(jsonString);

import 'dart:convert';

PokemonMaster pokemonMasterFromJson(String str) =>
    PokemonMaster.fromJson(json.decode(str));

String pokemonMasterToJson(PokemonMaster data) => json.encode(data.toJson());

class PokemonMaster {
  PokemonMaster({
    required this.id,
    required this.name,
    required this.abilities,
    required this.moves,
    required this.sprites,
    required this.stats,
    required this.types,
  });

  int id;
  String name;
  List<AbilityElement> abilities;
  List<Move> moves;
  Sprites sprites;
  List<Stat> stats;
  List<Type> types;

  factory PokemonMaster.fromJson(Map<String, dynamic> json) => PokemonMaster(
        id: json["id"],
        name: json["name"],
        abilities: List<AbilityElement>.from(
            json["abilities"].map((x) => AbilityElement.fromJson(x))),
        moves: List<Move>.from(json["moves"].map((x) => Move.fromJson(x))),
        sprites: Sprites.fromJson(json["sprites"]),
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
        "moves": List<dynamic>.from(moves.map((x) => x.toJson())),
        "sprites": sprites.toJson(),
        "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
      };
}

class AbilityElement {
  AbilityElement({
    required this.isHidden,
    required this.slot,
    required this.ability,
  });

  bool isHidden;
  int slot;
  MoveClass ability;

  factory AbilityElement.fromJson(Map<String, dynamic> json) => AbilityElement(
        isHidden: json["is_hidden"],
        slot: json["slot"],
        ability: MoveClass.fromJson(json["ability"]),
      );

  Map<String, dynamic> toJson() => {
        "is_hidden": isHidden,
        "slot": slot,
        "ability": ability.toJson(),
      };
}

class MoveClass {
  MoveClass({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory MoveClass.fromJson(Map<String, dynamic> json) => MoveClass(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Move {
  Move({
    required this.move,
  });

  MoveClass move;

  factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: MoveClass.fromJson(json["move"]),
      );

  Map<String, dynamic> toJson() => {
        "move": move.toJson(),
      };
}

class Sprites {
  Sprites({
    required this.frontDefault,
  });

  String frontDefault;

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        frontDefault: json["front_default"] == null
            ? 'https://cdn.dribbble.com/users/1081076/screenshots/2832850/pokemongo.gif'
            : json["front_default"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
      };
}

class Stat {
  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  int baseStat;
  int effort;
  MoveClass stat;

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: MoveClass.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat.toJson(),
      };
}

class Type {
  Type({
    required this.slot,
    required this.type,
  });

  int slot;
  MoveClass type;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: MoveClass.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type.toJson(),
      };
}
