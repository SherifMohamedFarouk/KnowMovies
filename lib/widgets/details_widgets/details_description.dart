import 'package:flutter/material.dart';
import 'package:knovies/config/palette.dart';
import 'package:knovies/model/details/details_moives_model.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DetailsDescription extends StatelessWidget {
  final String name;
  final String description;
  final double screenSize;
  final List<Genre> genres;

  const DetailsDescription(
      {Key? key,
      required this.name,
      required this.description,
      required this.screenSize,
      required this.genres})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25.0, top: 30.0, bottom: 30.0),
      width: screenSize * 0.90,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name,
              style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold,letterSpacing: 1.0,height: 1.2)),
          const SizedBox(
            height: 8.0,
          ),
          Container(
              child: Wrap(
            children: genres
                .map((item) => Text(
                      "${item.name.toString()},  ",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold,letterSpacing: 1.0),
                    ))
                .toList()
                .cast<Widget>(),
          )),
          const SizedBox(
            height: 8.0,
          ),
          Row(children: [
            Icon(MdiIcons.facebook,color: Colors.amber,size: 35.0,),
            const SizedBox(
              width: 15.0,
            ),
            Icon(MdiIcons.instagram,color: Colors.amber,size: 35.0),
            const SizedBox(
              width: 15.0,
            ),
            Icon(MdiIcons.twitter,color: Colors.amber,size: 35.0),
          ],),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            "Overview",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,letterSpacing: 1.0),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Container(
            child: Text(
              description,
              style: TextStyle(fontSize: 18.0, height: 1.6, letterSpacing: 1.0),
            ),
            width: screenSize * 0.78,
          ),
        ],
      ),
    );
  }
}
