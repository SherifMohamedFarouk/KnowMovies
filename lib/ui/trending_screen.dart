import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              color: Colors.black,
                child: Column(
              children: [
                TitleWithToggle(
                  screenControllers: screenControllers,
                  title: "Trending",
                ),
                Obx(() {
                  return screenControllers.isTrendingLoading.value
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : TrendingList(screenControllers: screenControllers,scrollController: screenControllers.scrollControllerTrendingMovies.value,);
                }),
                const SizedBox(height: 20.0,),
                TitleWithToggle(
                  screenControllers: screenControllers,
                  title: "Popular",
                  toggle: false,
                ),
                Obx(() {
                  return screenControllers.isTrendingLoading.value
                      ? Center(
                    child: CircularProgressIndicator(),
                  )
                      : TrendingList(screenControllers: screenControllers,scrollController:screenControllers.scrollControllerPopularMovies.value ,);
                }),

              ],
            )),
            const SizedBox(height: 40.0,),
            MediaTypeDivider(
              mediaType: "Series",
            ),
            Container(
                color: Colors.black,
                child: Column(
                  children: [
                    TitleWithToggle(
                      screenControllers: screenControllers,
                      title: "Trending",
                    ),
                    Obx(() {
                      return screenControllers.isTrendingLoading.value
                          ? Center(
                        child: CircularProgressIndicator(),
                      )
                          : TrendingList(screenControllers: screenControllers,scrollController: screenControllers.scrollControllerTrendingSeries.value,);
                    }),
                    const SizedBox(height: 20.0,),
                    TitleWithToggle(
                      screenControllers: screenControllers,
                      title: "Popular",
                      toggle: false,
                    ),
                    Obx(() {
                      return screenControllers.isTrendingLoading.value
                          ? Center(
                        child: CircularProgressIndicator(),
                      )
                          : TrendingList(screenControllers: screenControllers,scrollController:screenControllers.scrollControllerPopularSeries.value ,);
                    }),

                  ],
                )),

          ],
        ),
      ),
    );
  }
}
