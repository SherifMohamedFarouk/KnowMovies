import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knovies/config/palette.dart';
import 'package:knovies/getx_controller/getx_details.dart';
import 'package:knovies/ui/details_screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TrendingList extends StatelessWidget {
  const TrendingList(
      {Key? key, required this.id, required this.image,required this.backImage, required this.rating,required this.screenControllers,required this.mediaType})
      : super(key: key);
  final int? id;
  final String?image;
  final String?backImage;
  final GetXDetails screenControllers;
  final double? rating;
  final String mediaType;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        mediaType != "tv"?screenControllers.fetchDetailsMovies(id):screenControllers.fetchDetailsSeries(id);
        Get.to(() => DetailsScreen(mediaId: id,mediaImage: image,mediaBackImage: backImage,));
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Stack(
          children: [
            Container(
              height: 220.0,
              width: 150.0,
              child: Card(
                elevation: 18.0,
                child: image != null ? CachedNetworkImage(
                  imageUrl:
                      "https://www.themoviedb.org/t/p/w220_and_h330_face/${image}",
                ):Image.asset('assets/image-not-found.png',),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: rating != 0? CircularPercentIndicator(
                radius: 45.0,
                lineWidth: 4.0,
                percent: rating! * 0.10,
                center: new Text(
                  "${rating! * 10} ",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                progressColor: rating! * 10 >= 70
                    ? Colors.green
                    : rating! * 10 <= 70 &&
                    rating! * 10 >= 50
                        ? Colors.yellow
                        : Colors.red,
              ):Text("No Rating",style: TextStyle(fontSize: 20.0),),
            )
          ],
        ),
      ),
    );
  }
}
