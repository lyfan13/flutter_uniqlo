
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uniqlo/bloc/global.dart';
import 'package:uniqlo/bloc/nav_bloc.dart';
import 'package:uniqlo/widget/my_icon_icons.dart';

GetIt sl = GetIt.instance;
class MainNavBar extends StatefulWidget {
  @override
  _MainNavBarState createState() => _MainNavBarState();
}

class _MainNavBarState extends State<MainNavBar>
    with SingleTickerProviderStateMixin {
  final _iconList = [
    {'name': '首页', 'icon': MyIcon.home},
    {'name': '门店', 'icon': MyIcon.apartment},
    {'name': '购物车', 'icon': MyIcon.cart},
    {'name': '我的', 'icon': MyIcon.user}
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Gcolor.thin.withOpacity(.9),
      child: Row(
        children: <Widget>[
          for (var i = 0; i < _iconList.length; i++)
            Expanded(
              flex: 1,
              child: FlatButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: () {
                  sl<NavBloc>().add(i);
                },
                child: StreamBuilder<Object>(
                    stream: sl<NavBloc>().stream,
                    builder: (context, snapshot) {
                      var _isActive = snapshot.data == i;
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            height: 20,
                            width: 20,
                            child: Stack(children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                      color: _isActive
                                          ? Gcolor.red
                                          : Colors.transparent,
                                      shape: BoxShape.circle),
                                ),
                              ),
                              Icon(
                                _iconList[i]['icon'],
                                size: 20.0,
                                color: _isActive
                                    ? Gcolor.black
                                    : Colors.black.withOpacity(.5),
                              ),
                            ]),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            _iconList[i]['name'],
                            style: TextStyle(
                                color: _isActive
                                    ? Gcolor.black
                                    : Colors.black.withOpacity(.5),
                                fontSize: 13),
                          )
                        ],
                      );
                    }),
              ),
            ),
        ],
      ),
    );
  }
}
