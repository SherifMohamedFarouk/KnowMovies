import 'package:http/http.dart' as http;
import 'package:knovies/model/details/details_moives_model.dart';
import 'package:knovies/model/popular/popular_movies_model.dart';
import 'package:logger/logger.dart';

class DetailsMoviesServices{
  static var client =http.Client();
  String id;
  DetailsMoviesServices({required this.id});

  static Future<DetailsMoviesModel?> fetchDetailsMovies(id) async{
    var url= Uri.parse("https://api.themoviedb.org/3/movie/${id}?api_key=df3b5f4967782c690e9e21861634f917&language=en-US&append_to_response=videos,credits,images,external_ids");
    var response = await client.get(url);
    var logger = Logger();
    logger.d(url);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      logger.d(jsonString);
      return detailsMoviesModelFromJson(jsonString);
    }

  }

}