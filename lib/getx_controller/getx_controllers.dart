import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knovies/model/popular/popular_movies_model.dart';
import 'package:knovies/model/popular/popular_series_model.dart';
import 'package:knovies/model/trending/trending_model.dart';
import 'package:knovies/services/popular_movies_services.dart';
import 'package:knovies/services/popular_series_services.dart';
import 'package:knovies/services/trending_services.dart';
import 'package:logger/logger.dart';

class GetxControllers extends GetxController {
  final trendingMoviesList = TrendingModel().obs;
  final trendingSeriesList = TrendingModel().obs;
  final popularMoviesList = PopularMoviesModel().obs;
  final popularSeriesList = PopularSeriesModel().obs;
  final isTrendingMoviesListLoading = false.obs;
  final isTrendingSeriesListLoading = false.obs;
  final isPopularMoviesList = false.obs;
  final isPopularSeriesList = false.obs;
  final scrollControllerTrendingMovies = ScrollController().obs;
  final scrollControllerPopularMovies = ScrollController().obs;
  final scrollControllerTrendingSeries = ScrollController().obs;
  final scrollControllerPopularSeries = ScrollController().obs;
  final moviesType = "week".obs;

  @override
  void onInit() {
    fetchMoviesTrendingList(moviesType.value,"movies");
    fetchSeriesTrendingList(moviesType.value,"tv");
    fetchPopularMoivesist();
    fetchPopularSeriesList();
  }

  fetchMoviesTrendingList(String type,String media) async {
    isTrendingMoviesListLoading(true);
    var list = await TrendingServices.fetchTrending(type,media);
    if (list != null) {
      trendingMoviesList.value = list;
      isTrendingMoviesListLoading(false);
    }
  }

  fetchSeriesTrendingList(String type,String media) async {
    isTrendingSeriesListLoading(true);
    var list = await TrendingServices.fetchTrending(type,media);
    if (list != null) {
      trendingSeriesList.value = list;
      isTrendingSeriesListLoading(false);
    }
  }
  fetchPopularMoivesist() async {
    isPopularMoviesList (true);
    var list = await PopularMoviesServices.fetchPopularMovies();
    if (list != null) {
      popularMoviesList.value = list;
      isPopularMoviesList (false);
    }
  }
  fetchPopularSeriesList() async {
    isPopularSeriesList(true);
    var list = await PopularSeriesServices.fetchPopularSeries();
    var logger = Logger();
    logger.d(list!.results!.length);
    if (list != null) {
      popularSeriesList.value = list;
      isPopularSeriesList(false);
    }
  }

  @override
  void onClose() {
    scrollControllerTrendingMovies.value.dispose();
    scrollControllerPopularMovies.value.dispose();
    scrollControllerTrendingSeries.value.dispose();
    scrollControllerPopularSeries.value.dispose();
  }

  @override
  void onReady() {}
}
