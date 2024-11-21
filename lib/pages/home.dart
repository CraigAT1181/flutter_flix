import 'package:flutter/material.dart';
import 'package:flutter_flix/widgets/flick_search.dart';
import 'package:flutter_flix/widgets/flick_stack.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Flix!',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway-Bold',
            fontSize: 32,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
      ),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    'Flick Finder',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 300,
                    child:
                        FlickSearch(), // Calling the FlickSearch widget inside a SizedBox container
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    'Flick Picker',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 10),
                  FlickStack(), // Calling the FlickStack widget
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    'New this year...',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Carousel goes here!'),
                  // A placeholder for a flick carousel
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
