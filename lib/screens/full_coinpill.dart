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
  double top, left, width, height, borderRadius;
  @override
  void initState() {
    super.initState();
    top = widget.position.dy;
    left = widget.position.dx;
    width = widget.size.width;
    height = widget.size.height;
    borderRadius = 100.0;
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
      borderRadius = 100.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Stack(
        children: [
          AnimatedPositioned(
            top: top,
            left: left,
            onEnd: () {
              setState(() {
                width = (MediaQuery.of(context).size.width * .9);
                left = MediaQuery.of(context).size.width / 2 -
                    (((MediaQuery.of(context).size.width * .9) - 10) / 2);
                borderRadius = 20.0;
              });
            },
            duration: Duration(milliseconds: 300),
            child: GestureDetector(
              onTap: () {
                _reversAnimation();
                Navigator.pop(context);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: width - 10,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
