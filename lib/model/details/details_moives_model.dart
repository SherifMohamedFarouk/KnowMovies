// To parse this JSON data, do
//
//     final detailsMoviesModel = detailsMoviesModelFromJson(jsonString);

import 'dart:convert';

import 'package:knovies/model/details/cast.dart';
import 'package:knovies/model/details/images.dart';
import 'package:knovies/model/details/videos.dart';

DetailsMoviesModel detailsMoviesModelFromJson(String str) => DetailsMoviesModel.fromJson(json.decode(str));

String detailsMoviesModelToJson(DetailsMoviesModel data) => json.encode(data.toJson());

class DetailsMoviesModel {
  DetailsMoviesModel({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.videos,
    this.credits,
    this.images,
  });

  final bool? adult;
  final String? backdropPath;
  final dynamic belongsToCollection;
  final int? budget;
  final List<Genre> ?genres;
  final String? homepage;
  final int? id;
  final String? imdbId;
  final OriginalLanguage? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompany>? productionCompanies;
  final List<ProductionCountry>? productionCountries;
  final DateTime? releaseDate;
  final int? revenue;
  final int? runtime;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  final Videos? videos;
  final Credits? credits;
  final Images? images;

  factory DetailsMoviesModel.fromJson(Map<String, dynamic> json) => DetailsMoviesModel(
    adult: json["adult"],
    backdropPath: json["backdrop_path"],
    belongsToCollection: json["belongs_to_collection"],
    budget: json["budget"],
    genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
    homepage: json["homepage"],
    id: json["id"],
    imdbId: json["imdb_id"],
    originalLanguage: originalLanguageValues.map[json["original_language"]],
    originalTitle: json["original_title"],
    overview: json["overview"],
    popularity: json["popularity"].toDouble(),
    posterPath: json["poster_path"],
    productionCompanies: List<ProductionCompany>.from(json["production_companies"].map((x) => ProductionCompany.fromJson(x))),
    productionCountries: List<ProductionCountry>.from(json["production_countries"].map((x) => ProductionCountry.fromJson(x))),
    releaseDate: DateTime.parse(json["release_date"]),
    revenue: json["revenue"],
    runtime: json["runtime"],
    status: json["status"],
    tagline: json["tagline"],
    title: json["title"],
    video: json["video"],
    voteAverage: json["vote_average"].toDouble(),
    voteCount: json["vote_count"],
    videos: Videos.fromJson(json["videos"]),
    credits: Credits.fromJson(json["credits"]),
    images: Images.fromJson(json["images"]),
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "belongs_to_collection": belongsToCollection,
    "budget": budget,
    "genres": List<dynamic>.from(genres!.map((x) => x.toJson())),
    "homepage": homepage,
    "id": id,
    "imdb_id": imdbId,
    "original_language": originalLanguageValues.reverse![originalLanguage],
    "original_title": originalTitle,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "production_companies": List<dynamic>.from(productionCompanies!.map((x) => x.toJson())),
    "production_countries": List<dynamic>.from(productionCountries!.map((x) => x.toJson())),
    "release_date": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
    "revenue": revenue,
    "runtime": runtime,
    "status": status,
    "tagline": tagline,
    "title": title,
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount,
    "videos": videos!.toJson(),
    "credits": credits!.toJson(),
    "images": images!.toJson(),
  };
}

class Genre {
  Genre({
    this.id,
    this.name,
  });

  final int? id;
  final String? name;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}


enum OriginalLanguage { EN }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN
});

class ProductionCompany {
  ProductionCompany({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  final int? id;
  final String? logoPath;
  final String? name;
  final OriginCountry? originCountry;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) => ProductionCompany(
    id: json["id"],
    logoPath: json["logo_path"],
    name: json["name"],
    originCountry: originCountryValues.map[json["origin_country"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "logo_path": logoPath,
    "name": name,
    "origin_country": originCountryValues.reverse![originCountry],
  };
}

enum OriginCountry { US }

final originCountryValues = EnumValues({
  "US": OriginCountry.US
});

class ProductionCountry {
  ProductionCountry({
    this.iso31661,
    this.name,
  });

  final OriginCountry? iso31661;
  final String? name;

  factory ProductionCountry.fromJson(Map<String, dynamic> json) => ProductionCountry(
    iso31661: originCountryValues.map[json["iso_3166_1"]],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "iso_3166_1": originCountryValues.reverse![iso31661],
    "name": name,
  };
}


class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
