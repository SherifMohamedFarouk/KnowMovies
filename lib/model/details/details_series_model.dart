import 'dart:convert';
import 'package:knovies/model/details/cast.dart';
import 'package:knovies/model/details/images.dart';
import 'package:knovies/model/details/videos.dart';

import 'external_ids.dart';

DetailsSeriesModel detailsSeriesModelFromJson(String str) => DetailsSeriesModel.fromJson(json.decode(str));

String detailsSeriesModelToJson(DetailsSeriesModel data) => json.encode(data.toJson());

class DetailsSeriesModel {
  DetailsSeriesModel({
    this.backdropPath,
    this.createdBy,
    this.episodeRunTime,
    this.firstAirDate,
    this.genres,
    this.homepage,
    this.id,
    this.inProduction,
    this.languages,
    this.lastAirDate,
    this.lastEpisodeToAir,
    this.name,
    this.nextEpisodeToAir,
    this.networks,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.seasons,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.type,
    this.voteAverage,
    this.voteCount,
    this.videos,
    this.credits,
    this.images,
    this.externalIds,
  });

  final String? backdropPath;
  final List<dynamic>? createdBy;
  final List<dynamic>? episodeRunTime;
  final DateTime? firstAirDate;
  final List<Genre> ?genres;
  final String? homepage;
  final int? id;
  final bool? inProduction;
  final List<dynamic>? languages;
  final DateTime? lastAirDate;
  final TEpisodeToAir? lastEpisodeToAir;
  final String? name;
  final TEpisodeToAir? nextEpisodeToAir;
  final List<dynamic>? networks;
  final int? numberOfEpisodes;
  final int? numberOfSeasons;
  final List<dynamic>? originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<dynamic>? productionCompanies;
  final List<dynamic>? productionCountries;
  final List<dynamic>? seasons;
  final List<dynamic>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? type;
  final double? voteAverage;
  final int? voteCount;
  final Videos? videos;
  final Credits? credits;
  final Images? images;
  final ExternalIds? externalIds;

  factory DetailsSeriesModel.fromJson(Map<String, dynamic> json) => DetailsSeriesModel(
    backdropPath: json["backdrop_path"],
    createdBy: List<dynamic>.from(json["created_by"].map((x) => x)),
    episodeRunTime: List<dynamic>.from(json["episode_run_time"].map((x) => x)),
    firstAirDate: DateTime.parse(json["first_air_date"]),
    genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
    homepage: json["homepage"],
    id: json["id"],
    inProduction: json["in_production"],
    languages: List<dynamic>.from(json["languages"].map((x) => x)),
    lastAirDate: DateTime.parse(json["last_air_date"]),
    lastEpisodeToAir: TEpisodeToAir.fromJson(json["last_episode_to_air"]),
    name: json["name"],
    nextEpisodeToAir: TEpisodeToAir.fromJson(json["next_episode_to_air"]),
    networks: List<dynamic>.from(json["networks"].map((x) => x)),
    numberOfEpisodes: json["number_of_episodes"],
    numberOfSeasons: json["number_of_seasons"],
    originCountry: List<dynamic>.from(json["origin_country"].map((x) => x)),
    originalLanguage: json["original_language"],
    originalName: json["original_name"],
    overview: json["overview"],
    popularity: json["popularity"].toDouble(),
    posterPath: json["poster_path"],
    productionCompanies: List<dynamic>.from(json["production_companies"].map((x) => x)),
    productionCountries: List<dynamic>.from(json["production_countries"].map((x) => x)),
    seasons: List<dynamic>.from(json["seasons"].map((x) => x)),
    spokenLanguages: List<dynamic>.from(json["spoken_languages"].map((x) => x)),
    status: json["status"],
    tagline: json["tagline"],
    type: json["type"],
    voteAverage: json["vote_average"].toDouble(),
    voteCount: json["vote_count"],
    videos: Videos.fromJson(json["videos"]),
    credits: Credits.fromJson(json["credits"]),
    images: Images.fromJson(json["images"]),
    externalIds: ExternalIds.fromJson(json["external_ids"]),
  );

  Map<String, dynamic> toJson() => {
    "backdrop_path": backdropPath,
    "created_by": List<dynamic>.from(createdBy!.map((x) => x)),
    "episode_run_time": List<dynamic>.from(episodeRunTime!.map((x) => x)),
    "first_air_date": "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
    "genres": List<dynamic>.from(genres!.map((x) => x.toJson())),
    "homepage": homepage,
    "id": id,
    "in_production": inProduction,
    "languages": List<dynamic>.from(languages!.map((x) => x)),
    "last_air_date": "${lastAirDate!.year.toString().padLeft(4, '0')}-${lastAirDate!.month.toString().padLeft(2, '0')}-${lastAirDate!.day.toString().padLeft(2, '0')}",
    "last_episode_to_air": lastEpisodeToAir!.toJson(),
    "name": name,
    "next_episode_to_air": nextEpisodeToAir!.toJson(),
    "networks": List<dynamic>.from(networks!.map((x) => x)),
    "number_of_episodes": numberOfEpisodes,
    "number_of_seasons": numberOfSeasons,
    "origin_country": List<dynamic>.from(originCountry!.map((x) => x)),
    "original_language": originalLanguage,
    "original_name": originalName,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "production_companies": List<dynamic>.from(productionCompanies!.map((x) => x)),
    "production_countries": List<dynamic>.from(productionCountries!.map((x) => x)),
    "seasons": List<dynamic>.from(seasons!.map((x) => x)),
    "spoken_languages": List<dynamic>.from(spokenLanguages!.map((x) => x)),
    "status": status,
    "tagline": tagline,
    "type": type,
    "vote_average": voteAverage,
    "vote_count": voteCount,
    "videos": videos!.toJson(),
    "credits": credits!.toJson(),
    "images": images!.toJson(),
    "external_ids": externalIds!.toJson(),
  };
}
class Genre {
  Genre({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}


class TEpisodeToAir {
  TEpisodeToAir();

  factory TEpisodeToAir.fromJson(Map<String, dynamic> json) => TEpisodeToAir(
  );

  Map<String, dynamic> toJson() => {
  };
}



