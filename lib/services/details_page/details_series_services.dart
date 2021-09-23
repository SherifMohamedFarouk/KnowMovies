import 'package:http/http.dart' as http;
import 'package:knovies/model/details/details_moives_model.dart';
import 'package:knovies/model/details/details_series_model.dart';
import 'package:knovies/model/popular/popular_movies_model.dart';
import 'package:logger/logger.dart';

class DetailsSeriesServices{
  static var client =http.Client();
  String id;
  DetailsSeriesServices({required this.id});

  static Future<DetailsSeriesModel?> fetchDetailsSeries(id) async{
    var url= Uri.parse("https://api.themoviedb.org/3/tv/${id}?api_key=df3b5f4967782c690e9e21861634f917&append_to_response=videos,credits,images,external_ids");
    var response = await client.get(url);
    var logger = Logger();
    logger.d(url);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      logger.d(jsonString);
      return detailsSeriesModelFromJson(jsonString);
    }

  }

}