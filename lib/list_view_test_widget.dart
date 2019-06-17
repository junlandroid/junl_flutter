import 'package:flutter/material.dart';

class ListViewTestWidget extends StatefulWidget {
  @override
  _ListViewTestWidgetState createState() => _ListViewTestWidgetState();
}

class _ListViewTestWidgetState extends State<ListViewTestWidget> {
  List list = List();

  @override
  void initState() {
    super.initState();
    getData();
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

  Future getData() async {
    await Future.delayed(Duration(seconds: 2), () {
      print('getData');
      setState(() {
        list = List.generate(10, (i) => '初始化数据$i');
        print('初始化数据大小：' + list.length.toString());
      });
    });
  }

  Widget renderRow(BuildContext context, int i) {
    return ListTile(
      title: Text(list[i]),
    );
  }

  Widget _layoutListView() {
    return RefreshIndicator(
      child: ListView.builder(
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          return renderRow(context, i);
        },
        itemCount: list.length,
      ),
      onRefresh: _onRefresh,
    );
  }

  Future _onRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      print('下拉刷新');
      setState(() {
//        list.add('下拉刷新数据');
        list = List.generate(30, (i) => '我是下拉刷新之后的数据$i');
      });
    });
  }
}
