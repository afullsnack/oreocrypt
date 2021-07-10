import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oreocrypt/components/coinpill.dart';
import 'package:oreocrypt/screens/full_coinpill.dart';
import 'package:oreocrypt/global.dart';

class PortfolioScreen extends StatefulWidget {
  final Function getPositionSize;
  const PortfolioScreen({Key? key, required this.getPositionSize})
      : super(key: key);

  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  int _selectedPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _changePage(int pageNum) {
    setState(() {
      _selectedPage = pageNum;
      _pageController.animateToPage(
        pageNum,
        duration: Duration(milliseconds: 400),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: PageView(
        clipBehavior: Clip.antiAlias,
        // physics: NeverScrollableScrollPhysics(),
        onPageChanged: (page) {
          setState(() {
            _selectedPage = page;
          });
        },
        controller: _pageController,

        // Column(
        children:
            List.generate(2, (index) => buildExchangePortfolio(_selectedPage)),
      ),
    );
  }

  Widget buildExchangePortfolio(currentPage) {
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
                    color: Colors.greenAccent[700]?.withOpacity(.7),
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
                itemCount: currentPage <= 0 ? assets.length : assets2.length,
                itemBuilder: (context, index) {
                  // Build Global key and pass it the
                  final finalAssets = currentPage <= 0 ? assets : assets2;
                  final key = new GlobalObjectKey(finalAssets[index]["code"]);
                  return GestureDetector(
                    onTap: () async {
                      var data = await widget.getPositionSize(key);
                      // print(data["position"]);
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 100),
                          reverseTransitionDuration:
                              Duration(milliseconds: 600),
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
                      asset: finalAssets[index],
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
