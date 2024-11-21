import 'package:flutter/material.dart';
import 'package:flutter_flix/models/flicks.dart';

class FlickStack extends StatefulWidget {
  const FlickStack({super.key});

  @override
  State<FlickStack> createState() => _FlickStackState();
}

class _FlickStackState extends State<FlickStack> {
  List<Flicks> flicks = [
    Flicks(
      poster:
          'https://images.unsplash.com/photo-1505506874110-6a7a69069a08?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      name: 'Flick 1',
      genre: 'Horror',
    ),
    Flicks(
      poster:
          'https://plus.unsplash.com/premium_photo-1669312733482-829179a1e16c?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      name: 'Flick 2',
      genre: 'Fantasy',
    ),
    Flicks(
      poster:
          'https://images.unsplash.com/photo-1484589065579-248aad0d8b13?q=80&w=1959&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      name: 'Flick 3',
      genre: 'Comedy',
    ),
  ];

  int flickIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              flickIndex = (flickIndex - 1 + flicks.length) % flicks.length;
            });
          },
          icon: const Icon(Icons.arrow_left),
        ),
        Stack(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/details');
              },
              child: Container(
                width: 200,
                height: 100,
                child: Image(
                    image: NetworkImage('${flicks[flickIndex].poster}'),
                    fit: BoxFit.cover),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                '${flicks[flickIndex].name}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            setState(() {
              // Navigate to the next flick
              flickIndex = (flickIndex + 1) % flicks.length;
            });
          },
          icon: const Icon(Icons.arrow_right),
        ),
      ],
    );
  }
}