import 'package:flutter/material.dart';

class ColumnScreen extends StatefulWidget {
  @override
  _ColumnScreenState createState() => _ColumnScreenState();
}

class _ColumnScreenState extends State<ColumnScreen> {

  List<Widget> items = List<Widget>.filled(100, Text('hello'), growable: true);

  final _scrollController = ScrollController(initialScrollOffset: 100);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    items[0] = Text('hi');
    items[2] = Text('hi');
    items[3] = Text('hi');
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
    items.addAll(getItems());
  }

  List<Widget> getItems() {
    return List<Widget>.generate(100, (i) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('hi $i'),
      );
    });
  }
}
