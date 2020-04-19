import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uniqlo/bloc/global.dart';
import 'package:uniqlo/bloc/nav_bloc.dart';
import 'package:uniqlo/jsonClass/json_home.dart';
import 'package:uniqlo/widget/cart_stepper.dart';
import 'package:uniqlo/widget/main_appbar.dart';
import 'package:uniqlo/widget/my_icon_icons.dart';
import 'package:uniqlo/widget/plain_button.dart';

GetIt sl = GetIt.instance;

class PageCart extends StatefulWidget {
  @override
  _PageCartState createState() => _PageCartState();
}

class _PageCartState extends State<PageCart> with TickerProviderStateMixin {
  void _checkAll() {
    var _isAllSelected =
        sl<NavBloc>().currentCart.every((item) => item.checked);
    sl<NavBloc>().checkAll(!_isAllSelected);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: MainAppBar(
            title: '购物车',
            actions: Icon(
              MyIcon.trash,
              size: 22,
              color: Gcolor.black.withOpacity(.7),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: StreamBuilder<List<JsonCartItem>>(
              stream: sl<NavBloc>().cartStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Center(child: Text('没有购物车商品'));
                return Container(
                  color: Gcolor.back,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 20,
                        bottom: 120,
                        left: 20,
                        right: 20,
                        child: ListView(
                          children: <Widget>[
                            for (var i = 0; i < snapshot.data.length; i++)
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                height: 180,
                                child: Stack(
                                  children: <Widget>[
                                    // Positioned(),
                                    Positioned(
                                      top: 20,
                                      bottom: 20,
                                      left: 0,
                                      right: 0,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: 120,
                                            height: 120,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              // border: Border.all(color: Color(0xFF),width: 1)
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Image.network(
                                                snapshot.data[i].img,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 15),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5),
                                              height: 120,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    snapshot.data[i].name,
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 1,
                                                        horizontal: 5),
                                                    decoration: BoxDecoration(
                                                        color: Gcolor.back,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    child: Text(
                                                      '黑色/165/s',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Colors.black45),
                                                    ),
                                                  ),
                                                  Text(
                                                    '￥${snapshot.data[i].price}',
                                                    style: TextStyle(
                                                        fontSize: 23,
                                                        color: Gcolor.red,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        child: Checkbox(
                                          checkColor: Colors.white,
                                          activeColor: Gcolor.red,
                                          value: snapshot.data[i].checked,
                                          onChanged: (bool value) {
                                            sl<NavBloc>().checkItem(i);
                                          },
                                        ),
                                      ),
                                    ),
                                    // stepper
                                    Positioned(
                                      bottom: 5,
                                      right: 10,
                                      child: CartStepper(
                                        count: snapshot.data[i].count,
                                        // index: i
                                        onAdd: () {
                                          sl<NavBloc>().changeCount(i, 'add');
                                        },
                                        onMinus: () {
                                          sl<NavBloc>().changeCount(i, 'minus');
                                        },
                                      ),
                                    ),
                                    // Positioned(),
                                  ],
                                ),
                              )
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 61,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          color: Colors.white,
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 30,
                                      height: 30,
                                      child: Checkbox(
                                        activeColor: Gcolor.red,
                                        onChanged: (bool value) {
                                          _checkAll();
                                        },
                                        value: sl<NavBloc>()
                                            .currentCart
                                            .every((item) => item.checked),
                                      ),
                                    ),
                                    SizedBox(width: 2),
                                    InkWell(onTap: _checkAll, child: Text('全选'))
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Row(
                                        // crossAxisAlignment: CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Text(
                                            '合计:',
                                            style:
                                                TextStyle(color: Gcolor.gray),
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            '￥${sl<NavBloc>().totalPrice}',
                                            style: TextStyle(
                                                color: Gcolor.red,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    MainButton(
                                      // caclTotalCount
                                      onPressed: () {},
                                      height: 40,
                                      width: 90,
                                      isRadius: true,
                                      title: '结算(${sl<NavBloc>().totalCount})',
                                      color: Gcolor.red,
                                      fontColor: Colors.white,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
