import 'package:flutter/material.dart';

class JunlTabBarWidget extends StatefulWidget {
  /// const 编译期常量，不可被修改
  /// final 首次被赋值，
  static const BOTTOM_TAB = 1;

  static const TOP_TAB = 2;

  final int type;

  final Color backgroundColor;

  final Color indicatColor;

  final List<Widget> tabItems;

  final List<Widget> tabViews;

  final Widget title;

  final PageController topPageController;

  /// super(key: key) :第一个key为父类的key，第二个key为自己的key
  /// 当使用Stateless Widget时，我们并不需要使用key，
  /// 当使用Stateful Widget时，集合内有数据移动和改变并且需要展示到界面时才需要key。
  JunlTabBarWidget(
      {Key key,
      this.type,
      this.backgroundColor,
      this.indicatColor,
      this.tabItems,
      this.tabViews,
      this.title,
      this.topPageController})
      : super(key: key);

  @override
  _JunlTabBarWidgetState createState() => _JunlTabBarWidgetState();
}

class _JunlTabBarWidgetState extends State<JunlTabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
