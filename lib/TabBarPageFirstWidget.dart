import 'package:flutter/material.dart';

class TabBarPageFirstWidget extends StatefulWidget {
  @override
  _TabBarPageFirstWidgetState createState() => _TabBarPageFirstWidgetState();
}

class _TabBarPageFirstWidgetState extends State<TabBarPageFirstWidget> {
  final _suggestions = <String>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  generateWordPairs() {
    return ["1111", "2222", "3333", "4444", "5555", "6666", "7777", "8888", "9999", "0000"];
  }

  _buildRow(String suggestion) {
    return ListTile(
      title: Text(
        suggestion,
        style: _biggerFont,
      ),
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
        return _buildRow(_suggestions[i]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildSuggetion();
  }
}
