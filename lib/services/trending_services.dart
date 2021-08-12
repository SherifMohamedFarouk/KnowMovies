import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:knovies/model/trending_model.dart';
import 'package:logger/logger.dart';

class PopularServices{
  String type ;
  PopularServices({required this.type});
  static var client =http.Client();

  static Future<TrendingModel?> fetchTrending(type ) async{
    var url= Uri.parse("https://api.themoviedb.org/3/trending/all/${type.toString()}?api_key=df3b5f4967782c690e9e21861634f917");
    var response = await client.get(url);
    var logger = Logger();
    logger.d(url);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      logger.d(jsonString );
      return trendingModelFromJson(jsonString);
    }

  }

}