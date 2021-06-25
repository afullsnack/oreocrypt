import 'package:flutter/material.dart';
import 'package:oreocrypt/components/navigation.dart';
import 'package:oreocrypt/global.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Text(
          'Activity screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
