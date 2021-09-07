import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailsImage extends StatelessWidget {
  final String backImage;
  final String image;

  const DetailsImage({Key? key, required this.backImage, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      height: _screenSize.height * 0.45,
      width: _screenSize.width,
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: CachedNetworkImageProvider(backImage)),
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            height: _screenSize.height * 0.35,
            width: _screenSize.width * 0.50,
            imageUrl: image,
          ),
          Text("hey")
        ],
      ),
    );
  }
}
