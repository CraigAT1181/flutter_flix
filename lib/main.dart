import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Home()));

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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
                child: Column(
              children: [
                Text(
                  'Flick Finder',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 10),
                Text('Search Bar goes here!'),
                Text('Result panel appears here!')
              ],
            )),
            Center(
              child: Column(
                children: [
                  const Text(
                    'Flick Picker',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_left),
                        onPressed: () {},
                      ),
                      const Text('Stack goes here!'),
                      IconButton(
                        icon: const Icon(Icons.arrow_right),
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              ),
            ),
            const Center(
              child: Column(
                children: [
                  Text(
                    'New this year...',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Carousel goes here!')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
