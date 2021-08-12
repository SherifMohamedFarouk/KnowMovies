import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knovies/ui/uis.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Knovies',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.dark
      ),
      home: TrendingScreen(),
    );
  }
}

