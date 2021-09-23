import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knovies/config/palette.dart';
import 'package:knovies/getx_controller/getx_controllers.dart';
import 'package:knovies/getx_controller/getx_details.dart';
import 'package:knovies/widgets/widgets.dart';
import 'package:logger/logger.dart';

class TrendingScreen extends StatelessWidget {
  final GetxControllers screenControllers = Get.put(GetxControllers());
  final GetXDetails getXDetails = Get.put(GetXDetails());

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? buildMobileAppBar()
          : PreferredSize(
              child: WindowsAppBarList(),
              preferredSize: Size(_screenSize.width, 100)),
      drawer: Drawer(
        child: DrawerWidgets(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBar(),
            const SizedBox(
              height: 40.0,
            ),
            MediaTypeDivider(
              mediaType: "Movies",
            ),
            Container(
                padding: const EdgeInsets.only(bottom: 20.0),
                color: Palette.black,
                child: Column(
                  children: [
                    TitleWithToggle(
                      screenControllers: screenControllers,
                      title: "Trending",
                    ),
                    Obx(() {
                      return screenControllers.isTrendingMoviesListLoading.value
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Container(
                              color: Palette.lightGreen,
                              height: 290.0,
                              padding: const EdgeInsets.only(top: 30),
                              width: _screenSize.width * 0.91,
                              child: RawScrollbar(
                                thumbColor: Colors.amber,
                                isAlwaysShown: true,
                                controller: screenControllers
                                    .scrollControllerTrendingMovies.value,
                                child: ListView.builder(
                                    controller: screenControllers
                                        .scrollControllerTrendingMovies.value,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: screenControllers
                                        .trendingMoviesList
                                        .value
                                        .results!
                                        .length,
                                    itemBuilder: (context, index) {
                                      final trending = screenControllers
                                          .trendingMoviesList
                                          .value
                                          .results![index];
                                      return TrendingList(
                                          id: trending.id,
                                          image: trending.posterPath,
                                          backImage: trending.backdropPath,
                                          rating: trending.voteAverage,
                                          mediaType: "moive",
                                          screenControllers: getXDetails);
                                    }),
                              ),
                            );
                    }),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TitleWithToggle(
                      screenControllers: screenControllers,
                      title: "Popular",
                      toggle: false,
                    ),
                    Obx(() {
                      return screenControllers.isPopularMoviesList.value
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Container(
                              color: Palette.lightGreen,
                              height: 290.0,
                              padding: const EdgeInsets.only(top: 30),
                              width: _screenSize.width * 0.91,
                              child: RawScrollbar(
                                thumbColor: Colors.amber,
                                isAlwaysShown: true,
                                controller: screenControllers
                                    .scrollControllerPopularMovies.value,
                                child: ListView.builder(
                                    controller: screenControllers
                                        .scrollControllerPopularMovies.value,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: screenControllers
                                        .popularMoviesList
                                        .value
                                        .results!
                                        .length,
                                    itemBuilder: (context, index) {
                                      final trending = screenControllers
                                          .popularMoviesList
                                          .value
                                          .results![index];
                                      return TrendingList(
                                          id: trending.id,
                                          image: trending.posterPath,
                                          backImage: trending.backdropPath,
                                          rating: trending.voteAverage,
                                          mediaType: "moive",
                                          screenControllers: getXDetails);
                                    }),
                              ),
                            );
                    }),
                  ],
                )),
            const SizedBox(
              height: 40.0,
            ),
            MediaTypeDivider(
              mediaType: "Series",
            ),
            Container(
                color: Palette.black,
                child: Column(
                  children: [
                    TitleWithToggle(
                      screenControllers: screenControllers,
                      title: "Trending",
                      movieType: false,
                    ),
                    Obx(() {
                      return screenControllers.isTrendingSeriesListLoading.value
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Container(
                              color: Palette.lightGreen,
                              height: 290.0,
                              padding: const EdgeInsets.only(top: 30),
                              width: _screenSize.width * 0.91,
                              child: RawScrollbar(
                                thumbColor: Colors.amber,
                                isAlwaysShown: true,
                                controller: screenControllers
                                    .scrollControllerTrendingSeries.value,
                                child: ListView.builder(
                                    controller: screenControllers
                                        .scrollControllerTrendingSeries.value,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: screenControllers
                                        .trendingSeriesList
                                        .value
                                        .results!
                                        .length,
                                    itemBuilder: (context, index) {
                                      final trending = screenControllers
                                          .trendingSeriesList
                                          .value
                                          .results![index];
                                      return TrendingList(
                                          id: trending.id,
                                          image: trending.posterPath,
                                          backImage: trending.backdropPath,
                                          rating: trending.voteAverage,
                                          mediaType: "tv",
                                          screenControllers: getXDetails);
                                    }),
                              ),
                            );
                    }),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TitleWithToggle(
                      screenControllers: screenControllers,
                      title: "Popular",
                      toggle: false,
                    ),
                    Obx(() {
                      return screenControllers.isPopularSeriesList.value
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Container(
                              color: Palette.lightGreen,
                              height: 290.0,
                              padding: const EdgeInsets.only(top: 30),
                              width: _screenSize.width * 0.91,
                              child: RawScrollbar(
                                thumbColor: Colors.amber,
                                isAlwaysShown: true,
                                controller: screenControllers
                                    .scrollControllerPopularSeries.value,
                                child: ListView.builder(
                                    controller: screenControllers
                                        .scrollControllerPopularSeries.value,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: screenControllers
                                        .popularSeriesList
                                        .value
                                        .results!
                                        .length,
                                    itemBuilder: (context, index) {
                                      final trending = screenControllers
                                          .popularSeriesList
                                          .value
                                          .results![index];
                                      return TrendingList(
                                          id: trending.id,
                                          image: trending.posterPath,
                                          backImage: trending.backdropPath,
                                          rating: trending.voteAverage,
                                          mediaType: "tv",
                                          screenControllers: getXDetails);
                                    }),
                              ),
                            );
                    }),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
