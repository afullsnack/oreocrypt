import 'package:flutter/material.dart';

import 'package:oreocrypt/components/navigation.dart';
import 'package:oreocrypt/global.dart';

// import 'package:oreocrypt/screens/activity.dart';

import 'package:oreocrypt/screens/portfolio.dart';
import 'package:oreocrypt/screens/profile.dart';
import 'package:oreocrypt/screens/stories.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  int _selectedPage = 0;
  PageController _pageController;
  Offset pillPosition;
  Size pillSize;

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

  Map<String, dynamic> getCoinPillPosition(GlobalKey key) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    final RenderBox box = key.currentContext.findRenderObject();

    setState(() {
      pillPosition = box.localToGlobal(Offset.zero);
      pillSize = box.size;
    });

    return {"position": pillPosition, "size": pillSize};

    // print(
    //     '\n W: ${pillSize.width} \n H: ${pillSize.height} \n X: ${pillPosition.dx} \n Y: ${pillPosition.dy}');
    // });
  }

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

  @override
  Widget build(BuildContext context) {
    // print(totalBalance);
    return Scaffold(
      backgroundColor: bgColor,
      // appBar: AppBar(title: Text('Bitcoin Home')),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 7,
              child: PageView(
                clipBehavior: Clip.antiAlias,
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (page) {
                  setState(() {
                    _selectedPage = page;
                  });
                },
                controller: _pageController,
                children: [
                  PortfolioScreen(
                    getPositionSize: (key) => getCoinPillPosition(key),
                  ),
                  StoriesScreen(),
                  ProfileScreen(),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Navigation(
                pageIndex: _selectedPage,
                onPageChange: (pageNum) {
                  _changePage(pageNum);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
