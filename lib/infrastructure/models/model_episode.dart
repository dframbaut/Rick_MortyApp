import 'dart:convert';

import 'model_info.dart';

ModelEpisode modelEpisodeFromJson(String str) =>
    ModelEpisode.fromJson(json.decode(str));

String modelEpisodeToJson(ModelEpisode data) => json.encode(data.toJson());

class ModelEpisode {
  final Info? info;
  final List<ResultEpisode>? results;

  ModelEpisode({
    this.info,
    this.results,
  });

  factory ModelEpisode.fromJson(Map<String, dynamic> json) => ModelEpisode(
        info: json["info"] == null ? null : Info.fromJson(json["info"]),
        results: json["results"] == null
            ? []
            : List<ResultEpisode>.from(
                json["results"]!.map((x) => ResultEpisode.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info?.toJson(),
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class ResultEpisode {
  final int? id;
  final String? name;
  final String? airDate;
  final String? episode;
  final List<String>? characters;
  final String? url;
  final String? created;

  ResultEpisode({
    this.id,
    this.name,
    this.airDate,
    this.episode,
    this.characters,
    this.url,
    this.created,
  });

  factory ResultEpisode.fromJson(Map<String, dynamic> json) => ResultEpisode(
        id: json["id"],
        name: json["name"],
        airDate: json["air_date"],
        episode: json["episode"],
        characters: json["characters"] == null
            ? []
            : List<String>.from(json["characters"]!.map((x) => x)),
        url: json["url"],
        created: json["created"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "air_date": airDate,
        "episode": episode,
        "characters": characters == null
            ? []
            : List<dynamic>.from(characters!.map((x) => x)),
        "url": url,
        "created": created,
      };
}