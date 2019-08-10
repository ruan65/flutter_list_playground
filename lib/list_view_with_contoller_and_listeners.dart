import 'package:flutter/material.dart';
import 'dart:math' as math;

class ListScreenWithControllerAndListeners extends StatefulWidget {
  @override
  _ListScreenWithControllerAndListenersState createState() =>
      _ListScreenWithControllerAndListenersState();
}

class _ListScreenWithControllerAndListenersState
    extends State<ListScreenWithControllerAndListeners> {
  ScrollController controller;
  List<String> list = [];
  var count = 0;
  double prevListSize = 0;

  @override
  void initState() {
    controller = ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  void _addBunchToList() {
    prevListSize = controller.position.maxScrollExtent -
        controller.position.minScrollExtent;

    print(prevListSize);

    List<String> itemsToAdd = Iterable<int>.generate(5)
        .map((i) => 'items addition #$i($count)')
        .toList();
    count++;
    setState(() {
      list.addAll(itemsToAdd);
    });

//    if(prevListSize > 0) {
//      controller.jumpTo(prevListSize);
//    }
  }

  void _addOneToList() {
    setState(() {
      count++;
      list.add('count: $count');
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = list.reversed
        .map((text) => Padding(padding: EdgeInsets.all(50), child: Text(text)))
        .toList();

    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (dd) {
          print('drag details: $dd');
        },
        child: Transform.rotate(
          angle: math.pi,
          child: ListView(
            controller: controller,
            children: widgetList,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addBunchToList,
        child: Icon(Icons.add),
      ),
    );
  }

  _scrollListener() {
    var position = controller.position;
    print('position: $position');
    print(
        'max si: ${position.maxScrollExtent} min si: ${position.minScrollExtent}');
  }
}
