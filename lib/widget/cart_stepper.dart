import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
import 'package:uniqlo/bloc/global.dart';
// import 'package:uniqlo/bloc/nav_bloc.dart';

// GetIt sl = GetIt.instance;

class CartStepper extends StatefulWidget {
  const CartStepper(
      {Key key,
      @required this.count,
      @required this.onAdd,
      @required this.onMinus,
      bool isRadius})
      : isRadius = isRadius ?? false,
        super(key: key);

  final int count;
  final Function onAdd;
  final Function onMinus;
  final bool isRadius;

  @override
  _CartStepperState createState() => _CartStepperState();
}

class _CartStepperState extends State<CartStepper>
    with TickerProviderStateMixin {
  Animation _animatedAdd;
  Animation _animatedMinus;
  AnimationController _animatedAddController;
  AnimationController _animatedMinusController;
  Tween<double> _tween = Tween<double>(begin: 1, end: 1.3);

  @override
  void initState() {
    super.initState();
    _animatedAddController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animatedMinusController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animatedAdd = _tween.animate(_animatedAddController)
      ..addListener(() {
        setState(() {});
        if (_animatedAdd.value > 1.28) _animatedAddController.reverse();
      });
    _animatedMinus = _tween.animate(_animatedMinusController)
      ..addListener(() {
        setState(() {});
        if (_animatedMinus.value > 1.28) _animatedMinusController.reverse();
      });
  }

  void _animateBtn(String type) {
    type == 'add'
        ? _animatedAddController.forward()
        : _animatedMinusController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 20,
      // color: Colors.black12,
      child: Row(
        children: <Widget>[
          ScaleTransition(
            scale: _animatedMinus,
            child: InkWell(
              onTap: () {
                if (widget.count > 1) {
                  // sl<NavBloc>().changeCount(widget.index, 'minus');
                  widget.onMinus();
                  _animateBtn('minus');
                }
              },
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    color: Gcolor.back,
                    borderRadius:
                        BorderRadius.circular(widget.isRadius ? 10 : 0)),
                child: Center(
                  child: Container(
                    height: 1,
                    width: 12,
                    color: widget.count > 1 ? Colors.black45 : Colors.black12,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 5),
          Container(
            // width: 25,
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 14),
            // height: 25,
            decoration: BoxDecoration(
                    color: Gcolor.back,
                    borderRadius:
                        BorderRadius.circular(widget.isRadius ? 10 : 0)),
            child: Center(
                child: Text(
              '${widget.count}',
              style: TextStyle(fontSize: 16),
            )),
          ),
          SizedBox(width: 5),
          ScaleTransition(
            scale: _animatedAdd,
            child: InkWell(
              onTap: () {
                // sl<NavBloc>().changeCount(widget.index, 'add');
                widget.onAdd();
                _animateBtn('add');
              },
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    color: Gcolor.back,
                    borderRadius:
                        BorderRadius.circular(widget.isRadius ? 10 : 0)),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 12,
                      left: 6.5,
                      child: Container(
                        height: 1,
                        width: 12,
                        color: Colors.black45,
                      ),
                    ),
                    Positioned(
                      top: 6.5,
                      left: 12,
                      child: Container(
                        height: 12,
                        width: 1,
                        color: Colors.black45,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
