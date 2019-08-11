import 'dart:math';

import 'package:flutter/material.dart';

class ColumnScreen extends StatefulWidget {
  @override
  _ColumnScreenState createState() => _ColumnScreenState();
}

class _ColumnScreenState extends State<ColumnScreen> {
//  List<Widget> items = List<Widget>()..length = 20;
  List<Widget> items = [];

  final _scrollController = ScrollController(initialScrollOffset: 100);

  @override
  void initState() {
    super.initState();

    items.addAll(getItems(Random().nextInt(1000000)));
//    items = getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              addToList();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Center(
          child: Column(
            children: items,
          ),
        ),
      ),
    );
  }

  addToList() {
    print('adding...');
    items.insertAll(0, getItems(Random().nextInt(1000000)));
    print(items);
    setState(() {

    });
  }

  Widget getItem(ItemData data) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(data.text),
      ),
    );
  }

  List<Widget> getItems(int mark) {
    return List<ItemData>.generate(20, (i) => ItemData('hello $mark'))
        .map((data) => getItem(data))
        .toList();
  }
}

class ItemData {
  final String text;
  String dateTime;

  ItemData(this.text) {
    dateTime = DateTime.now().toIso8601String();
  }
}
