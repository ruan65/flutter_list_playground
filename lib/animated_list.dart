import 'package:flutter/material.dart';

List<int> range = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

class AnimatedListScreenDemo extends StatefulWidget {
  @override
  _AnimatedListScreenDemoState createState() => _AnimatedListScreenDemoState();
}

class _AnimatedListScreenDemoState extends State<AnimatedListScreenDemo> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  List<int> data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                data.insertAll(0, [777, 778, 779]);

                _listKey.currentState.insertItem(0);
              }),
        ],
      ),
      body: AnimatedList(
        itemBuilder: (context, index, animation) {
          return Padding(
            padding: const EdgeInsets.all(80.0),
            child: Text('item ${data[index]}'),
          );
        },
        initialItemCount: data.length,
        key: _listKey,
      ),
    );
  }
}
