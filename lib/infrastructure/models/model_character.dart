import 'dart:convert';

import 'model_info.dart';


ModelCharacter modelCharacterFromJson(String str) =>
    ModelCharacter.fromJson(json.decode(str));

String modelCharacterToJson(ModelCharacter data) => json.encode(data.toJson());

class ModelCharacter {
  final Info? info;
  final List<ResultCharacter>? results;

  ModelCharacter({
    this.info,
    this.results,
  });

  factory ModelCharacter.fromJson(Map<String, dynamic> json) => ModelCharacter(
        info: json["info"] == null ? null : Info.fromJson(json["info"]),
        results: json["results"] == null
            ? []
            : List<ResultCharacter>.from(
                json["results"]!.map((x) => ResultCharacter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info?.toJson(),
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class ResultCharacter {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final LocationCharacter? origin;
  final LocationCharacter? location;
  final String? image;
  final List<String>? episode;
  final String? url;
  final String? created;

  ResultCharacter({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  factory ResultCharacter.fromJson(Map<String, dynamic> json) => ResultCharacter(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        origin:
            json["origin"] == null ? null : LocationCharacter.fromJson(json["origin"]),
        location: json["location"] == null
            ? null
            : LocationCharacter.fromJson(json["location"]),
        image: json["image"],
        episode: json["episode"] == null
            ? []
            : List<String>.from(json["episode"]!.map((x) => x)),
        url: json["url"],
        created: json["created"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "species": species,
        "type": type,
        "gender": gender,
        "origin": origin?.toJson(),
        "location": location?.toJson(),
        "image": image,
        "episode":
            episode == null ? [] : List<dynamic>.from(episode!.map((x) => x)),
        "url": url,
        "created": created,
      };
}

class LocationCharacter {
  final String? name;
  final String? url;

  LocationCharacter({
    this.name,
    this.url,
  });

  factory LocationCharacter.fromJson(Map<String, dynamic> json) => LocationCharacter(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}