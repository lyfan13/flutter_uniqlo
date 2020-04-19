import 'package:flutter/material.dart';
import 'package:uniqlo/bloc/global.dart';
import 'package:uniqlo/widget/bottom_tip.dart';
import 'package:uniqlo/widget/my_icon_icons.dart';

// import 'package:get_it/get_it.dart';
// GetIt sl = GetIt.instance;
class PageUser extends StatefulWidget {
  @override
  _PageUserState createState() => _PageUserState();
}

class _PageUserState extends State<PageUser> {
  final _cardList = [
    {'icon': MyIcon.book, 'name': '我的订单', 'count': 12},
    {'icon': MyIcon.sync_icon, 'name': '退货换货', 'count': 0},
    {'icon': MyIcon.leaf, 'name': '提货凭证', 'count': 4}
  ];
  final _toolList = [
    {'name': '优惠券', 'icon': MyIcon.gift},
    {'name': '收藏夹', 'icon': MyIcon.star_half},
    {'name': '个人资料', 'icon': MyIcon.license},
    {'name': '关于优衣库', 'icon': MyIcon.magic_wand}
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Color(0xffC63B34),
                  height: 250,
                  child: SafeArea(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 30,
                          left: 20,
                          right: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                '账户',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                              Icon(
                                MyIcon.diamond,
                                color: Colors.white,
                                size: 18,
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: 100,
                          left: 20,
                          right: 20,
                          child: Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: Image.asset('assets/user.jpg'),
                              ),
                              SizedBox(width: 15),
                              Container(
                                height: 50,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      '海绵宝宝',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          '点击查看会员权益',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                        SizedBox(width: 2),
                                        Icon(
                                          MyIcon.chevron_right,
                                          size: 10,
                                          color: Colors.white,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 230,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 200,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Gcolor.back,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    // color: Colors.blueAccent
                  ),
                  child: SingleChildScrollView(
                                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 40),
                        Text(
                          '我的服务',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            for (var i = 0; i < _cardList.length; i++)
                              Container(
                                height: 140,
                                width:
                                    (MediaQuery.of(context).size.width - 80) / 3,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Gcolor.gray.withOpacity(.3),
                                        spreadRadius: 0,
                                        blurRadius: 10)
                                  ],
                                ),
                                padding: EdgeInsets.only(
                                    left: 10, top: 20, bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(
                                      _cardList[i]['icon'],
                                      size: 27,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      _cardList[i]['name'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Gcolor.black),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      _cardList[i]['count'].toString(),
                                      style: TextStyle(color: Gcolor.gray),
                                    )
                                  ],
                                ),
                              )
                          ],
                        ),
                        SizedBox(height: 30),
                        for (var i = 0; i < _toolList.length; i++)
                          Container(
                            height: 40,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(_toolList[i]['icon'],size: 16,),
                                      SizedBox(width:16),
                                      Text(_toolList[i]['name'],style: TextStyle(fontSize: 16),),
                                    ],
                                  ),
                                ),
                                Icon(MyIcon.chevron_right,size: 10,)
                              ],
                            ),
                          ),
                          BottomTip()
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
