import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:knovies/widgets/responsive.dart';
import 'package:knovies/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
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
        body: DetailsImage(
          backImage: "https://www.themoviedb.org/t/p/original/${mediaBackImage}",
          image:"https://www.themoviedb.org/t/p/original/${mediaImage}" ,
        ));
  }
}
