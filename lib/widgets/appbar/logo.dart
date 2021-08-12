import 'package:flutter/material.dart';

Row appBarTittle() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Kn",style:TextStyle(
        color: Colors.white,
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        letterSpacing: -1.25,
      ),),
      Text(
        "ovies",
        style: TextStyle(
          color: Colors.amber,
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
          letterSpacing: -1.25,
        ),
      )
    ],
  );}