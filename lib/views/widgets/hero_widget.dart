import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Hero(
          tag: 'hero1',
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                'assets/images/hatsune_miku.jpeg',
                fit: BoxFit.cover,
                // color: Colors.teal,
                // colorBlendMode: BlendMode.modulate,
              ),
            ),
          ),
        ),
        FittedBox(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 50.0),
            ),
          ),
        ),
      ],
    );
  }
}
