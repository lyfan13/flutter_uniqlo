import 'package:flutter/material.dart';
import 'package:uniqlo/bloc/global.dart';
import 'package:uniqlo/jsonClass/json_home.dart';
import 'package:uniqlo/utils/http.dart';
import 'package:uniqlo/widget/bottom_tip.dart';
import 'package:uniqlo/widget/main_appbar.dart';
import 'package:uniqlo/widget/my_icon_icons.dart';
import 'package:uniqlo/widget/plain_button.dart';

class PageLocation extends StatefulWidget {
  @override
  _PageLocationState createState() => _PageLocationState();
}

class _PageLocationState extends State<PageLocation> {
  List<JsonLocation> _storeList;

  Future _getStoreList() async {
    var response = await dio.get('/flutter/mall/location');
    _storeList = response.data['dataList']
        .map<JsonLocation>((i) => JsonLocation.fromJson(i))
        .toList();
  }

  @override
  void initState() {
    _allFuture = _getStoreList();
    super.initState();
  }

  Future _allFuture;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: FutureBuilder(
        future: _allFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          }
          return Column(
            children: <Widget>[
              MainAppBar(
                title: '门店',
                actions: Row(
                  children: <Widget>[
                    Text('成都'),
                    SizedBox(width: 5),
                    Icon(
                      MyIcon.chevron_down,
                      size: 16,
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Color(0XFFEEEEEE),
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Icon(
                        MyIcon.magnifier,
                        size: 18,
                        color: Gcolor.gray,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: '请输入店铺名称',
                            labelStyle:
                                TextStyle(fontSize: 15, color: Gcolor.gray)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                flex: 1,
                child: ListView(
                  children: <Widget>[
                    for (var i = 0; i < _storeList.length; i++)
                      Container(
                        margin: EdgeInsets.only(bottom: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(_storeList[i].img),
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Container(
                                padding: EdgeInsets.only(left: 12),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Gcolor.gray.withOpacity(.3),
                                          spreadRadius: 0,
                                          blurRadius: 10),
                                    ],
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15))),
                                height: 120,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      _storeList[i].name,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      _storeList[i].intro,
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    Text(
                                      _storeList[i].time,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Gcolor.black.withOpacity(.6)),
                                    ),
                                    SizedBox(height: 25),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: MainButton(
                                onPressed: (){},
                                width: 80,
                                height: 27,
                                title: '进店选购',
                                size: 12,
                                color: Gcolor.red,
                                isRadius: true,
                                fontColor: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    BottomTip()
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
