import 'package:flutter/material.dart';

import 'package:oreocrypt/components/navigation.dart';
import 'package:oreocrypt/global.dart';

import 'package:oreocrypt/screens/activity.dart';

import 'package:oreocrypt/screens/portfolio.dart';
import 'package:oreocrypt/screens/profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  int _selectedPage = 0;
  PageController _pageController;

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
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
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
                    PortfolioScreen(),
                    ActivityScreen(),
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
      ),
    );
  }
}
