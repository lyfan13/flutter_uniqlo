import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:uniqlo/bloc/global.dart';
import 'package:uniqlo/jsonClass/json_home.dart';
import 'package:uniqlo/utils/http.dart';
import 'package:uniqlo/widget/bottom_tip.dart';
import 'package:uniqlo/widget/main_appbar.dart';
import 'package:uniqlo/widget/my_icon_icons.dart';
import 'package:uniqlo/widget/plain_button.dart';
import 'package:uniqlo/widget/swiper_dots.dart';

class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  int _insideIndex = 0;
  // double _startX;
  // double _distance;
  final Map _header = {0: '新品', 1: '商城'};
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }
  // void _onHorizontalDragStart(DragStartDetails details) {
  //   print(details.localPosition.dx);
  //   setState(() {
  //     _startX = details.localPosition.dx;
  //   });
  // }

  // void _onHorizontalDragUpdate(DragUpdateDetails details) {
  //   var _val = details.localPosition.dx - _startX;
  //   print(_val);
  //   setState(() {
  //     _distance = _val;
  //   });
  // }

  // void _onHorizontalDragEnd(DragEndDetails details) {
  //   print('end');
  //   var _deviceWidth = MediaQuery.of(context).size.width;
  //   print(_deviceWidth);
  //   if (_distance > 0 && _distance > _deviceWidth / 4) {
  //     print('to right');
  //     setState(() {
  //       _insideIndex = 0;
  //     });
  //   }
  //   if (_distance < 0 && _distance < _deviceWidth / 4) {
  //     print('to left');
  //     setState(() {
  //       _insideIndex = 1;
  //     });
  //   }
  // }
  void _changePage(int index) {
    setState(() {
      _insideIndex = index;
    });
    // _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
  }

  final List<Widget> _bodyList = [SectionNew(), SectionMall()];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18),
      // color: Colors.blueAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MainAppBar(
            title: '优衣库',
            actions: Row(
              children: <Widget>[
                Icon(
                  MyIcon.magnifier,
                  color: Gcolor.black,
                  size: 20,
                ),
                SizedBox(width: 20),
                Icon(
                  MyIcon.text_align_right,
                  color: Gcolor.black,
                  size: 22,
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child:
                // GestureDetector(
                //   onHorizontalDragStart: _onHorizontalDragStart,
                //   onHorizontalDragUpdate: _onHorizontalDragUpdate,
                //   onHorizontalDragEnd: _onHorizontalDragEnd,
                // child:
                Column(
              children: <Widget>[
                Container(
                  // color: Colors.redAccent,
                  height: 50,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: _header
                          .map((i, item) => MapEntry(
                              i,
                              PlainButton(
                                child: Container(
                                  height: 50,
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: AnimatedDefaultTextStyle(
                                    duration: Duration(milliseconds: 100),
                                    style: TextStyle(
                                        fontSize: _insideIndex == i ? 25 : 20,
                                        color: _insideIndex == i
                                            ? Gcolor.black
                                            : Gcolor.gray,
                                        fontWeight: _insideIndex == i
                                            ? FontWeight.w600
                                            : FontWeight.w500),
                                    child: Text(
                                      _header[i],
                                    ),
                                  ),
                                  alignment: Alignment.bottomCenter,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _insideIndex = i;
                                  });
                                  _pageController.animateToPage(i,
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.fastOutSlowIn);
                                },
                              )))
                          .values
                          .toList()),
                ),
                Expanded(
                  flex: 1,
                  child: PageView.builder(
                    // physics: Ne,
                    onPageChanged: _changePage,
                    controller: _pageController,
                    itemCount: _bodyList.length,
                    itemBuilder: (context, index) {
                      return _bodyList[index];
                    },
                  ),
                ),
              ],
            ),
            // ),
          ),
          // 人气推荐
          // 穿搭种草
        ],
      ),
    );
  }
}

class SectionNew extends StatefulWidget {
  @override
  _SectionNewState createState() => _SectionNewState();
}

