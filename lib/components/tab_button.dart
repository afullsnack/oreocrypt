import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final int seletectedPage;
  final int pageNumber;
  final Function onPressed;

  TabButton(
      {this.text,
      this.textColor,
      this.seletectedPage,
      this.pageNumber,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          TextButton(
            onPressed: onPressed,
            child: Text(
              '$text',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: seletectedPage == pageNumber
                    ? textColor
                    : textColor.withOpacity(.5),
                letterSpacing: 1.2,
                fontSize: 21,
              ),
            ),
          ),
          SizedBox(height: 10),
          AnimatedContainer(
            duration: Duration(milliseconds: 1200),
            curve: Curves.fastLinearToSlowEaseIn,
            width: seletectedPage == pageNumber
                ? MediaQuery.of(context).size.width / 4.2
                : 0,
            height: seletectedPage == pageNumber ? 4 : 0,
            decoration: BoxDecoration(
              color: Colors.redAccent[700],
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ],
      ),
    );
  }
}
