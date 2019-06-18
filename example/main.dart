import 'package:flutter/material.dart';
import 'async_await_test.dart';
import 'top_tab_bar_widget.dart';
import 'bottom_tab_bar_widget.dart';
import 'list_view_test_widget.dart';
import 'net_work_test_widget.dart';

void main() => runApp(JunlApp());

class JunlApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JunlApp',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Junl'),
      ),
      body: layout(context),
    );
  }

  Widget layout(BuildContext context) {
    return Column(
      children: <Widget>[
        FlatButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TabBarPageWidget()));
            },
            child: Text('顶部Tab')),
        FlatButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => BottomTabBarWidget()));
            },
            child: Text('底部Tab')),
        FlatButton(
          color: Colors.deepOrange,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewTestWidget()));
          },
          child: Text('ListView 测试'),
        ),
        FlatButton(
            color: Colors.yellowAccent,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NetworkTestWidget()));
            },
            child: Text('Network Test')),
      ],
    );
  }
}
