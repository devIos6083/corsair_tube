import 'package:flutter/material.dart';
import 'package:youtube_premium/screen/home_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      colorSchemeSeed: Colors.blue,
    ),
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}
