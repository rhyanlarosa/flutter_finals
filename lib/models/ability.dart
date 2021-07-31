// To parse this JSON data, do
//
//     final ability = abilityFromJson(jsonString);

import 'dart:convert';

Ability abilityFromJson(String str) => Ability.fromJson(json.decode(str));

// List<Ability> abilityFromJson2(String str) =>
//     List<Ability>.from(json.decode(str).map((x) => Ability.fromJson(x)));

// factory Teams.fromJson(Map<String, dynamic> json) => Teams(
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//       };
// }

String abilityToJson(Ability data) => json.encode(data.toJson());

class Ability {
  Ability({
    required this.id,
    required this.name,
    required this.isMainSeries,
    required this.generation,
    required this.names,
    required this.effectEntries,
    required this.effectChanges,
    required this.flavorTextEntries,
    required this.pokemon,
  });

  int id;
  String name;
  bool isMainSeries;
  Generation generation;
  List<Name> names;
  List<AbilityEffectEntry> effectEntries;
  List<EffectChange> effectChanges;
  List<FlavorTextEntry> flavorTextEntries;
  List<Pokemon> pokemon;

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        id: json["id"],
        name: json["name"],
        isMainSeries: json["is_main_series"],
        generation: Generation.fromJson(json["generation"]),
        names: List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
        effectEntries: List<AbilityEffectEntry>.from(
            json["effect_entries"].map((x) => AbilityEffectEntry.fromJson(x))),
        effectChanges: List<EffectChange>.from(
            json["effect_changes"].map((x) => EffectChange.fromJson(x))),
        flavorTextEntries: List<FlavorTextEntry>.from(
            json["flavor_text_entries"]
                .map((x) => FlavorTextEntry.fromJson(x))),
        pokemon:
            List<Pokemon>.from(json["pokemon"].map((x) => Pokemon.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "is_main_series": isMainSeries,
        "generation": generation.toJson(),
        "names": List<dynamic>.from(names.map((x) => x.toJson())),
        "effect_entries":
            List<dynamic>.from(effectEntries.map((x) => x.toJson())),
        "effect_changes":
            List<dynamic>.from(effectChanges.map((x) => x.toJson())),
        "flavor_text_entries":
            List<dynamic>.from(flavorTextEntries.map((x) => x.toJson())),
        "pokemon": List<dynamic>.from(pokemon.map((x) => x.toJson())),
      };
}

class EffectChange {
  EffectChange({
    required this.versionGroup,
    required this.effectEntries,
  });

  Generation versionGroup;
  List<EffectChangeEffectEntry> effectEntries;

  factory EffectChange.fromJson(Map<String, dynamic> json) => EffectChange(
        versionGroup: Generation.fromJson(json["version_group"]),
        effectEntries: List<EffectChangeEffectEntry>.from(json["effect_entries"]
            .map((x) => EffectChangeEffectEntry.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "version_group": versionGroup.toJson(),
        "effect_entries":
            List<dynamic>.from(effectEntries.map((x) => x.toJson())),
      };
}

class EffectChangeEffectEntry {
  EffectChangeEffectEntry({
    required this.effect,
    required this.language,
  });

  String effect;
  Generation language;

  factory EffectChangeEffectEntry.fromJson(Map<String, dynamic> json) =>
      EffectChangeEffectEntry(
        effect: json["effect"],
        language: Generation.fromJson(json["language"]),
      );

  Map<String, dynamic> toJson() => {
        "effect": effect,
        "language": language.toJson(),
      };
}

class Generation {
  Generation({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Generation.fromJson(Map<String, dynamic> json) => Generation(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class AbilityEffectEntry {
  AbilityEffectEntry({
    required this.effect,
    required this.shortEffect,
    required this.language,
  });

  String effect;
  String shortEffect;
  Generation language;

  factory AbilityEffectEntry.fromJson(Map<String, dynamic> json) =>
      AbilityEffectEntry(
        effect: json["effect"],
        shortEffect: json["short_effect"],
        language: Generation.fromJson(json["language"]),
      );

  Map<String, dynamic> toJson() => {
        "effect": effect,
        "short_effect": shortEffect,
        "language": language.toJson(),
      };
}

class FlavorTextEntry {
  FlavorTextEntry({
    required this.flavorText,
    required this.language,
    required this.versionGroup,
  });

  String flavorText;
  Generation language;
  Generation versionGroup;

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) =>
      FlavorTextEntry(
        flavorText: json["flavor_text"],
        language: Generation.fromJson(json["language"]),
        versionGroup: Generation.fromJson(json["version_group"]),
      );

  Map<String, dynamic> toJson() => {
        "flavor_text": flavorText,
        "language": language.toJson(),
        "version_group": versionGroup.toJson(),
      };
}

class Name {
  Name({
    required this.name,
    required this.language,
  });

  String name;
  Generation language;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        name: json["name"],
        language: Generation.fromJson(json["language"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "language": language.toJson(),
      };
}

class Pokemon {
  Pokemon({
    required this.isHidden,
    required this.slot,
    required this.pokemon,
  });

  bool isHidden;
  int slot;
  Generation pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        isHidden: json["is_hidden"],
        slot: json["slot"],
        pokemon: Generation.fromJson(json["pokemon"]),
      );

  Map<String, dynamic> toJson() => {
        "is_hidden": isHidden,
        "slot": slot,
        "pokemon": pokemon.toJson(),
      };
}
