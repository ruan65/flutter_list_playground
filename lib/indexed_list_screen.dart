import 'dart:math';

import 'package:flutter/material.dart';
import 'package:indexed_list_view/indexed_list_view.dart';

const origin = 100;
const limit = 10;
const newMsgInitial = 3;

class IndexedListScreen extends StatefulWidget {
  @override
  _IndexedListScreenState createState() => _IndexedListScreenState();
}

class _IndexedListScreenState extends State<IndexedListScreen> {
//
  final IndexedScrollController controller =
      IndexedScrollController(initialIndex: -1)
        ..addListener(() {
//      print(controller.position);
        });

  int historyMark, newMark;

  @override
  void initState() {
    super.initState();
    controller.jumpToIndex(origin);
    historyMark = origin - limit;
  }

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.exposure_zero),
            ),
            onPressed: () {
              print('jumping to origin');
              controller.jumpToIndex(origin);
            },
          ),
          IconButton(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.add),
            ),
            onPressed: () {
              print('adding');
              addMessages();
            },
          ),
        ],
      ),
      body: IndexedListView.builder(
        controller: controller,
        itemBuilder: itemBuilder(),
      ),
    );
  }

  final List<double> heights = new List<double>.generate(
      527, (i) => Random().nextInt(200).toDouble() + 30.0);

  final List<String> texts = new List<String>.generate(1000, (index) {
    if (index >= origin && index < origin + 3) {
      return 'New message #$index';
    } else if (index < origin && index > origin - limit) {
      return 'History message #$index';
    } else {
      return 'no messages here on $index';
    }
  });

  Function itemBuilder() {
    //
    return (BuildContext context, int index) {
      print(index);
      //
      return Card(
        child: Container(
          height: heights[index % 527],
          color: index >= origin ? Colors.green : Colors.blue,
          child: Center(child: Text(texts[index.abs()])),
        ),
      );
    };
  }

  void addMessages() {}
}
