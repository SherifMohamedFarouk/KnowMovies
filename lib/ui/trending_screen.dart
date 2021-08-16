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
      body: Column(
        children: [
          SearchBar(),
          const SizedBox(
            height: 40.0,
          ),
          MediaTypeDivider(
            mediaType: "Movies",
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 8.0, 0.0, 8.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Text(
                      "Trending",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    ToggleSwitch(
                      minWidth: 80.0,
                      cornerRadius: 10.0,
                      activeBgColors: [
                        [Colors.amber],
                        [Colors.amber]
                      ],
                      activeFgColor: Colors.black,
                      inactiveBgColor: Colors.white,
                      inactiveFgColor: Colors.black,
                      initialLabelIndex: 1,
                      totalSwitches: 2,
                      labels: ['Today', 'Weekly'],
                      radiusStyle: true,
                      onToggle: (index) {
                        print('switched to: $index');
                        index == 0 ? screenControllers.fetchTrendingList("day") : screenControllers.fetchTrendingList("week");
                        var logger = Logger();
                        logger.d(screenControllers.moviesType.value);
                      },
                    ),
                  ],
                )),
          ),
          Obx(() {
            return screenControllers.isTrendingLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    height: 230.0,
                    width: MediaQuery.of(context).size.width * 0.90,
                    child: RawScrollbar(
                      thumbColor: Colors.amber,
                      isAlwaysShown: true,
                      controller: screenControllers.scrollController.value,
                      child: ListView.builder(
                        controller:screenControllers.scrollController.value ,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: screenControllers
                              .trendingList.value.results!.length,
                          itemBuilder: (context, index) {
                            final trending = screenControllers
                                .trendingList.value.results![index];
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Stack(
                                children: [
                                  Container(
                                    height: 230.0,
                                    width: 150.0,
                                    child: Card(
                                      elevation: 18.0,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "https://www.themoviedb.org/t/p/original/${trending.posterPath}",
                                        // height: 225.0,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: trending.voteAverage! * 0.10,
                                      center: new Text(
                                        "${trending.voteAverage! * 10} ",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      progressColor:
                                          trending.voteAverage! * 10 >= 70
                                              ? Colors.green
                                              : trending.voteAverage! * 10 <= 70 && trending.voteAverage! * 10 >= 50
                                                  ? Colors.yellow
                                                  : Colors.red,
                                    ),
                                  )

                                ],
                              ),
                            );
                          }),
                    ),
                  );
          }),
        ],
      ),
    );
  }
}
