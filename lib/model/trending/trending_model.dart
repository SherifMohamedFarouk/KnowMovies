import 'dart:convert';

import 'package:knovies/model/trending/trending_result.dart';

TrendingModel trendingModelFromJson(String str) => TrendingModel.fromJson(json.decode(str));

String trendingModelToJson(TrendingModel data) => json.encode(data.toJson());

class TrendingModel {
  TrendingModel({
     this.page,
     this.results,
     this.totalPages,
     this.totalResults,
  });

  int ?page;
  List<Result>? results;
  int ?totalPages;
  int ?totalResults;

  factory TrendingModel.fromJson(Map<String, dynamic> json) => TrendingModel(
    page: json["page"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "results": List<dynamic>.from(results!.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}
