import 'package:flutter/material.dart';
import 'package:oreocrypt/global.dart';

class StoryRing extends StatelessWidget {
  final double radius;
  final Color ringColor;
  StoryRing({@required this.radius, @required this.ringColor});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ringColor,
      radius: radius,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Icon(
            Icons.person_outlined,
            color: Colors.white,
            size: 30,
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
