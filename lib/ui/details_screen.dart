import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        body:Obx((){
          return getXDetails.isDetailsSeriesListLoading.value?
     Center(child: CircularProgressIndicator(),):
          DetailsImage(
            backImage: "https://www.themoviedb.org/t/p/w220_and_h330_face/${mediaBackImage}",
            image:"https://www.themoviedb.org/t/p/w220_and_h330_face/${mediaImage}" ,
            description:getXDetails.detailsSeriesList.value.overview.toString() ,
            name: getXDetails.detailsSeriesList.value.name.toString(),
            // genres: [
            //   getXDetails.detailsSeriesList.value.genres![0],
            //   getXDetails.detailsSeriesList.value.videos!.results![0].name.toString());
            // ],

          );
    }));

    // getXDetails.detailsSeriesList.value.videos!.results!.length.toString());
  }
}
