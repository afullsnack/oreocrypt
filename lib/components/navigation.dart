import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  final int? pageIndex;
  final Function? onPageChange;
  const Navigation({Key? key, this.pageIndex, this.onPageChange})
      : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        NavButton(
          icon: Icons.bar_chart,
          seletectedPage: 0,
          pageNumber: widget.pageIndex!,
          onPressed: () {
            widget.onPageChange!(0);
          },
        ),
        NavButton(
          icon: Icons.bubble_chart_outlined,
          seletectedPage: 1,
          pageNumber: widget.pageIndex!,
          onPressed: () {
            widget.onPageChange!(1);
          },
        ),
        NavButton(
          icon: Icons.person_outline_sharp,
          seletectedPage: 2,
          pageNumber: widget.pageIndex!,
          onPressed: () {
            widget.onPageChange!(2);
          },
        )
      ],
    );
  }
}

class NavButton extends StatelessWidget {
  final IconData? icon;
  final int? seletectedPage;
  final int? pageNumber;
  final Function? onPressed;

  NavButton({this.icon, this.seletectedPage, this.pageNumber, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          onPressed!();
        },
        child: Icon(
          icon,
          size: seletectedPage == pageNumber ? 40 : 30,
          color: seletectedPage == pageNumber
              ? Colors.white
              : Colors.white.withOpacity(.5),
        ),
      ),
    );
  }
}
