class Result {
  Result({
    this.overview,
    this.releaseDate,
    this.title,
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.posterPath,
    this.voteCount,
    this.id,
    this.voteAverage,
    this.video,
    this.popularity,
    this.mediaType,
    this.name,
    this.originalName,
    this.firstAirDate,
    this.originCountry,
  });

  String ?overview;
  DateTime ?releaseDate;
  String? title;
  bool ?adult;
  String ?backdropPath;
  List<int> ?genreIds;
  OriginalLanguage ?originalLanguage;
  String ?originalTitle;
  String ?posterPath;
  int ?voteCount;
  int ?id;
  double ?voteAverage;
  bool ?video;
  double ?popularity;
  MediaType ?mediaType;
  String ?name;
  String ?originalName;
  DateTime ?firstAirDate;
  List<String> ?originCountry;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    overview: json["overview"],
    releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
    title: json["title"] == null ? null : json["title"],
    adult: json["adult"] == null ? null : json["adult"],
    backdropPath: json["backdrop_path"],
    genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    originalLanguage: originalLanguageValues.map[json["original_language"]],
    originalTitle: json["original_title"] == null ? null : json["original_title"],
    posterPath: json["poster_path"],
    voteCount: json["vote_count"],
    id: json["id"],
    voteAverage: json["vote_average"].toDouble(),
    video: json["video"] == null ? null : json["video"],
    popularity: json["popularity"].toDouble(),
    mediaType: mediaTypeValues.map[json["media_type"]],
    name: json["name"] == null ? null : json["name"],
    originalName: json["original_name"] == null ? null : json["original_name"],
    firstAirDate: json["first_air_date"] == null ? null : DateTime.parse(json["first_air_date"]),
    originCountry: json["origin_country"] == null ? null : List<String>.from(json["origin_country"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "overview": overview,
    "release_date": releaseDate == null ? null : "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
    "title": title == null ? null : title,
    "adult": adult == null ? null : adult,
    "backdrop_path": backdropPath,
    "genre_ids": List<dynamic>.from(genreIds!.map((x) => x)),
    "original_language": originalLanguageValues.reverse![originalLanguage],
    "original_title": originalTitle == null ? null : originalTitle,
    "poster_path": posterPath,
    "vote_count": voteCount,
    "id": id,
    "vote_average": voteAverage,
    "video": video == null ? null : video,
    "popularity": popularity,
    "media_type": mediaTypeValues.reverse![mediaType],
    "name": name == null ? null : name,
    "original_name": originalName == null ? null : originalName,
    "first_air_date": firstAirDate == null ? null : "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
    "origin_country": originCountry == null ? null : List<dynamic>.from(originCountry!.map((x) => x)),
  };
}

enum MediaType { MOVIE, TV }

final mediaTypeValues = EnumValues({
  "movie": MediaType.MOVIE,
  "tv": MediaType.TV
});

enum OriginalLanguage { EN, FR, CN }

final originalLanguageValues = EnumValues({
  "cn": OriginalLanguage.CN,
  "en": OriginalLanguage.EN,
  "fr": OriginalLanguage.FR
});

class EnumValues<T> {
  Map<String, dynamic> map;
  Map<String, dynamic> ?reverseMap;

  EnumValues(this.map);

  Map<String, dynamic>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}