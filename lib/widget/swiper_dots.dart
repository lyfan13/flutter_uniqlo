import 'package:flutter/material.dart';
import 'package:uniqlo/bloc/global.dart';

class SwiperDots extends StatelessWidget {
  final int index;
  final int count;
  SwiperDots({@required this.index, @required this.count});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Text(count.toString())
          for (var i = 0; i < count; i++)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 7),
              width: 20,
              height: 5,
              decoration: BoxDecoration(
                  color: index == i ? Gcolor.red : Colors.black12,
                  borderRadius: BorderRadius.circular(10)),
            )
          // Text(i.toString())
        ],
      ),
    );
  }
}