import 'package:flutter/material.dart';

class User {
  final String name;
  final String profileImg;
  final bool isActiveStory;

  User({
    @required this.name,
    @required this.profileImg,
    this.isActiveStory,
  });
}
