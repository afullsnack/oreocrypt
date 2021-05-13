import 'package:flutter/material.dart';
import 'package:oreocrypt/models/story_model.dart';
import 'package:oreocrypt/models/user_model.dart';

final Color bgColor = Color(0xF17203C);

final List<Map<String, dynamic>> assets = [
  {
    "name": "Bitcoin",
    "code": "BTC",
    "amount": 350.2,
  },
  {
    "name": "Ethereum",
    "code": "ETH",
    "amount": 620.4,
  },
  {
    "name": "Litecoin",
    "code": "LTC",
    "amount": 150.01,
  },
  {
    "name": "Monero",
    "code": "XMR",
    "amount": 350.23,
  },
  {
    "name": "Dashcoin",
    "code": "DSH",
    "amount": 41.43,
  },
  {
    "name": "Ripple",
    "code": "XRP",
    "amount": 210.7,
  },
  {
    "name": "Tron",
    "code": "TRX",
    "amount": 740.9,
  },
];

final List<Story> stories = [
  Story(
    id: '0',
    url: 'Some url',
    postTime: '13 mins',
    media: MediaType.image,
    duration: Duration(seconds: 2),
    user: User(name: 'Mirabel', profileImg: 'link/to/img'),
  ),
  Story(
    id: '1',
    url: 'Some url',
    postTime: '13 mins',
    media: MediaType.image,
    duration: Duration(seconds: 2),
    user: User(name: 'Yusuf', profileImg: 'link/to/img'),
  ),
  Story(
    id: '2',
    url: 'Some url',
    postTime: '25 mins',
    media: MediaType.image,
    duration: Duration(seconds: 2),
    user: User(name: 'Kevin', profileImg: 'link/to/img'),
  ),
  Story(
    id: '3',
    url: 'Some url',
    postTime: '2 hrs',
    media: MediaType.image,
    duration: Duration(seconds: 2),
    user: User(name: 'Diego', profileImg: 'link/to/img'),
  ),
  Story(
    id: '4',
    url: 'Some url',
    postTime: '12 hrs',
    media: MediaType.image,
    duration: Duration(seconds: 2),
    user: User(name: 'Kemi', profileImg: 'link/to/img'),
  ),
  Story(
    id: '5',
    url: 'Some url',
    postTime: '20 hrs',
    media: MediaType.image,
    duration: Duration(seconds: 2),
    user: User(name: 'Moniq', profileImg: 'link/to/img'),
  ),
];

final User user = User(
  name: 'John Doe',
  profileImg: 'https://wallpapercave.com/wp/AYWg3iu.jpg',
);

final List<Story> stories2 = [
  Story(
    id: '1',
    postTime: '10 mins',
    url:
        'https://images.unsplash.com/photo-1534103362078-d07e750bd0c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    media: MediaType.image,
    duration: const Duration(seconds: 10),
    user: user,
  ),
  Story(
    id: '2',
    postTime: '13 mins',
    url: 'https://media.giphy.com/media/moyzrwjUIkdNe/giphy.gif',
    media: MediaType.image,
    user: user,
    duration: const Duration(seconds: 7),
  ),
  Story(
    id: '3',
    postTime: '20 mins',
    url:
        'https://static.videezy.com/system/resources/previews/000/005/529/original/Reaviling_Sjusj%C3%B8en_Ski_Senter.mp4',
    media: MediaType.video,
    duration: const Duration(seconds: 0),
    user: user,
  ),
  Story(
    id: '4',
    postTime: '23 mins',
    url:
        'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
    media: MediaType.image,
    duration: const Duration(seconds: 5),
    user: user,
  ),
  Story(
    id: '5',
    postTime: '25 mins',
    url:
        'https://static.videezy.com/system/resources/previews/000/007/536/original/rockybeach.mp4',
    media: MediaType.video,
    duration: const Duration(seconds: 0),
    user: user,
  ),
  Story(
    id: '6',
    postTime: '28 mins',
    url: 'https://media2.giphy.com/media/M8PxVICV5KlezP1pGE/giphy.gif',
    media: MediaType.image,
    duration: const Duration(seconds: 8),
    user: user,
  ),
  Story(
    id: '7',
    postTime: '30 mins',
    url: 'This is a content text that should show up',
    media: MediaType.text,
    duration: const Duration(seconds: 8),
    user: user,
  ),
];
