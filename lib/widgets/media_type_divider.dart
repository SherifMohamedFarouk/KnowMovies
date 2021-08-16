import 'package:flutter/material.dart';

class MediaTypeDivider extends StatelessWidget {
  final String mediaType;
  const MediaTypeDivider({
    Key? key, required this.mediaType
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: Divider(
              color: Colors.black,
              height: 50,
            )),
      ),

      Text(mediaType,style: TextStyle(fontSize:25.0,color: Colors.amber ),),

      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: Divider(
              color: Colors.black,
              height: 50,
            )),
      ),
    ]);
  }
}