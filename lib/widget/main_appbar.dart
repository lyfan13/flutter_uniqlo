import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  final String title;
  final Widget actions;
  MainAppBar({@required this.title, @required this.actions});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      // decoration: BoxDecoration(
      //   border: Border(bottom: BorderSide(color: Colors.red)),
      // ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      // color: Colors.blue,
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: actions,
            ),
          ],
        ),
      ),
    );
  }
}
