import 'package:get/get.dart';
import 'package:knovies/model/trending_model.dart';
import 'package:knovies/services/trending_services.dart';
import 'package:logger/logger.dart';

class GetxControllers extends GetxController {
  var trendingList = TrendingModel().obs;
  var isTrendingLoading = false.obs;


  @override
  void onInit() {
    fetchTrendingList("day");
  }

  fetchTrendingList(String type) async {
    isTrendingLoading(true);
    var list = await PopularServices.fetchTrending(type);
    var logger = Logger();
    logger.d(list!.results![0].title);
    if (list != null) {
      trendingList.value = list;
      isTrendingLoading(false);
    }
  }

  @override
  void onClose() {

  }

  @override
  void onReady() {

  }
}

