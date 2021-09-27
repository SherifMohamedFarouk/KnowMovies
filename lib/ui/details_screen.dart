import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knovies/config/palette.dart';
import 'package:knovies/getx_controller/getx_details.dart';
import 'package:knovies/widgets/responsive.dart';
import 'package:knovies/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  final GetXDetails getXDetails = Get.put(GetXDetails());

  final int? mediaId;

  final String? mediaImage;
  final String? mediaBackImage;

  DetailsScreen({Key? key, required this.mediaId, required this.mediaImage,required this.mediaBackImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: Responsive.isMobile(context)
            ? buildMobileAppBar()
            : PreferredSize(
                child: WindowsAppBarList(),
                preferredSize: Size(_screenSize.width, 100)),
        drawer: Drawer(
          child: DrawerWidgets(),
        ),
        body:SingleChildScrollView(
          child: Obx((){
            return getXDetails.isDetailsMoviesListLoading.value?
     Center(child: CircularProgressIndicator(),):
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailsImage(
                  backImage: "https://www.themoviedb.org/t/p/w220_and_h330_face/${mediaBackImage}",
                  image:"https://www.themoviedb.org/t/p/w220_and_h330_face/${mediaImage}" ,
                  name: getXDetails.detailsMoviesList.value.title.toString(),
                  description:getXDetails.detailsMoviesList.value.overview.toString() ,
                  genres:getXDetails.detailsMoviesList.value.genres!,
                ),
                const SizedBox(height:20.0,),
                Text(
                  "  the Cast",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,letterSpacing: 1.0),
                ),
                const SizedBox(height:8.0,),
                Container(
                  margin: EdgeInsets.fromLTRB(5.0, 15.0, 0, 15.0),
                  height: 380.0,
                  decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.amber.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        )
                      ]),
                  // padding: const EdgeInsets.only(top: 30),
                  width: _screenSize.width * 0.90,
                  child: RawScrollbar(
                    thumbColor: Colors.amber,
                    isAlwaysShown: true,
                    controller: getXDetails.scrollControllerCast.value,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: getXDetails.scrollControllerCast.value,
                        shrinkWrap: true,
                        // scrollDirection: Axis.horizontal,
                        itemCount: getXDetails.detailsMoviesList.value.credits!.cast!.length<6?getXDetails.detailsMoviesList.value.credits!.cast!.length:6,
                        itemBuilder: (context, index) {
                          final cast = getXDetails.detailsMoviesList.value.credits!.cast![index];
                          return DetailsCast(image: cast.profilePath.toString(), originalName: cast.originalName.toString(), name: cast.character.toString());
                        }),
                  ),
                ),
              ],
            );
    }),
        ));

    // getXDetails.detailsSeriesList.value.videos!.results!.length.toString());
  }
}
