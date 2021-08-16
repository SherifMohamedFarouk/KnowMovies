import 'package:flutter/material.dart';
import 'package:knovies/widgets/widgets.dart';

AppBar buildMobileAppBar() {
  return AppBar(
    backgroundColor: Colors.black54,
    title: appBarTittle(),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.white, // background// foreground
          ),
          onPressed: () => {},
          child: Row(
            // Replace with a Row for horizontal icon + text
            children: <Widget>[
              const Icon(
                Icons.account_circle,
                color: Colors.amber,
              ),
              const Text(
                "  Login",
              )
            ],
          ),
        ),
      )
    ],
  );
}