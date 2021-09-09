class Videos {
  Videos({
    this.results,
  });

  final List<Result>? results;

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  final String? iso6391;
  final String? iso31661;
  final String? name;
  final String? key;
  final String? site;
  final int? size;
  final String? type;
  final bool? official;
  final DateTime? publishedAt;
  final String? id;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    iso6391: json["iso_639_1"],
    iso31661: json["iso_3166_1"],
    name: json["name"],
    key: json["key"],
    site: json["site"],
    size: json["size"],
    type: json["type"],
    official: json["official"],
    publishedAt: DateTime.parse(json["published_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "iso_639_1": iso6391,
    "iso_3166_1": iso31661,
    "name": name,
    "key": key,
    "site": site,
    "size": size,
    "type": type,
    "official": official,
    "published_at": publishedAt.toString(),
    "id": id,
  };
}