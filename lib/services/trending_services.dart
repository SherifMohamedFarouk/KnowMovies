import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:knovies/model/trending/trending_model.dart';
import 'package:logger/logger.dart';

class TrendingServices{
  String type ;
  String media ;
  TrendingServices({required this.type,required this.media});
  static var client =http.Client();

  static Future<TrendingModel?> fetchTrending(type ,media) async{
    var url= Uri.parse("https://api.themoviedb.org/3/trending/${media.toString()}/${type.toString()}?api_key=df3b5f4967782c690e9e21861634f917");
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return trendingModelFromJson(jsonString);
    }

  }

}