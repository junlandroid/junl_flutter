import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TabBarPageFirstWidget extends StatefulWidget {
  @override
  _TabBarPageFirstWidgetState createState() => _TabBarPageFirstWidgetState();
}

class _TabBarPageFirstWidgetState extends State<TabBarPageFirstWidget> {
  final _suggestions = <String>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener((){
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

  generateWordPairs() {
    return [
      "1111",
      "2222",
      "3333",
    ];
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
    return RefreshIndicator(
      child: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs());
          }
          _suggestions.addAll(generateWordPairs());

          return _buildRow(_suggestions[index], index);
        },
        controller: _scrollController,
      ),
      onRefresh: _onRefresh,
      backgroundColor: Colors.limeAccent,
    );
  }

  Future<Null> _onRefresh() async {
    int _index = 0;
    await Future.delayed(Duration(seconds: 3), () {
      print('刷新');
      setState(() {
        _suggestions.add('最新数据:' + _index.toString());
        Fluttertoast.showToast(msg: '滑动到最底部');
      });
      _index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildSuggetion();
  }

  void _getMore() {}

}
