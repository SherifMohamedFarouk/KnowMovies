import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final int? mediaId  ;
  final  String? mediaImage;
  DetailsScreen({Key? key,required this.mediaId,required this.mediaImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // child: Text(screenControllers.),
      child: CachedNetworkImage(
        imageUrl: "https://www.themoviedb.org/t/p/original/${mediaImage}",
      ),

    );
  }
}
