import 'package:flutter/material.dart';
import 'package:oreocrypt/models/user_model.dart';

enum MediaType {
  image,
  video,
  text,
}

class Story {
  final String? id;
  final String url;
  final String postTime;
  final MediaType media;
  final Duration duration;
  final User user;

  Story({
    this.id,
    required this.url,
    required this.postTime,
    required this.media,
    required this.duration,
    required this.user,
  });
}
