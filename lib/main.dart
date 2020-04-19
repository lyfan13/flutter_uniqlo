import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uniqlo/bloc/nav_bloc.dart';
import 'package:uniqlo/views/page_cart.dart';
import 'package:uniqlo/views/page_category.dart';
import 'package:uniqlo/views/page_confirm.dart';
import 'package:uniqlo/views/page_detail.dart';
import 'package:uniqlo/views/page_home.dart';
import 'package:uniqlo/views/page_location.dart';
import 'package:uniqlo/views/page_user.dart';
import 'package:uniqlo/widget/main_navbar.dart';

GetIt sl = GetIt.instance;

void main() {
  sl.registerSingleton<NavBloc>(NavBloc());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(unselectedWidgetColor: Colors.black12),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child,
        );
      },
      home: MyHomePage(),
      routes: <String,WidgetBuilder>{
        '/detail':(context)=>ProductDetail(),
        '/confirm':(context)=>PageConfirm(),
        '/category':(context)=>PageCategory(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPageIndex = 0;
  PageController pageController;
  final List<Widget> pageList = [
    PageHome(),
    PageLocation(),
    PageCart(),
    PageUser()
  ];
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _currentPageIndex);
    sl<NavBloc>().stream.listen((int val) {
      if (val != null && val != _currentPageIndex) {
        pageController.animateToPage(val,
            duration: Duration(milliseconds: 300), curve: Curves.easeOutQuint);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    sl<NavBloc>().close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: true,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: PageView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      controller: pageController,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return pageList[index];
                      },
                      onPageChanged: (index) {
                        setState(() {
                          _currentPageIndex = index;
                        });
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: MainNavBar(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
