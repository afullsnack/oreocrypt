import 'package:flutter/material.dart';

class FullCoinPill extends StatefulWidget {
  const FullCoinPill({Key key}) : super(key: key);

  @override
  _FullCoinPillState createState() => _FullCoinPillState();
}

class _FullCoinPillState extends State<FullCoinPill> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Center(
        child: Container(
          child: Text('data'),
        ),
      ),
    );
  }
}
