import 'package:flutter/material.dart';

class CoinPill extends StatelessWidget {
  final Map asset;

  CoinPill({Key key, this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 90.0,
      height: 90.0,
      padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 2.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(60),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // asset["code"]
          Text(
            '${asset["code"]}',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '+3.6%',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              Icon(
                Icons.arrow_circle_up_sharp,
                color: Colors.greenAccent[700],
                size: 34.0,
              )
            ],
          ),
        ],
      ),
    );
  }
}
