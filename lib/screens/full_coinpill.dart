import 'package:flutter/material.dart';
import 'package:oreocrypt/global.dart';

class FullCoinPill extends StatefulWidget {
  final Size size;
  final Offset position;
  const FullCoinPill({Key key, this.size, this.position}) : super(key: key);

  @override
  _FullCoinPillState createState() => _FullCoinPillState();
}

class _FullCoinPillState extends State<FullCoinPill>
    with TickerProviderStateMixin {
  double top, left, width, height, borderRadius, opacity;
  dynamic boxShadow;
  @override
  void initState() {
    super.initState();
    top = widget.position.dy;
    left = widget.position.dx;
    width = widget.size.width;
    height = widget.size.height;
    borderRadius = 100.0;
    boxShadow = null;
    opacity = 0;
    print('Full Coin Pill Inited');
    _initAnimation();
  }

  @override
  void dispose() {
    super.dispose();
    print('Full Coin Pill Disposed');
  }

  void _initAnimation() async {
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      top = 100;
      left = (MediaQuery.of(context).size.width / 2) - (width / 2);
    });
  }

  void _reversAnimation() async {
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      top = widget.position.dy;
      left = widget.position.dx;
      width = widget.size.width;
      height = widget.size.height;
      borderRadius = 100.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Stack(
        children: [
          Positioned(
            bottom: 150,
            left: MediaQuery.of(context).size.width / 2 -
                ((MediaQuery.of(context).size.width * .91) / 2),
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 100),
              opacity: opacity,
              child: Container(
                width: MediaQuery.of(context).size.width * .91,
                height: MediaQuery.of(context).size.height * .6,
                decoration: BoxDecoration(
                  color: Colors.amberAccent[100],
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            top: top,
            left: left,
            onEnd: () {
              setState(() {
                width = (MediaQuery.of(context).size.width * .85);
                left = MediaQuery.of(context).size.width / 2 -
                    (((MediaQuery.of(context).size.width * .85) - 10) / 2);
                height = MediaQuery.of(context).size.height * .23;
                borderRadius = 20.0;
              });
            },
            duration: Duration(milliseconds: 100),
            child: GestureDetector(
              onTap: () {
                _reversAnimation();
                Navigator.pop(context);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                width: width - 10,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  color: Colors.white,
                  boxShadow: boxShadow,
                ),
                onEnd: () {
                  setState(() {
                    boxShadow = infoShadow;
                    opacity = 1;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
