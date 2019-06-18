import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  final String text;

  IndexPage(this.text);

  @override
  _IndexPageState createState() => _IndexPageState(text);
}

class _IndexPageState extends State<IndexPage> {
  String text;

  _IndexPageState(this.text);

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        text = "这几变了数值";
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    renderSome();
    return Container(
      color: Colors.yellow,
      alignment: Alignment.center,
      child: Text(
        text ?? "这就是有状态DMEO",
//        style: TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  request() async {
    await Future.delayed(Duration(seconds: 1));
    return "ok!";
  }

  doSomething() async {
    String data = await request();
    data = "ok is data";
    return data;
  }

  renderSome() {
    doSomething().then((value){
      print(value);
    });
  }
}