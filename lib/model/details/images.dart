class Images {
  Images({
    this.backdrops,
    this.logos,
    this.posters,
  });

  final List<Backdrop>? backdrops;
  final List<Backdrop>? logos;
  final List<Backdrop>? posters;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    backdrops: List<Backdrop>.from(json["backdrops"].map((x) => Backdrop.fromJson(x))),
    logos: List<Backdrop>.from(json["logos"].map((x) => Backdrop.fromJson(x))),
    posters: List<Backdrop>.from(json["posters"].map((x) => Backdrop.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "backdrops": List<dynamic>.from(backdrops!.map((x) => x.toJson())),
    "logos": List<dynamic>.from(logos!.map((x) => x.toJson())),
    "posters": List<dynamic>.from(posters!.map((x) => x.toJson())),
  };
}

class Backdrop {
  Backdrop({
    this.aspectRatio,
    this.height,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  final double? aspectRatio;
  final int? height;
  final String? iso6391;
  final String? filePath;
  final double? voteAverage;
  final int? voteCount;
  final int? width;

  factory Backdrop.fromJson(Map<String, dynamic> json) => Backdrop(
    aspectRatio: json["aspect_ratio"].toDouble(),
    height: json["height"],
    iso6391: json["iso_639_1"] == null ? null : json["iso_639_1"],
    filePath: json["file_path"],
    voteAverage: json["vote_average"].toDouble(),
    voteCount: json["vote_count"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "aspect_ratio": aspectRatio,
    "height": height,
    "iso_639_1": iso6391 == null ? null : iso6391,
    "file_path": filePath,
    "vote_average": voteAverage,
    "vote_count": voteCount,
    "width": width,
  };
}