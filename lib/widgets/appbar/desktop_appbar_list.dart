import 'package:flutter/material.dart';
import 'package:knovies/config/palette.dart';

import '../widgets.dart';

class WindowsAppBarList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Palette.black),
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          appBarTittle(),
          const SizedBox(
            width: 20,
          ),
          TabRow(),
          const SizedBox(
            width: 20,
          ),
          const SizedBox(
            width: 500,
          ),
          TextButton(
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
          const SizedBox(
            width: 20,
          ),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white, // background// foreground
            ),
            onPressed: () => {},
            child: const Text("  Sign Up"),
          ),
        ],
      ),
    );
  }

  Row TabRow() {
    return Row(
      children: [
        const SizedBox(
          width: 18.0,
        ),
        Text(
          "Movies",
          style: TextStyle(fontSize: 18.0),
        ),
        const SizedBox(
          width: 18.0,
        ),
        Text(
          "Series",
          style: TextStyle(fontSize: 18.0),
        ),
        const SizedBox(
          width: 18.0,
        ),
        Text(
          "People",
          style: TextStyle(fontSize: 18.0),
        ),
        const SizedBox(
          width: 18.0,
        ),
      ],
    );
  }
}
