import 'package:flutter/material.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart' hide RefreshIndicator;

class ListViewTestWidget extends StatefulWidget {
  @override
  _ListViewTestWidgetState createState() => _ListViewTestWidgetState();
}

class _ListViewTestWidgetState extends State<ListViewTestWidget> {
  RefreshController _refreshController;
  List<Widget> data = [];

  @override
  void initState() {
    super.initState();
    _getData();
    _refreshController = RefreshController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView 测试'),
      ),
      body: _layoutListView(),
    );
  }

  Widget _layoutListView() {
    return Container(
      child: SmartRefresher(
        controller: _refreshController,
        header: WaterDropHeader(),
        enablePullDown: true,
        enablePullUp: true,
        child: ListView.builder(
//          itemBuilder: (context, index) => Item(),
          itemBuilder: (context, index) => renderRow(context, index),
          itemCount: data.length,
          itemExtent: 100.0,
        ),
        onRefresh: () {
          Future.delayed(const Duration(milliseconds: 2000)).then((val) {
            data.add(Card(
              color: Colors.purple,
              child: Center(
                child: Text('下拉刷新数据'),
              ),
            ));
            if (mounted) {
              setState(() {
                _refreshController.refreshCompleted();
              });
            }
          });
        },
        onLoading: () {
          Future.delayed(const Duration(milliseconds: 2000)).then((val) {
            if (mounted) {
              setState(() {
                data.add(Image.asset(
                  'res/test.png',
                  fit: BoxFit.fill,
                ));
//                data.add(Card(
//                  color: Colors.pink,
//                  child: Center(
//                    child: Text('上啦加载数据'),
//                  ),
//                ));
                _refreshController.loadComplete();
              });
            }
          });
        },
      ),
    );
  }

  void _getData() {
    for (int i = 0; i < 7; i++) {
      data.add(Card(
        color: Colors.redAccent,
        child: Center(
          child: Text('init data' + i.toString()),
        ),
      ));
    }
  }

  renderRow(BuildContext context, int index) {
    return Card(
      child: data[index],
    );
  }
}

class Head extends StatefulWidget {
  @override
  _HeadState createState() => _HeadState();
}

class _HeadState extends State<Head> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Item extends StatefulWidget {
  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
      child: Center(
        child: Text('Data'),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
