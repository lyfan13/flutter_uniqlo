import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uniqlo/jsonClass/json_home.dart';

class NavBloc {
  BehaviorSubject<int> navBloc = BehaviorSubject<int>.seeded(0);
  BehaviorSubject<List<JsonCartItem>> cart =
      BehaviorSubject<List<JsonCartItem>>.seeded([
    // {'id': 1, 'name': '长裙子', 'price': 199, 'count': 1}
    JsonCartItem(
        id: 1,
        name: '长裙子',
        price: 199,
        count: 1,
        img: 'http://vue-upyun.test.upcdn.net/uniqlo/home_rec1.jpg',
        checked: true),
    JsonCartItem(
        id: 1,
        name: '长裙子',
        price: 199,
        count: 1,
        img: 'http://vue-upyun.test.upcdn.net/uniqlo/home_rec2.jpg',
        checked: false),
    JsonCartItem(
        id: 1,
        name: '长裙子',
        price: 199,
        count: 1,
        img: 'http://vue-upyun.test.upcdn.net/uniqlo/home_rec3.jpg',
        checked: true),
    JsonCartItem(
        id: 1,
        name: '长裙子',
        price: 199,
        count: 1,
        img: 'http://vue-upyun.test.upcdn.net/uniqlo/home_rec4.jpg',
        checked: false)
  ]);
  BehaviorSubject<Color> unSafeColor =
      BehaviorSubject<Color>.seeded(Colors.white);
  Stream<int> get stream => navBloc;
  Stream<List> get cartStream => cart;
  Stream<Color> get colorStream => unSafeColor;
  int get value => navBloc.value;
  List<JsonCartItem> get currentCart => cart.value;
  // list.where((item)=>item['checked']).map((item)=>item['id']).reduce((value,item)=>value+item);
  int get totalPrice => calcTotalPrice();
  int get totalCount => caclTotalCount();
  Color get currentColor => unSafeColor.value;
  caclTotalCount() {
    if (cart.value == null) return 0;
    if (cart.value.where((item) => item.checked).length == 0) return 0;
    return cart.value.where((item) => item.checked).length;
  }

  calcTotalPrice() {
    if (cart.value == null) return 0;
    if (cart.value.where((item) => item.checked).length == 0) return 0;
    return cart.value
        .where((item) => item.checked)
        .map((item) => item.price)
        .reduce((value, item) => value + item);
  }

  changeColor(Color color) {
    unSafeColor.add(color);
  }

  add(int index) {
    navBloc.sink.add(index);
  }

  changeCount(int index, String type) {
    List<JsonCartItem> _list = currentCart;
    type == 'add' ? _list[index].count++ : _list[index].count--;
    cart.sink.add(_list);
  }

  checkItem(int index) {
    List<JsonCartItem> _list = currentCart;
    _list[index].checked = !_list[index].checked;
    cart.sink.add(_list);
  }

  checkAll(bool value) {
    List<JsonCartItem> _list = currentCart;
    _list.forEach((item) {
      item.checked = value;
    });
    cart.sink.add(_list);
  }

  addCart(JsonCartItem item) {
    // currentCart.map(f)
    List _list = currentCart;
    _list.add(item);
    cart.sink.add(_list);
  }

  close() {
    navBloc.close();
    cart.close();
    unSafeColor.close();
  }
}
