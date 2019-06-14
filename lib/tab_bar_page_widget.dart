import 'package:flutter/material.dart';

import 'JunlTabBarWidget.dart';
import 'JunlTabBarWidget.dart';
import 'TabBarPageFirstWidget.dart';

class TabBarPageWidget extends StatefulWidget {
  @override
  _TabBarPageWidgetState createState() => _TabBarPageWidgetState();
}

class _TabBarPageWidgetState extends State<TabBarPageWidget> {
  final PageController topPageControl = PageController();
  final List<String> tab = ["HHHHH", "OOOOO", "PPPPP"];

  _renderPage() {
    return [
      TabBarPageFirstWidget(),
      TabBarPageFirstWidget(),
      TabBarPageFirstWidget(),
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
      topPageController: topPageControl,
      tabItems: _renderTab(),
      tabViews: _renderPage(),
    );
  }
}
