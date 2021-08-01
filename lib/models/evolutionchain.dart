// To parse this JSON data, do
//
//     final evolutionchain = evolutionchainFromJson(jsonString);

import 'dart:convert';

Evolutionchain evolutionchainFromJson(String str) =>
    Evolutionchain.fromJson(json.decode(str));

String evolutionchainToJson(Evolutionchain data) => json.encode(data.toJson());

class Evolutionchain {
  Evolutionchain({
    required this.id,
    required this.chain,
  });

  int id;
  Chain chain;

  factory Evolutionchain.fromJson(Map<String, dynamic> json) => Evolutionchain(
        id: json["id"],
        chain: Chain.fromJson(json["chain"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "chain": chain.toJson(),
      };
}

class Chain {
  Chain({
    required this.evolvesTo,
  });

  List<EvolvesTo> evolvesTo;

  factory Chain.fromJson(Map<String, dynamic> json) => Chain(
        evolvesTo: List<EvolvesTo>.from(
            json["evolves_to"].map((x) => EvolvesTo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "evolves_to": List<dynamic>.from(evolvesTo.map((x) => x.toJson())),
      };
}

class EvolvesTo {
  EvolvesTo({
    required this.isBaby,
    required this.species,
    required this.evolvesTo,
  });

  bool isBaby;
  Species species;
  List<dynamic> evolvesTo;

  factory EvolvesTo.fromJson(Map<String, dynamic> json) => EvolvesTo(
        isBaby: json["is_baby"],
        species: Species.fromJson(json["species"]),
        evolvesTo: List<dynamic>.from(json["evolves_to"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "is_baby": isBaby,
        "species": species.toJson(),
        "evolves_to": List<dynamic>.from(evolvesTo.map((x) => x)),
      };
}

class Species {
  Species({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
