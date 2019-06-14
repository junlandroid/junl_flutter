import 'package:flutter/material.dart';
import 'async_await_test.dart';

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
      body: Column(
        children: <Widget>[
          FlatButton(
              color: Colors.blue,
              onPressed: () {
                print('tab');
              },
              child: Text('顶部Tab')),
          FlatButton(
              color: Colors.blue,
              onPressed: () {
                print('tab');
              },
              child: Text('底部Tab')),
          FloatingActionButton(
            onPressed: null,
            child: Text('+'),
          )
        ],
      ),
    );
  }
}
