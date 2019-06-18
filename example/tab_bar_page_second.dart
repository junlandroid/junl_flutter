import 'package:flutter/material.dart';

class TabBarPageSecondWidget extends StatefulWidget {
  @override
  _TabBarPageSecondWidgetState createState() => _TabBarPageSecondWidgetState();
}

class _TabBarPageSecondWidgetState extends State<TabBarPageSecondWidget> {
  final _suggestions = <String>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  generateWordPairs() {
    return [
      "aaaa",
      "bbbb",
      "cccc",
      "vvvv",
      "_buildSuggetion",
      "ListView",
      "builder",
      "EdgeInsets",
      "String",
      "_buildRow",
    ];
  }

  _buildRow(String suggestion) {
    return ListTile(
      title: Text(
        suggestion,
        style: _biggerFont,
      ),
      onTap: (){
        print('item 点击事件');
      },
    );
  }

  Widget _buildSuggetion() {
    return ListView.builder(
      padding: const EdgeInsets.all(15),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs());
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildSuggetion();
  }
}
