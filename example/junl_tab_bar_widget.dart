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

  final Widget drawer;

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
      this.drawer,
      this.title,
      this.topPageController})
      : super(key: key);

  @override
  _JunlTabBarWidgetState createState() => _JunlTabBarWidgetState(
      type, backgroundColor, indicatColor, tabItems, tabViews, drawer, title, topPageController);
}

class _JunlTabBarWidgetState extends State<JunlTabBarWidget> with SingleTickerProviderStateMixin {
  final int _type;
  final Color _backgroundColor;
  final Color _indicatColor;

  final List<Widget> _tabItems;

  final List<Widget> _tabViews;

  final Widget _title;

  final Widget _drawer;

  final PageController _topPageController;

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabItems.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _JunlTabBarWidgetState(this._type, this._backgroundColor, this._indicatColor, this._tabItems,
      this._tabViews, this._drawer, this._title, this._topPageController)
      : super();

  @override
  Widget build(BuildContext context) {
    /// Scaffold 一般用户页面的承载Widget，包含appbar、snackbar、drawer等material design的设定
    if (this._type == JunlTabBarWidget.TOP_TAB) {
      return Scaffold(
        drawer: _drawer,
        appBar: AppBar(
          title: _title,
          backgroundColor: _backgroundColor,
          bottom: TabBar(
            isScrollable: true,
            controller: _tabController,
            tabs: _tabItems,
            indicatorColor: _indicatColor,
          ),
        ),
        body: PageView(
            controller: _topPageController,
            children: _tabViews,
            onPageChanged: (index) {
              _tabController.animateTo(index);
            }),
      );
    }
    return Scaffold(
      drawer: _drawer,
      appBar: AppBar(
        title: _title,
        backgroundColor: _backgroundColor,
      ),
      body: PageView(
        controller: _topPageController,
        children: _tabViews,
        onPageChanged: (index){
          _tabController.animateTo(index);
        },

      ),
      bottomNavigationBar: Material(
        color: _backgroundColor,
        child: TabBar(
          tabs: _tabItems,
          controller: _tabController,
          indicatorColor: _indicatColor,
        ),
      ),
    );
  }
}
