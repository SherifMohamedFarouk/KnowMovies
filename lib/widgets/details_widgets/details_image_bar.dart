import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:knovies/model/details/details_moives_model.dart';
import 'package:knovies/widgets/details_widgets/details_description.dart';

class DetailsImage extends StatelessWidget {
  final String backImage;
  final String image;
  final String description;
  final String name;
  final List<Genre> genres;

  // final List<String> genres;

  const DetailsImage(
      {Key? key,
      required this.backImage,
      required this.image,
      required this.description,
      required this.name, required this.genres, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
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
          child: Column(
            children: [
              Row(
                children: [
                  CachedNetworkImage(
                    height: _screenSize.height * 0.35,
                    width: _screenSize.width * 0.50,
                    imageUrl: image,
                  ),
                ],
              ),
            ],
          ),
        ),
        DetailsDescription(name: name, description: description, screenSize: _screenSize.width,genres:genres)
      ],
    );
  }
}
