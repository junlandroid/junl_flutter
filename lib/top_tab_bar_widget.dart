import 'package:flutter/material.dart';

import 'junl_tab_bar_widget.dart';
import 'tab_bar_page_first.dart';
import 'tab_bar_page_second.dart';
import 'tab_bar_page_third.dart';

class TabBarPageWidget extends StatefulWidget {
  @override
  _TabBarPageWidgetState createState() => _TabBarPageWidgetState();
}

class _TabBarPageWidgetState extends State<TabBarPageWidget> {
  final PageController topPageControl = PageController();
  final List<String> tab = ["HHHHH", "OOOOO", "PPPPP"];


  @override
  void initState() {
    super.initState();
    print('initState');
  }


  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  _renderPage() {
    return [
      TabBarPageFirstWidget(),
      TabBarPageSecondWidget(),
      TabBarPageThirdWidget(),
    ];
  }

  _renderTab() {
    List<Widget> list = List();
    for (int i = 0; i < tab.length; i++) {
      var flat = FlatButton(
          onPressed: () {
            topPageControl.jumpTo(MediaQuery.of(context).size.width * i);
          },
          child: Text(
            tab[i],
            maxLines: 1,
          ));
      list.add(flat);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return JunlTabBarWidget(
      type: JunlTabBarWidget.TOP_TAB,
      backgroundColor: Colors.cyan,
      indicatColor: Colors.red,
      tabItems: _renderTab(),
      tabViews: _renderPage(),
      title: Text('TopTabBar'),
      topPageController: topPageControl,
    );
  }
}
