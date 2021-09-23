class ExternalIds {
  ExternalIds({
    this.imdbId,
    this.facebookId,
    this.instagramId,
    this.twitterId,
  });

  final String? imdbId;
  final String? facebookId;
  final String? instagramId;
  final String? twitterId;

  factory ExternalIds.fromJson(Map<String, dynamic> json) => ExternalIds(
    imdbId: json["imdb_id"],
    facebookId: json["facebook_id"],
    instagramId: json["instagram_id"],
    twitterId: json["twitter_id"],
  );

  Map<String, dynamic> toJson() => {
    "imdb_id": imdbId,
    "facebook_id": facebookId,
    "instagram_id": instagramId,
    "twitter_id": twitterId,
  };
}