import 'package:flutter/material.dart';
import 'package:oreocrypt/models/story_model.dart';

class User {
  final String name;
  final String profileImg;
  final bool? isActiveStory;
  final List<Story>? stories;

  User({
    required this.name,
    required this.profileImg,
    this.isActiveStory,
    this.stories,
  });
}
