import 'package:flutter/material.dart';
import 'package:oreocrypt/components/coinpill.dart';
import 'package:oreocrypt/global.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var formater = NumberFormat.decimalPattern('hi');

  var totalBalance = 0;

  @override
  Widget build(BuildContext context) {
    assets.map((asset) {
      print(asset["amount"]);
      totalBalance += asset["amount"];
    });
    print(totalBalance);
    return Scaffold(
      backgroundColor: bgColor,
      // appBar: AppBar(title: Text('Bitcoin Home')),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'YOUR BALANCE',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          letterSpacing: 1.8,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          text: '\$ ',
                          style: TextStyle(fontSize: 20),
                          children: [
                            TextSpan(
                              text: '${formater.format(14562)}.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 52,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: '89',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '\$68.72',
                        style: TextStyle(
                          color: Colors.greenAccent[700].withOpacity(.7),
                          fontSize: 21,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )),
              Container(
                height: 390.0,
                width: double.infinity,
                // flex: 3,
                // fit: FlexFit.tight,
                child: ListView.builder(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(30.0),
                  itemCount: assets.length,
                  itemBuilder: (context, index) {
                    return CoinPill(
                      asset: assets[index],
                    );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.airplanemode_active,
                      color: Colors.white,
                      size: 45,
                    ),
                    Icon(
                      Icons.airport_shuttle_sharp,
                      color: Colors.white,
                      size: 45,
                    ),
                    Icon(
                      Icons.map_rounded,
                      color: Colors.white,
                      size: 45,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
