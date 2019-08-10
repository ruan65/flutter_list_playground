import 'package:flutter/material.dart';

class SimpleListScreen extends StatefulWidget {
  @override
  _SimpleListScreenState createState() => _SimpleListScreenState();
}

class _SimpleListScreenState extends State<SimpleListScreen> {

  List<String> list = [];
  var count = 0;

  void _addToList() {
    List<String> itemsToAdd = Iterable<int>.generate(5)
        .map((i) => 'items addition #$i($count)')
        .toList();
    count++;
    setState(() {
      list.addAll(itemsToAdd);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = list.reversed
        .map((text) => Padding(padding: EdgeInsets.all(50), child: Text(text)))
        .toList();

    return Scaffold(
      body: Center(
        child: ListView(
          children: widgetList,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addToList,
        child: Icon(Icons.add),
      ),
    );
  }
}
