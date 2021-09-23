import 'package:http/http.dart' as http;
import 'package:knovies/model/popular/popular_series_model.dart';
import 'package:logger/logger.dart';

class PopularSeriesServices{
  static var client =http.Client();

  static Future<PopularSeriesModel?> fetchPopularSeries() async{
    var url= Uri.parse("https://api.themoviedb.org/3/tv/popular?api_key=df3b5f4967782c690e9e21861634f917&language=en-US&page=1");
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return popularSeriesModelFromJson(jsonString);
    }

  }

}