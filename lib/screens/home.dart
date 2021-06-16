import 'package:flutter/material.dart';
import 'package:oreocrypt/components/coinpill.dart';
import 'package:oreocrypt/global.dart';
import 'package:intl/intl.dart';
import 'package:oreocrypt/screens/full_coinpill.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var formater = NumberFormat.decimalPattern('hi');

  @override
  Widget build(BuildContext context) {
    // print(totalBalance);
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
                          color: Colors.white.withOpacity(.5),
                          fontSize: 18,
                          letterSpacing: 1.8,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          text: '\$ ',
                          style: TextStyle(
                              fontSize: 23.5, fontWeight: FontWeight.w300),
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
                                color: Colors.white.withOpacity(.5),
                                fontSize: 35,
                                fontWeight: FontWeight.w200,
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
                height: 400.0,
                width: double.infinity,
                // flex: 3,
                // fit: FlexFit.tight,
                child: ListView.builder(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(10.0),
                  itemCount: assets.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration(seconds: 2),
                            transitionsBuilder:
                                (context, animation, secAnimation, child) {
                              animation = CurvedAnimation(
                                  curve: Curves.easeInOut, parent: animation);
                              return ScaleTransition(
                                scale: animation,
                                alignment: Alignment.bottomCenter,
                                child: child,
                              );
                            },
                            pageBuilder: (context, animation, secAnimation) {
                              return FullCoinPill();
                            },
                          ),
                        );
                      },
                      child: CoinPill(
                        asset: assets[index],
                      ),
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
                      Icons.bar_chart,
                      color: Colors.white,
                      size: 40,
                    ),
                    Icon(
                      Icons.bubble_chart_outlined,
                      color: Colors.white.withOpacity(.5),
                      size: 30,
                    ),
                    Icon(
                      Icons.settings,
                      color: Colors.white.withOpacity(.5),
                      size: 30,
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
