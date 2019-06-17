import 'package:flutter/material.dart';

class TabBarPageThirdWidget extends StatefulWidget {
  @override
  _TabBarPageThirdWidgetState createState() => _TabBarPageThirdWidgetState();
}

class _TabBarPageThirdWidgetState extends State<TabBarPageThirdWidget> {
  final _suggestions = <String>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  generateWordPairs() {
    return [
      "flutter",
      "material",
      "dart",
      "TabBarPageFirstWidget",
      "_buildSuggetion",
      "extends",
      "fontSize",
      "EdgeInsets",
      "TabBarPageFirstWidget",
      "StatefulWidget",
    ];
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
        return _buildRow(_suggestions[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildSuggetion();
  }
}
