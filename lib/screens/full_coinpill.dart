import 'package:flutter/material.dart';
import 'package:oreocrypt/components/linechart.dart';
import 'package:oreocrypt/components/navigation.dart';
import 'package:oreocrypt/global.dart';

class FullCoinPill extends StatefulWidget {
  final Size size;
  final Offset position;
  const FullCoinPill({Key? key, required this.size, required this.position})
      : super(key: key);

  @override
  _FullCoinPillState createState() => _FullCoinPillState();
}

class _FullCoinPillState extends State<FullCoinPill>
    with TickerProviderStateMixin {
  late double top, left, width, height, borderRadius, opacity;
  dynamic boxShadow;
  late bool isReverseAnim;
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
    // print('Full Coin Pill Inited');
    _initAnimation();
  }

  @override
  void dispose() {
    super.dispose();
    // print('Full Coin Pill Disposed');
  }

  void _initAnimation() async {
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      top = 100;
      left = (MediaQuery.of(context).size.width / 2) - (width / 2);
      isReverseAnim = false;
    });
  }

  void _reversAnimation() async {
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      isReverseAnim = true;
      top = widget.position.dy;
      left = widget.position.dx;
      width = widget.size.width;
      height = widget.size.height;
      borderRadius = 100.0;
      opacity = 0;
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
                child: CustomLineChart(),
              ),
            ),
          ),
          AnimatedPositioned(
            top: top,
            left: left,
            onEnd: () {
              isReverseAnim
                  ? print('Curently in reverse')
                  : setState(() {
                      width = (MediaQuery.of(context).size.width * .85);
                      left = MediaQuery.of(context).size.width / 2 -
                          (((MediaQuery.of(context).size.width * .85) - 10) /
                              2);
                      height = MediaQuery.of(context).size.height * .23;
                      borderRadius = 20.0;
                    });
            },
            duration: Duration(milliseconds: 200),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: width - 10,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                color: Colors.white,
                boxShadow: boxShadow,
              ),
              onEnd: () {
                opacity == 0 && !isReverseAnim
                    ? setState(() {
                        boxShadow = infoShadow;
                        opacity = 1;
                      })
                    : setState(() {
                        boxShadow = infoShadow;
                      });
              },
            ),
          ),
          Positioned(
              bottom: 45,
              left: MediaQuery.of(context).size.width / 2 - 17,
              child: InkWell(
                radius: 70,
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  _reversAnimation();
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 40,
                ),
              ))
        ],
      ),
    );
  }
}