class _SectionNewState extends State<SectionNew>
    with AutomaticKeepAliveClientMixin {
  int _swiperIndex = 0;
  List<String> _swiperList;
  List<JsonShareItem> _shareList;
  List<JsonRecItem> _recList;
  List<String> _showList;
  // final AsyncMemoizer _memoizer = AsyncMemoizer();
  Future _getSwiperList() async {
    var response = await dio.get('/flutter/home/swiperlist');
    if (_showList != null) return;
    _swiperList =
        response.data['dataList'].map<String>((x) => x.toString()).toList();
  }

  Future _getShareList() async {
    if (_showList != null) return;
    var response = await dio.get('/flutter/home/sharelist');
    _shareList = response.data['dataList']
        .map<JsonShareItem>((i) => JsonShareItem.fromJson(i))
        .toList();
  }

  Future _getRecList() async {
    if (_showList != null) return;
    var response = await dio.get('/flutter/home/reclist');
    _recList = response.data['dataList']
        .map<JsonRecItem>((i) => JsonRecItem.fromJson(i))
        .toList();
  }

  Future _getShowList() async {
    if (_showList != null) return;
    var response = await dio.get('/flutter/home/showlist');
    _showList =
        response.data['dataList'].map<String>((x) => x.toString()).toList();
  }

  Future<Null> _getAll() async {
    await Future.wait(
        [_getSwiperList(), _getShareList(), _getRecList(), _getShowList()]);
    return null;
  }

  Future _allFuture;
  @override
  void initState() {
    _allFuture = _getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return FutureBuilder(
      future: _allFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView(
          key: PageStorageKey(0),
          physics: const AlwaysScrollableScrollPhysics(),
          children: <Widget>[
            Container(
              height: 150,
              // color: Colors.blueAccent,
              child: Swiper(
                onIndexChanged: (int index) {
                  setState(() {
                    _swiperIndex = index;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                        // boxShadow: [BoxShadow(color: Colors.black87,blurRadius: 1,spreadRadius: 1)]
                        border: Border.all(color: Gcolor.back, width: 1)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: new Image.network(
                        _swiperList[index],
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  );
                },
                itemCount: _swiperList.length,
              ),
            ),
            SizedBox(height: 10),
            SwiperDots(index: _swiperIndex, count: _swiperList.length),
            // 超值分享区
            Container(
              // color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 60,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 10,
                          left: 0,
                          child: Text('超值分享', style: Gcolor.styleTitle),
                        )
                      ],
                    ),
                  ),
                  for (var i = 0; i < _shareList.length; i++)
                    Container(
                      // color: Colors.yellowAccent,
                      margin: EdgeInsets.only(bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/detail');
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                _shareList[i].img,
                                width: 90,
                                height: 90,
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/detail');
                              },
                              child: Container(
                                height: 85,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      _shareList[i].title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Text(
                                        _shareList[i].intro,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Gcolor.gray),
                                      ),
                                    ),
                                    Text(
                                      '￥${_shareList[i].price}',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          MainButton(
                            height: 25,
                            width: 60,
                            size: 13,
                            onPressed: () {
                              Navigator.pushNamed(context, '/confirm');
                            },
                            title: '购买',
                            color: Colors.red,
                            fontColor: Colors.white,
                            isRadius: true,
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
            // SizedBox(height: 10),
            Container(
              // height: 50,
              // color: Colors.greenAccent,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 60,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 10,
                          left: 0,
                          child: Text('人气推荐', style: Gcolor.styleTitle),
                        )
                      ],
                    ),
                  ),
                  // Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: Text('人气推荐', style: Gcolor.styleTitle)),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Wrap(
                    runSpacing: 20,
                    spacing: 20,
                    // runAlignment: WrapAlignment.center,
                    // alignment: WrapAlignment.center,

                    children: <Widget>[
                      for (var i = 0; i < _recList.length; i++)
                        RecItem(recList: _recList, i: i)
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    '优衣库生活运动系列',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '速干-弹力-防晒-透气 健康生活随心动',
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                  SizedBox(height: 10),
                  MainButton(
                    icon: MyIcon.cart,
                    color: Gcolor.red,
                    // shadowColor:Gcolor.red,
                    width: 100,
                    height: 25,
                    isRadius: true,
                    size: 12,
                    onPressed: () {Navigator.pushNamed(context, '/category');},
                    title: '立即选购',
                    fontColor: Colors.white,
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 60,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 10,
                          left: 0,
                          child: Text('穿搭种草', style: Gcolor.styleTitle),
                        ),
                        Positioned(
                          bottom: 2,
                          left: 0,
                          child: Text(
                            '舒适新衣简约有型 唤醒春日活力造型',
                            style: TextStyle(color: Gcolor.gray),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: Icon(
                            MyIcon.chevron_right,
                            size: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          for (var i = 0;
                              i < _showList.sublist(0, 3).length;
                              i++)
                            ShowItem(showList: _showList, i: i)
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          for (var i = 0; i < _showList.sublist(3).length; i++)
                            ShowItem(showList: _showList, i: i + 3)
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            BottomTip(),
          ],
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ShowItem extends StatelessWidget {
  const ShowItem({
    Key key,
    @required List showList,
    @required this.i,
  })  : _showList = showList,
        super(key: key);

  final List _showList;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.tealAccent,
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(2),
      width: (MediaQuery.of(context).size.width - 51) / 2,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Gcolor.gray.withOpacity(.3),
                  spreadRadius: 0,
                  blurRadius: 10)
            ],
          ),
          child: Stack(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(_showList[i], fit: BoxFit.fitWidth)),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    height: 30,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Icon(
                                MyIcon.thumbs_up,
                                size: 18,
                                color: Gcolor.gray,
                              ),
                              SizedBox(width: 5),
                              Text(
                                '99',
                                style:
                                    TextStyle(color: Gcolor.gray, fontSize: 14),
                              )
                            ],
                          ),
                        ),
                        Icon(
                          MyIcon.cart,
                          color: Gcolor.red,
                          size: 18,
                        )
                      ],
                    )),
              )
            ],
          )),
    );
  }
}

