import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knovies/model/trending_model.dart';
import 'package:knovies/services/trending_services.dart';
import 'package:logger/logger.dart';

class GetxControllers extends GetxController {
  var trendingList = TrendingModel().obs;
  var isTrendingLoading = false.obs;
  var scrollControllerTrendingMovies = ScrollController().obs;
  var scrollControllerPopularMovies = ScrollController().obs;
  var scrollControllerTrendingSeries = ScrollController().obs;
  var scrollControllerPopularSeries = ScrollController().obs;
  var moviesType = "week".obs;



  @override
  void onInit() {
    fetchTrendingList(moviesType.value);
  }

  fetchTrendingList(String type) async {
    isTrendingLoading(true);
    var list = await PopularServices.fetchTrending(type);
    var logger = Logger();
    logger.d(list!.results!.length);
    if (list != null) {
      trendingList.value = list;
      isTrendingLoading(false);
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
  void onReady() {

  }
}

