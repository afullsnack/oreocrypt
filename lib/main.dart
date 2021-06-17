import 'package:flutter/material.dart';
import 'package:oreocrypt/global.dart';
import 'package:oreocrypt/screens/activity.dart';
import 'package:oreocrypt/screens/full_story.dart';
import 'package:oreocrypt/screens/home.dart';
import 'package:oreocrypt/screens/onboarding.dart';
import 'package:oreocrypt/screens/profile.dart';
import 'package:oreocrypt/screens/stories.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'onboard',
      routes: {
        'onboard': (context) => Onboarding(),
        'home': (context) => Home(),
        'stories': (context) => Stories(),
        'full_story': (context) => StoryScreen(stories: stories2),
        // 'activity': (context) => ActivityScreen(),
        // 'profile': (context) => ProfileScreen(),
      },
    );
  }
}