class RecItem extends StatelessWidget {
  const RecItem({
    Key key,
    @required List recList,
    @required this.i,
  })  : _recList = recList,
        super(key: key);

  final List _recList;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.tealAccent,
      padding: EdgeInsets.all(2),
      width: (MediaQuery.of(context).size.width - 58) / 2,
      height: (MediaQuery.of(context).size.width - 58) / 2,
      child: InkWell(
        onTap: (){Navigator.pushNamed(context, '/category');},
              child: Stack(
          children: <Widget>[
            Container(),
            Positioned.fill(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Gcolor.gray.withOpacity(.3),
                          spreadRadius: 0,
                          blurRadius: 10)
                    ],
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        _recList[i].img,
                        fit: BoxFit.cover,
                      ))),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(
                  child: Text(
                _recList[i].title,
                style: TextStyle(color: Colors.white, letterSpacing: 5),
              )),
            )
          ],
        ),
      ),
    );
  }
}

class SectionMall extends StatefulWidget {
  @override
  _SectionMallState createState() => _SectionMallState();
}

class _SectionMallState extends State<SectionMall> {
  List<JsonTagItem> _tagList;
  List<JsonMallRecItem> _recList;
  Future _getTagList() async {
    var response = await dio.get('/flutter/mall/tag');
    _tagList = response.data['dataList']
        .map<JsonTagItem>((i) => JsonTagItem.fromJson(i))
        .toList();
    // _showList = response.data['dataList'].map<String>((x)=>x.toString()).toList();
  }

  Future _getRecList() async {
    var response = await dio.get('/flutter/mall/reclist');
    _recList = response.data['dataList']
        .map<JsonMallRecItem>((i) => JsonMallRecItem.fromJson(i))
        .toList();
  }

  Future<Null> _getAll() async {
    await Future.wait([_getTagList(), _getRecList()]);
    return null;
  }

  Future _allFuture;

  @override
  void initState() {
    _allFuture = _getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _allFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView(
          shrinkWrap: true,
          children: <Widget>[
            Wrap(
              runSpacing: 20,
              spacing: 20,
              children: <Widget>[
                for (var i = 0; i < _tagList.length; i++)
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/category');
                    },
                    child: Container(
                      // color: Colors.tealAccent,
                      padding: EdgeInsets.all(2),
                      width: (MediaQuery.of(context).size.width - 58) / 2,
                      height: (MediaQuery.of(context).size.width - 58) / 2 * .8,
                      child: Stack(
                        children: <Widget>[
                          Container(),
                          Positioned.fill(
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Gcolor.gray.withOpacity(.3),
                                        spreadRadius: 0,
                                        blurRadius: 10)
                                  ],
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      _tagList[i].img,
                                      fit: BoxFit.cover,
                                    ))),
                          ),
                          Positioned(
                            bottom: 0,
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                                child: Text(
                              _tagList[i].name,
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  letterSpacing: 5),
                            )),
                          )
                        ],
                      ),
                    ),
                  )
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: 60,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 10,
                    left: 0,
                    child: Text('本周推荐', style: Gcolor.styleTitle),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Icon(
                      MyIcon.chevron_right,
                      size: 20,
                    ),
                  )
                ],
              ),
            ),
            Container(
              // width: MediaQuery.of(context).size.width,
              height: 260,
              // color: Colors.blueAccent,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  for (var i = 0; i < _recList.length; i++)
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      margin: EdgeInsets.only(right: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/detail');
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(_recList[i].img),
                            ),
                            SizedBox(height: 5),
                            Text(_recList[i].name),
                            Text(
                              '￥${_recList[i].price}',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    )
                ],
              ),
            ),
            BottomTip()
          ],
        );
      },
    );
  }
}
