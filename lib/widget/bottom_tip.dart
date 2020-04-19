import 'package:flutter/material.dart';
import 'package:uniqlo/bloc/global.dart';

class BottomTip extends StatelessWidget {
  final Color color;
  BottomTip({this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: color??Colors.transparent,
      padding: EdgeInsets.only(bottom: 50),
      child: Center(
          child: Text(
        '--- 优衣库 ---',
        style: TextStyle(color: Gcolor.gray, fontSize: 12),
      )),
    );
  }
}
