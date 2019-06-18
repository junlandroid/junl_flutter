import 'package:flutter/material.dart';
import 'junl_tab_bar_widget.dart';
import 'tab_bar_page_first.dart';
import 'tab_bar_page_second.dart';
import 'tab_bar_page_third.dart';

class BottomTabBarWidget extends StatefulWidget {

  @override
  _BottomTabBarWidgetState createState() => _BottomTabBarWidgetState();
}

class _BottomTabBarWidgetState extends State<BottomTabBarWidget> {
  final PageController _pageController = PageController();
  final List<String> tab = ["Hello", "World", "Developer"];

  @override
  Widget build(BuildContext context) {
    return JunlTabBarWidget(
      type: JunlTabBarWidget.BOTTOM_TAB,
      backgroundColor: Colors.cyan,
      indicatColor: Colors.purple,
      tabItems: _renderTab(),
      tabViews: _renderPage(),
      title: Text('Bottom TabBar'),
      topPageController: _pageController,
    );
  }

  _renderTab() {
    List<Widget> list = List();
    for (int i = 0; i < tab.length; i++) {
      list.add(
          FlatButton(
            onPressed: () {
              _pageController.jumpTo(MediaQuery
                  .of(context)
                  .size
                  .width * i);
            },
            child: Text(
              tab[i],
              maxLines: 1,
            ),)
      );
    }
    return list;
  }

  _renderPage() {
    return [
      TabBarPageFirstWidget(),
      TabBarPageSecondWidget(),
      TabBarPageThirdWidget(),
    ];
  }
}


