import 'package:flutter/material.dart';
import 'package:uniqlo/bloc/global.dart';
import 'package:uniqlo/widget/my_icon_icons.dart';
import 'package:uniqlo/widget/normal_appbar.dart';
import 'package:uniqlo/widget/plain_button.dart';

class PageConfirm extends StatefulWidget {
  @override
  _PageConfirmState createState() => _PageConfirmState();
}

class _PageConfirmState extends State<PageConfirm> {
  final _tipList = [
    {'name': '促销信息', 'intro': '4.3-4.19春日会员日免邮费', 'icon': null},
    {'name': '优惠券', 'intro': '无优惠券可用', 'icon': MyIcon.chevron_right},
    {'name': '配送方式', 'intro': '顺分配送', 'icon': MyIcon.chevron_right}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          NormalAppBar(title: '确认订单', hasShadow: true),
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              // color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width - 40,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: Gcolor.boxShadow,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Gcolor.red, shape: BoxShape.circle),
                            child: Icon(
                              MyIcon.location,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '海绵宝宝',
                                  style: TextStyle(fontSize: 17),
                                ),
                                SizedBox(height: 2),
                                Text('广东省广州市荔湾区120号'),
                                SizedBox(height: 2),
                                SizedBox(height: 5),
                                Text(
                                  '13500000000',
                                  style: TextStyle(color: Gcolor.gray),
                                )
                              ],
                            ),
                          ),
                          Icon(MyIcon.chevron_right, size: 15,color: Gcolor.gray)
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width - 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: Gcolor.boxShadow),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 110,
                                width: 110,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                      'http://vue-upyun.test.upcdn.net/uniqlo/home_rec1.jpg'),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 110,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '花式衬衫',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 2),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Gcolor.back,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              '颜色：白色 - 2161/506',
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 12),
                                            ),
                                            Text(
                                              '尺码：XS',
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      // SizedBox(height:5),
                                      Text(
                                        '支持30天无理由退换货',
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    '￥299',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'x1',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black45),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          for (var i = 0; i < _tipList.length; i++)
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    _tipList[i]['name'],
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          _tipList[i]['intro'],
                                          style: TextStyle(
                                              color: Gcolor.gray, fontSize: 12),
                                        )),
                                  ),
                                  SizedBox(width: 5),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    alignment: Alignment.centerRight,
                                    child: _tipList[i]['icon'] != null
                                        ? Icon(
                                            _tipList[i]['icon'],
                                            color: Gcolor.gray,
                                            size: 12,
                                          )
                                        : SizedBox(),
                                  )
                                ],
                              ),
                            ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text('共一件商品',
                                  style: TextStyle(
                                      color: Gcolor.gray, fontSize: 12)),
                              SizedBox(width: 8),
                              Text(
                                '合计',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(width: 8),
                              Text(
                                '￥299',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Gcolor.red,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 60,
            padding: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: Gcolor.boxShadow,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text('合计:',style: TextStyle(fontSize: 18),),
                SizedBox(width:2),
                Text('￥299',style: TextStyle(fontSize: 18,color: Gcolor.red,fontWeight: FontWeight.bold),),
                SizedBox(width:15),
                MainButton(
                  shadowColor: Colors.black45,
                  onPressed: () {},
                  height: 40,
                  width: 120,
                  title: '提交订单',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
