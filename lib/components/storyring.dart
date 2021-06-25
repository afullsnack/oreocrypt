import 'package:flutter/material.dart';
import 'package:oreocrypt/global.dart';

class StoryRing extends StatelessWidget {
  final double radius;
  final List<Color> ringColors;
  StoryRing({required this.radius, required this.ringColors});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: ringColors),
      ),
      // radius: radius,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Icon(
            Icons.person_outlined,
            color: Colors.white,
            size: radius / 2,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: bgColor.withAlpha(255),
          ),
        ),
      ),
    );
  }
}
