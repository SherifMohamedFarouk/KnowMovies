import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knovies/config/palette.dart';
import 'package:knovies/getx_controller/getx_controllers.dart';
import 'package:knovies/widgets/widgets.dart';
import 'package:logger/logger.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:toggle_switch/toggle_switch.dart';

class TrendingScreen extends StatelessWidget {
  final GetxControllers screenControllers = Get.put(GetxControllers());

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
                      : TrendingList(screenControllers: screenControllers.trendingMoviesList.value.results,scrollController: screenControllers.scrollControllerTrendingMovies.value,);
                }),
                const SizedBox(height: 20.0,),
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
                      : TrendingList(screenControllers: screenControllers.popularMoviesList.value.results,scrollController:screenControllers.scrollControllerPopularMovies.value ,);
                }),

              ],
            )),
            const SizedBox(height: 40.0,),
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
                          : TrendingList(screenControllers: screenControllers.trendingSeriesList.value.results,scrollController: screenControllers.scrollControllerTrendingSeries.value,);
                    }),
                    const SizedBox(height: 20.0,),
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
                          : TrendingList(screenControllers: screenControllers.popularSeriesList.value.results,scrollController:screenControllers.scrollControllerPopularSeries.value ,);
                    }),

                  ],
                )),

          ],
        ),
      ),
    );
  }
}
