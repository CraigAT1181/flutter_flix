import 'package:flutter/material.dart';
import 'package:flutter_flix/pages/home.dart';
import 'package:flutter_flix/pages/flick_details.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home': (context) => const Home(),
      '/details': (context) => const Details()
    },
  // Custom font family from Google fonts
  theme: ThemeData(
    fontFamily: 'Raleway-Regular'
  ),
));