import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/material.dart';
import 'package:oreocrypt/global.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor.withOpacity(.5),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.75,
            decoration: BoxDecoration(
              color: bgColor.withOpacity(.35),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(150),
                bottomRight: Radius.circular(150),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CryptoFontIcons.BTC,
                    size: 100,
                    color: Colors.orange,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Oreocrypt',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 22.0, right: 22.0),
                    child: Text(
                      'Track crypto prices and get insights and updates from friends and experts',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.21,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: TextButton(
                onPressed: () {
                  // print('Go to stories screen');
                  Navigator.of(context).pushReplacementNamed('home');
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                style: ButtonStyle(
                  side: MaterialStateProperty.resolveWith(
                      (states) => states.contains(MaterialState.pressed)
                          ? BorderSide(
                              color: Colors.white,
                              width: 2,
                            )
                          : null),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(vertical: 25, horizontal: 85)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      bgColor.withOpacity(.58)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
