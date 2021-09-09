class Credits {
  Credits({
    this.cast,
    this.crew,
  });

  final List<Cast>? cast;
  final List<Cast>? crew;

  factory Credits.fromJson(Map<String, dynamic> json) => Credits(
    cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
    crew: List<Cast>.from(json["crew"].map((x) => Cast.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cast": List<dynamic>.from(cast!.map((x) => x.toJson())),
    "crew": List<dynamic>.from(crew!.map((x) => x.toJson())),
  };
}


class Cast {
  Cast({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.character,
    this.creditId,
    this.order,
    this.department,
    this.job,
  });

  final bool? adult;
  final int? gender;
  final int? id;
  final Department? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;
  final String? character;
  final String? creditId;
  final int? order;
  final Department? department;
  final String? job;

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
    adult: json["adult"],
    gender: json["gender"],
    id: json["id"],
    knownForDepartment: departmentValues.map[json["known_for_department"]],
    name: json["name"],
    originalName: json["original_name"],
    popularity: json["popularity"].toDouble(),
    profilePath: json["profile_path"] == null ? null : json["profile_path"],
    character: json["character"] == null ? null : json["character"],
    creditId: json["credit_id"],
    order: json["order"] == null ? null : json["order"],
    department: json["department"] == null ? null : departmentValues.map[json["department"]],
    job: json["job"] == null ? null : json["job"],
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "gender": gender,
    "id": id,
    "known_for_department": departmentValues.reverse![knownForDepartment],
    "name": name,
    "original_name": originalName,
    "popularity": popularity,
    "profile_path": profilePath == null ? null : profilePath,
    "character": character == null ? null : character,
    "credit_id": creditId,
    "order": order == null ? null : order,
    "department": department == null ? null : departmentValues.reverse![department],
    "job": job == null ? null : job,
  };
}

enum Department { ACTING, PRODUCTION, SOUND, WRITING, ART, VISUAL_EFFECTS, DIRECTING, CREW, EDITING, LIGHTING }

final departmentValues = EnumValues({
  "Acting": Department.ACTING,
  "Art": Department.ART,
  "Crew": Department.CREW,
  "Directing": Department.DIRECTING,
  "Editing": Department.EDITING,
  "Lighting": Department.LIGHTING,
  "Production": Department.PRODUCTION,
  "Sound": Department.SOUND,
  "Visual Effects": Department.VISUAL_EFFECTS,
  "Writing": Department.WRITING
});

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