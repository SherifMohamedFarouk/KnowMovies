import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:knovies/getx_controller/getx_controllers.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TrendingList extends StatelessWidget {
  const TrendingList({
    Key? key,
    required this.screenControllers,
    required this.scrollController,
  }) : super(key: key);

  final GetxControllers screenControllers;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[850],
      height: 230.0,
      width: MediaQuery.of(context).size.width * 0.91,
      child: RawScrollbar(
        thumbColor: Colors.amber,
        isAlwaysShown: true,
        controller: scrollController,
        child: ListView.builder(
            controller:scrollController ,
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
  }
}