import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TabBarPageZeroWidget extends StatefulWidget {
  @override
  _TabBarPageZeroWidgetState createState() => _TabBarPageZeroWidgetState();
}

class _TabBarPageZeroWidgetState extends State<TabBarPageZeroWidget> {
//  final _suggestions = <String>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  ScrollController _scrollController = ScrollController();
  List _list = List();

  @override
  void initState() {
    super.initState();
    _getData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        print('滑动到最底部');
        Fluttertoast.showToast(msg: '滑动到最底部');
        _getMore();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  _buildRow(String suggestion, int index) {
    return ListTile(
      title: Text(
        suggestion,
        style: _biggerFont,
      ),
      onTap: () {
        print(index);
      },
    );
  }

  Widget _buildSuggetion() {
    return Scaffold(
      body: RefreshIndicator(
        child: ListView.builder(
          padding: const EdgeInsets.all(15),
          itemBuilder: (context, i) {
            _renderRow(context, i);
          },
          itemCount: _list.length,
          controller: _scrollController,
        ),
        onRefresh: _onRefresh,
        backgroundColor: Colors.limeAccent,
      ),
    );
  }

  Future<Null> _onRefresh() async {
    int _index = 0;
    await Future.delayed(Duration(seconds: 3), () {
      print('刷新');
      setState(() {
//        _suggestions.add('最新数据:' + _index.toString());
        Fluttertoast.showToast(msg: '下拉刷新');
      });
      _index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildSuggetion();
  }

  void _getMore() {}

  Future _getData() async {
    await Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _list = List.generate(10, (i) => '我是原始数据 $i');
        });
      }
    });
  }

  _renderRow(BuildContext context, int index) {
    return ListTile(
      title: Text(_list[index]),
    );
//    return ListTile(
//      title: Text(
//        _list[index],
//        style: _biggerFont,
//      ),
//    );
  }
}
