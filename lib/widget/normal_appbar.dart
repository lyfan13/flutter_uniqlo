import 'package:flutter/material.dart';

import 'my_icon_icons.dart';

class NormalAppBar extends StatelessWidget {
  final _boxShadow = [
    BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 0)
  ];
  final IconData leftIcon;
  final IconData rightIcon;
  final String title;
  final bool isTextCenter;
  final bool hasShadow;
  final Color color;
  NormalAppBar(
      {@required this.title,
      this.leftIcon,
      this.rightIcon,
      this.color,
      bool isTextCenter,
      bool hasShadow})
      : isTextCenter = isTextCenter ?? true,
        hasShadow = hasShadow ?? false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: color != null ? color : Colors.white,
          boxShadow:
              hasShadow ? _boxShadow : [BoxShadow(color: Colors.transparent)]),
      height: 80,
      // color: Colors.blueAccent,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                width: 30,
                height: 30,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: leftIcon != null
                      ? Icon(leftIcon)
                      : Icon(MyIcon.chevron_left),
                )),
            Expanded(
              child: Align(
                alignment:
                    isTextCenter ? Alignment.center : Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Container(
              width: 30,
              height: 30,
              child: rightIcon != null ? Icon(rightIcon) : Icon(MyIcon.cart),
            )
          ],
        ),
      ),
    );
  }
}
