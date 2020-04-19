import 'package:flutter/material.dart';
import 'package:uniqlo/bloc/global.dart';
import 'package:uniqlo/widget/normal_appbar.dart';

class PageCategory extends StatelessWidget {
  final _topList = ['WOMEN', 'MEN', 'KIDS', 'BABY'];
  final _leftList = [
    '新品',
    '上衣',
    '裤子',
    '外套',
    '衬衫',
    '护肤品',
    '女鞋',
    '护肤品',
    '饰品',
    '内衣'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: <Widget>[
            NormalAppBar(
              title: '分类',
              hasShadow: false,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                // boxShadow: Gcolor.boxShadow
              ),
              child: Row(
                children: <Widget>[
                  for (var i = 0; i < _topList.length; i++)
                    Expanded(
                      flex: 1,
                      child: Center(
                          child: Text(
                        _topList[i],
                        style: TextStyle(
                            fontWeight:
                                i == 0 ? FontWeight.bold : FontWeight.w400),
                      )),
                    )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Gcolor.back,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 20,
                      left: 20,
                      bottom: 0,
                      child: Container(
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20))),
                        child: SingleChildScrollView(
                          child: Column(
                            children: _leftList.map((i) {
                              return Container(
                                decoration: BoxDecoration(
                                    color: i == '新品'
                                        ? Gcolor.red
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            i == '新品' ? 20 : 0))),
                                padding: EdgeInsets.all(10),
                                child: Center(
                                  child: Text(
                                    i,
                                    style: TextStyle(
                                        color: i == '新品'
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 90,
                      right: 0,
                      top: 20,
                      bottom: 0,
                      child: SingleChildScrollView(
                        child: Wrap(
                          runSpacing: 20,
                          spacing: 20,
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: List<Widget>.generate(
                            8,
                            (int index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/detail');
                                },
                                child: Container(
                                  width: (MediaQuery.of(context).size.width -
                                          150) /
                                      2,
                                  height: 180,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: Gcolor.boxShadow),
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned.fill(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(
                                              'http://vue-upyun.test.upcdn.net/uniqlo/home_show4.jpg',
                                              fit: BoxFit.fitHeight),
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
                                              bottomLeft: Radius.circular(15),
                                              bottomRight: Radius.circular(15),
                                            ),
                                          ),
                                          height: 30,
                                          child: Center(child: Text('衬衣')),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
