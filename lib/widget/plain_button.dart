import 'package:flutter/material.dart';
import 'package:uniqlo/bloc/global.dart';

class PlainButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  PlainButton({@required this.child, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: child,
      onPressed: onPressed,
    );
  }
}

class MainButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final IconData icon;
  final double size;
  final Color color;
  final Color fontColor;
  final Color shadowColor;
  final double width;
  final double height;
  final bool isRadius;
  MainButton(
      {@required this.title,
      @required this.onPressed,
      @required this.width,
      @required this.height,
      this.icon,
      this.size,
      this.color,
      this.fontColor,
      this.shadowColor,
      bool isRadius})
      : isRadius = isRadius ?? true,
        assert(width > 40, '按钮宽度起码大于40');
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? Gcolor.red,
          borderRadius: BorderRadius.circular(isRadius ? 50 : 0),
          boxShadow: [
            BoxShadow(color: shadowColor??Colors.transparent,blurRadius: 10,spreadRadius: 0,offset: Offset.fromDirection(1,1))
          ]
        ),
        child: FlatButton(
          onPressed: onPressed,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (icon != null)
                Icon(
                  icon,
                  color: fontColor ?? Colors.white,
                  size: size ?? 15,
                ),
              if (icon != null) SizedBox(width: 5),
              Text(
                title,
                style: TextStyle(
                    fontSize: size ?? 15, color: fontColor ?? Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
