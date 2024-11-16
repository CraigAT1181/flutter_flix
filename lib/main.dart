import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

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
              fontSize: 32),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Flick Finder',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Search Bar goes here!')
                ],
              )
            ]),
      ),
    );
  }
}
