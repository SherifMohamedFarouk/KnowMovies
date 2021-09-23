import 'package:get/get.dart';
import 'package:knovies/model/details/details_moives_model.dart';
import 'package:knovies/model/details/details_series_model.dart';
import 'package:knovies/services/details_page/details_movies_services.dart';
import 'package:knovies/services/details_page/details_series_services.dart';
import 'package:logger/logger.dart';

class GetXDetails extends GetxController{
  final detailsMoviesList = DetailsMoviesModel().obs;
  final detailsSeriesList = DetailsSeriesModel().obs;
  final isDetailsMoviesListLoading = false.obs;
  final isDetailsSeriesListLoading = false.obs;


  @override
  void onInit() {
    fetchDetailsMovies();
    fetchDetailsSeries();
  }

  fetchDetailsMovies() async {
    isDetailsMoviesListLoading (true);
    var list = await DetailsMoviesServices.fetchDetailsMovies();
    var logger = Logger();
    logger.d(list!.id);
    if (list != null) {
      detailsMoviesList.value = list;
      isDetailsMoviesListLoading (false);
    }
  }
  fetchDetailsSeries() async {
    isDetailsSeriesListLoading (true);
    var list = await DetailsSeriesServices.fetchDetailsSeries();
    var logger = Logger();
    logger.d(list!.id);
    if (list != null) {
      detailsSeriesList.value = list;
      isDetailsSeriesListLoading (false);
    }
  }

  @override
  void onClose() {

  }

  @override
  void onReady() {

  }
}