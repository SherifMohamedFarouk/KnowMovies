import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knovies/config/palette.dart';

class DetailsCast extends StatelessWidget {
  final String image;

  final String originalName;
  final String name;

  const DetailsCast({
    Key? key,
    required this.image,
    required this.originalName,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(

      color: Palette.lightGreen,
      child: Column(
        children: [
          image != null
              ? CachedNetworkImage(
                  imageUrl:
                      "https://www.themoviedb.org/t/p/w220_and_h330_face/${image}",
            // height: 200,
            width: 200,
                )
              : Image.asset(
                  'assets/image-not-found.png',
                ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            originalName,
            style: TextStyle(
                letterSpacing: 1.0,
                height: 1.0,
                fontSize: 15.0,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            name,
            style: TextStyle(
              letterSpacing: 1.0,
              height: 1.0,
              fontSize: 15.0,
            ),
          ),
        ],
      ),
    );
  }
}
