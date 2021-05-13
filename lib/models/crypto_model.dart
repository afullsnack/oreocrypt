import 'package:flutter/material.dart';

class Crypto {
  final String coinName;
  final String coinCode;
  final double coinPrice;

  Crypto({
    @required this.coinName,
    @required this.coinCode,
    @required this.coinPrice,
  });
}
