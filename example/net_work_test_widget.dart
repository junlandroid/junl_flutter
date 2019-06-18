import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:json_serializable/json_serializable.dart';


class NetworkTestWidget extends StatefulWidget {
  @override
  _NetworkTestWidgetState createState() => _NetworkTestWidgetState();
}

class _NetworkTestWidgetState extends State<NetworkTestWidget> {
  int indexPage = 0;

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NetworkTest'),
      ),
      body:Center(
        child: _renderContent(),
      ),
    );
  }

  void _fetch() async {
    try {
      Response response = await Dio().get("http://gank.io/api/today");
      print(response);
    } catch (e) {
      print(e);
    }
  }

  _renderContent() {

  }
}
