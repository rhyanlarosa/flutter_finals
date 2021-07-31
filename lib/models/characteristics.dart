// To parse this JSON data, do
//
//     final characteristics = characteristicsFromJson(jsonString);

import 'dart:convert';

Characteristics characteristicsFromJson(String str) =>
    Characteristics.fromJson(json.decode(str));

String characteristicsToJson(Characteristics data) =>
    json.encode(data.toJson());

class Characteristics {
  Characteristics({
    required this.id,
    required this.geneModulo,
    required this.possibleValues,
    required this.highestStat,
    required this.descriptions,
  });

  int id;
  int geneModulo;
  List<int> possibleValues;
  HighestStat highestStat;
  List<Description> descriptions;

  factory Characteristics.fromJson(Map<String, dynamic> json) =>
      Characteristics(
        id: json["id"],
        geneModulo: json["gene_modulo"],
        possibleValues: List<int>.from(json["possible_values"].map((x) => x)),
        highestStat: HighestStat.fromJson(json["highest_stat"]),
        descriptions: List<Description>.from(
            json["descriptions"].map((x) => Description.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "gene_modulo": geneModulo,
        "possible_values": List<dynamic>.from(possibleValues.map((x) => x)),
        "highest_stat": highestStat.toJson(),
        "descriptions": List<dynamic>.from(descriptions.map((x) => x.toJson())),
      };
}

class Description {
  Description({
    required this.description,
    required this.language,
  });

  String description;
  HighestStat language;

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        description: json["description"],
        language: HighestStat.fromJson(json["language"]),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "language": language.toJson(),
      };
}

class HighestStat {
  HighestStat({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory HighestStat.fromJson(Map<String, dynamic> json) => HighestStat(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
