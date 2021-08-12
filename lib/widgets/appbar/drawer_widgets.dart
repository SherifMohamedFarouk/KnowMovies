import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets.dart';

class DrawerWidgets extends StatelessWidget {
  const DrawerWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: appBarTittle(),
          decoration: BoxDecoration(
            color: Colors.black54,
          ),
        ),
        ListTile(
          leading: Icon(MdiIcons.filmstrip,color: Colors.amber,),
          title: Text('Movies'),
        ),
        ListTile(
          leading: Icon(MdiIcons.playBoxOutline,color: Colors.amber,),
          title: Text('Series'),
        ),
        ListTile(
          leading: Icon(MdiIcons.accountGroup,color: Colors.amber,),
          title: Text('People'),
        ),
      ],
    );
  }
}