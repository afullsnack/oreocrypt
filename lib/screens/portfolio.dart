import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oreocrypt/components/coinpill.dart';
import 'package:oreocrypt/screens/full_coinpill.dart';
import 'package:oreocrypt/global.dart';

class PortfolioScreen extends StatelessWidget {
  final Function getPositionSize;
  const PortfolioScreen({Key key, this.getPositionSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formater = NumberFormat.decimalPattern('hi');
    return Container(
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
                    style:
                        TextStyle(fontSize: 23.5, fontWeight: FontWeight.w300),
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
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: 400.0,
              width: double.infinity,
              // flex: 3,
              // fit: FlexFit.tight,
              child: ListView.builder(
                clipBehavior: Clip.hardEdge,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(10.0),
                itemCount: assets.length,
                itemBuilder: (context, index) {
                  final key = new GlobalObjectKey(index);
                  return GestureDetector(
                    onTap: () async {
                      var data = await getPositionSize(key);
                      print(data["position"]);
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 100),
                          reverseTransitionDuration:
                              Duration(milliseconds: 500),
                          transitionsBuilder:
                              (context, animation, secAnimation, child) {
                            animation = CurvedAnimation(
                                curve: Curves.easeInOut, parent: animation);
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          pageBuilder: (context, animation, secAnimation) {
                            return FullCoinPill(
                              size: data["size"],
                              position: data["position"],
                            );
                          },
                        ),
                      );
                    },
                    child: CoinPill(
                      asset: assets[index],
                      containerkey: key,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
