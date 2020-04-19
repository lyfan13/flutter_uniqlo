import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:uniqlo/bloc/global.dart';
import 'package:uniqlo/widget/bottom_tip.dart';
import 'package:uniqlo/widget/cart_stepper.dart';
import 'package:uniqlo/widget/my_icon_icons.dart';
import 'package:uniqlo/widget/plain_button.dart';
import 'package:uniqlo/widget/swiper_dots.dart';

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final _boxShadow = [
    BoxShadow(color: Colors.black45, blurRadius: 8, spreadRadius: 0)
  ];
  ScrollController _scrollController;
  int _swiperIndex;
  int _count = 1;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // top: false,
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        child: Column(
                          children: <Widget>[
                            AspectRatio(
                              aspectRatio: 1,
                              child: Stack(
                                children: <Widget>[
                                  // Positioned.fill(child: Container(color: Colors.red,)),
                                  Positioned.fill(
                                    child: Swiper(
                                      onIndexChanged: (int index) {
                                        setState(() {
                                          _swiperIndex = index;
                                        });
                                      },
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              // boxShadow: [BoxShadow(color: Colors.black87,blurRadius: 1,spreadRadius: 1)]
                                              border: Border.all(
                                                  color: Gcolor.back,
                                                  width: 1)),
                                          child: Image.network(
                                            'http://vue-upyun.test.upcdn.net/uniqlo/home_rec2.jpg',
                                            fit: BoxFit.fitHeight,
                                          ),
                                        );
                                      },
                                      itemCount: 4,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20)),
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(height: 15),
                                          SwiperDots(
                                              index: _swiperIndex, count: 4),
                                          SizedBox(height: 30),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('AIRism防紫外线网眼拉链连帽开衫',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 10),
                                  Text('具有吸汗速干等舒适功能',
                                      style: TextStyle(color: Gcolor.gray)),
                                  SizedBox(height: 20),
                                  Text('￥299',
                                      style: TextStyle(
                                          color: Gcolor.red,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 20),
                                  Container(
                                    // height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 10,
                                              spreadRadius: 0)
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Gcolor.back)),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            children: <Widget>[
                                              Text('颜色',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Gcolor.gray)),
                                              SizedBox(width: 10),
                                              Expanded(
                                                  flex: 1,
                                                  child: Text('黑色/绿色/灰色')),
                                              Icon(MyIcon.chevron_down,
                                                  size: 13, color: Gcolor.gray)
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                              // border:Border.fromBorderSide()
                                              ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            children: <Widget>[
                                              Text('尺码',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Gcolor.gray)),
                                              SizedBox(width: 10),
                                              Expanded(
                                                  flex: 1,
                                                  child: Text('S/M/L')),
                                              Icon(MyIcon.chevron_down,
                                                  size: 13, color: Gcolor.gray)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text('数量'),
                                      CartStepper(
                                        count: _count,
                                        isRadius: true,
                                        onAdd: () {
                                          print(111);
                                          setState(() {
                                            _count = _count + 1;
                                          });
                                        },
                                        onMinus: () {
                                          print(111);
                                          setState(() {
                                            _count = _count - 1;
                                          });
                                        },
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            BottomTip(color: Colors.white,)
                          ],
                        ),
                      ),
                    ),
                    // 头部栏
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: SafeArea(
                        child: Container(
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          // color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  MyIcon.chevron_left,
                                  size: 20,
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      MyIcon.lnr_bubble,
                                      size: 19,
                                    ),
                                    SizedBox(width: 7),
                                    Icon(
                                      MyIcon.cart,
                                      size: 19,
                                    ),
                                    SizedBox(width: 7),
                                    Icon(
                                      MyIcon.exit_up,
                                      size: 19,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    // 底部购买栏
                    Positioned(
                      bottom: 0,
                      left: 20,
                      right: 20,
                      child: Container(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    boxShadow: _boxShadow),
                                child: Icon(
                                  Icons.favorite,
                                  color: Gcolor.red,
                                )),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black45,
                                        blurRadius: 8,
                                        spreadRadius: 0)
                                  ]),
                              child: MainButton(
                                onPressed: () {Navigator.pushNamed(context, '/confirm');},
                                height: 38,
                                width: 250,
                                title: '立即购买',
                                icon: MyIcon.cart,
                                size: 17,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
