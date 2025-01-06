import 'dart:convert';

import 'model_info.dart';


ModelLocation modelLocationFromJson(String str) =>
    ModelLocation.fromJson(json.decode(str));

String modelLocationToJson(ModelLocation data) => json.encode(data.toJson());

class ModelLocation {
  final Info? info;
  final List<ResultLocation>? results;

  ModelLocation({
    this.info,
    this.results,
  });

  factory ModelLocation.fromJson(Map<String, dynamic> json) => ModelLocation(
        info: json["info"] == null ? null : Info.fromJson(json["info"]),
        results: json["results"] == null
            ? []
            : List<ResultLocation>.from(
                json["results"]!.map((x) => ResultLocation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info?.toJson(),
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class ResultLocation {
  final int? id;
  final String? name;
  final String? type;
  final String? dimension;
  final List<String>? residents;
  final String? url;
  final String? created;

  ResultLocation({
    this.id,
    this.name,
    this.type,
    this.dimension,
    this.residents,
    this.url,
    this.created,
  });

  factory ResultLocation.fromJson(Map<String, dynamic> json) => ResultLocation(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        dimension: json["dimension"],
        residents: json["residents"] == null
            ? []
            : List<String>.from(json["residents"]!.map((x) => x)),
        url: json["url"],
        created: json["created"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "dimension": dimension,
        "residents": residents == null
            ? []
            : List<dynamic>.from(residents!.map((x) => x)),
        "url": url,
        "created": created,
      };
}