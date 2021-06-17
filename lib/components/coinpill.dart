import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/material.dart';
import 'package:oreocrypt/global.dart';

class CoinPill extends StatefulWidget {
  final Map asset;

  CoinPill({Key key, this.asset}) : super(key: key);

  @override
  _CoinPillState createState() => _CoinPillState();
}

class _CoinPillState extends State<CoinPill> {
  @override
  Widget build(BuildContext context) {
    double totalBalance = 0;
    for (var i = 0; i < assets.length; i++) {
      totalBalance += assets[i]["amount"];
    }
    // print(totalBalance);
    final double heightFromBalance =
        (widget.asset["amount"] / totalBalance * 400);
    final assetIcon = widget.asset["code"] == "BTC"
        ? CryptoFontIcons.BTC
        : widget.asset["code"] == "ETH"
            ? CryptoFontIcons.ETH
            : widget.asset["code"] == "LTC"
                ? CryptoFontIcons.LTC
                : widget.asset["code"] == "XMR"
                    ? CryptoFontIcons.XMR
                    : widget.asset["code"] == "DSH"
                        ? CryptoFontIcons.DASH
                        : widget.asset["code"] == "XRP"
                            ? CryptoFontIcons.XRP
                            : widget.asset["code"] == "USDT"
                                ? CryptoFontIcons.USDT
                                : null;
    // print(heightFromBalance);

    return SizedBox(
      // width: double.infinity,
      // height: double.infinity,
      child: Stack(alignment: AlignmentDirectional.centerStart, children: [
        Container(
          // width: 90.0,
          height: (heightFromBalance * 3) < 100 ? 120 : heightFromBalance * 3,
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(assetIcon),
              Icon(
                (heightFromBalance * 3) < 100
                    ? Icons.arrow_circle_down_rounded
                    : Icons.arrow_circle_up_rounded,
                color: (heightFromBalance * 3) < 100
                    ? Colors.redAccent[700]
                    : Colors.greenAccent[700],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
