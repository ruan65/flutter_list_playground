import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_playground/main.dart';
import 'package:indexed_list_view/indexed_list_view.dart';

const origin = 5000;
const limit = 20;
const newMsgInitial = 3;
const triggerLoadNewPortionOfHistoryThreshold = 10;

class IndexedListScreen extends StatefulWidget {
  @override
  _IndexedListScreenState createState() => _IndexedListScreenState();
}

class _IndexedListScreenState extends State<IndexedListScreen> {
//
  final IndexedScrollController controller =
      IndexedScrollController(initialIndex: -1);

  final rnd = Random();
  int historyMark, newMark = origin;

  @override
  void initState() {
    super.initState();
    jumpToOrigin();
    historyMark = origin - limit;
//    controller.addListener(() {
//      print('orig index: ${controller.index}');
//    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future jumpToOrigin() async {
    await Future.delayed(Duration(milliseconds: 10));
    controller.jumpToIndexAndOffset(index: origin - 1, offset: 30);
  }

  Future jumpToLatestNewMessage() async {
    await Future.delayed(Duration(milliseconds: 10));
    controller.jumpToIndexAndOffset(index: newMark - 1, offset: -200);
  }

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNewMessage();
        },
        child: Icon(Icons.message),
      ),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.exposure_zero),
            ),
            onPressed: () {
              print('jumping to origin');
              jumpToOrigin();
            },
          ),
          IconButton(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.add),
            ),
            onPressed: () {
              addHistoryMessages();
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

  List<double> heights = List<double>.generate(
      origin * 2, (i) => Random().nextInt(200).toDouble() + 60.0);

  List<ChatMessage> messages = List<ChatMessage>.generate(origin * 2, (pos) {
    if (pos < origin && pos >= origin - limit) {
      return ChatMessage()
        ..colorInt = 0xFFFF9999
        ..text = 'History Message at index: $pos'
        ..empty = false
        ..history = true
        ..createdAt = DateTime.now().toIso8601String();
    } else {
      return ChatMessage();
    }
  });

  Function itemBuilder() {
    //
    return (BuildContext context, int index) {
      final msg = messages[index];
      print(
          'in the item builder \nnewMark: $newMark \nindex = $index \nhistoryMark = $historyMark');
      if (index - historyMark < triggerLoadNewPortionOfHistoryThreshold) {
        addHistoryMessages();
      }

//      if (index - newMark > 2) {
//        jumpToLatestNewMessage();
//      }
      //
      return msg.empty
          ? SizedBox(
              height: 300,
              child: Container(
                height: 10,
                width: 10,
                child: index > origin - 1 ? SizedBox.shrink() : circularProgressWithColor(color: Colors.grey[300]),
              ),
            )
          : Card(
              child: Container(
                height: heights[index % origin],
                color: msg.empty ? Colors.white : Color(msg.colorInt),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(msg.text),
                      Text(msg.createdAt),
                    ],
                  ),
                ),
              ),
            );
    };
  }

  Future addHistoryMessages() async {
    await Future.delayed(Duration(milliseconds: 2000), () {
      int color = rnd.nextInt(0xFFFFFFFF);
      setState(() {
        print('adding');
        int i = historyMark - limit;
        for (; i < historyMark; i++) {
          print('adding message... i = $i');
          messages[i] = ChatMessage()
            ..colorInt = color
            ..text = 'DownLoaded History Message from mark: $historyMark #: $i'
            ..empty = false
            ..history = true
            ..createdAt = DateTime.now().toIso8601String();
        }
        historyMark -= limit;
      });
      print('hm $historyMark');
      print(messages.length);
    });
  }

  void addNewMessage() {
    var chatMessage = ChatMessage()
      ..colorInt = 0xFF99FF99
      ..text = 'New Message at index: $newMark'
      ..empty = false
      ..history = false
      ..createdAt = DateTime.now().toIso8601String();
    setState(() {
      messages[newMark] = chatMessage;
      newMark++;
    });
    jumpToLatestNewMessage();
  }
}

class ChatMessage {
  int colorInt = 0xFFFFFFFF;
  bool history = true;
  bool empty = true;
  String text = '';
  String createdAt = '';
  @override
  String toString() {
    return 'ChatMessage{history: $history, empty: $empty, text: $text, createdAt: $createdAt}';
  }
}
