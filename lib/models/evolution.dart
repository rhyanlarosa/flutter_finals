// To parse this JSON data, do
//
//     final evolution = evolutionFromJson(jsonString);

import 'dart:convert';

Evolution evolutionFromJson(String str) => Evolution.fromJson(json.decode(str));

String evolutionToJson(Evolution data) => json.encode(data.toJson());

class Evolution {
    Evolution({
        required this.id,
        this.babyTriggerItem,
        required this.chain,
    });

    int id;
    dynamic babyTriggerItem;
    Chain chain;

    factory Evolution.fromJson(Map<String, dynamic> json) => Evolution(
        id: json["id"],
        babyTriggerItem: json["baby_trigger_item"],
        chain: Chain.fromJson(json["chain"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "baby_trigger_item": babyTriggerItem,
        "chain": chain.toJson(),
    };
}

class Chain {
    Chain({
        required this.isBaby,
        required this.species,
        required this.evolutionDetails,
        required this.evolvesTo,
    });

    bool isBaby;
    Species species;
    List<EvolutionDetail> evolutionDetails;
    List<Chain> evolvesTo;

    factory Chain.fromJson(Map<String, dynamic> json) => Chain(
        isBaby: json["is_baby"],
        species: Species.fromJson(json["species"]),
        evolutionDetails: List<EvolutionDetail>.from(json["evolution_details"].map((x) => EvolutionDetail.fromJson(x))),
        evolvesTo: List<Chain>.from(json["evolves_to"].map((x) => Chain.fromJson(x))),
    );

  get evolution => null;

    Map<String, dynamic> toJson() => {
        "is_baby": isBaby,
        "species": species.toJson(),
        "evolution_details": evolutionDetails == null ? null : List<dynamic>.from(evolutionDetails.map((x) => x.toJson())),
        "evolves_to": List<dynamic>.from(evolvesTo.map((x) => x.toJson())),
    };
}

class EvolutionDetail {
    EvolutionDetail({
        this.item,
        required this.trigger,
        this.gender,
        this.heldItem,
        this.knownMove,
        this.knownMoveType,
        this.location,
        required this.minLevel,
        this.minHappiness,
        this.minBeauty,
        this.minAffection,
        required this.needsOverworldRain,
        this.partySpecies,
        this.partyType,
        this.relativePhysicalStats,
        required this.timeOfDay,
        this.tradeSpecies,
        required this.turnUpsideDown,
    });

    dynamic item;
    Species trigger;
    dynamic gender;
    dynamic heldItem;
    dynamic knownMove;
    dynamic knownMoveType;
    dynamic location;
    int minLevel;
    dynamic minHappiness;
    dynamic minBeauty;
    dynamic minAffection;
    bool needsOverworldRain;
    dynamic partySpecies;
    dynamic partyType;
    dynamic relativePhysicalStats;
    String timeOfDay;
    dynamic tradeSpecies;
    bool turnUpsideDown;

    factory EvolutionDetail.fromJson(Map<String, dynamic> json) => EvolutionDetail(
        item: json["item"],
        trigger: Species.fromJson(json["trigger"]),
        gender: json["gender"],
        heldItem: json["held_item"],
        knownMove: json["known_move"],
        knownMoveType: json["known_move_type"],
        location: json["location"],
        minLevel: json["min_level"],
        minHappiness: json["min_happiness"],
        minBeauty: json["min_beauty"],
        minAffection: json["min_affection"],
        needsOverworldRain: json["needs_overworld_rain"],
        partySpecies: json["party_species"],
        partyType: json["party_type"],
        relativePhysicalStats: json["relative_physical_stats"],
        timeOfDay: json["time_of_day"],
        tradeSpecies: json["trade_species"],
        turnUpsideDown: json["turn_upside_down"],
    );

    Map<String, dynamic> toJson() => {
        "item": item,
        "trigger": trigger.toJson(),
        "gender": gender,
        "held_item": heldItem,
        "known_move": knownMove,
        "known_move_type": knownMoveType,
        "location": location,
        "min_level": minLevel,
        "min_happiness": minHappiness,
        "min_beauty": minBeauty,
        "min_affection": minAffection,
        "needs_overworld_rain": needsOverworldRain,
        "party_species": partySpecies,
        "party_type": partyType,
        "relative_physical_stats": relativePhysicalStats,
        "time_of_day": timeOfDay,
        "trade_species": tradeSpecies,
        "turn_upside_down": turnUpsideDown,
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
