import 'package:flutter/material.dart';

class ClassicalScreen extends StatefulWidget {
  @override
  _ClassicalScreenState createState() => _ClassicalScreenState();
}

class _ClassicalScreenState extends State<ClassicalScreen> {
  // say you have total of 100 messages, and you want to keep loading 20 more messages on scrolling up till 100th message is seen
  int _totalMessages = 100, _loadInterval = 20;
  List<String> _messages;
  double _loadingOffset = 20;
  ScrollController _scrollController = ScrollController();
  bool _loading = false;

  @override
  void initState() {
    super.initState();

    // initially we load only 20 messages
    _messages = List.generate(20, (i) => "Message   #${_totalMessages - i}");

    // setting Scroll listener
    _setListener();
  }

  void _setListener() {
    _scrollController.addListener(() async {
      var max = _scrollController.position.maxScrollExtent;
      var offset = _scrollController.offset;

      // we have reached at the top of the list, we should make _loading = true
      if (max - offset < _loadingOffset && !_loading) {
        _loading = true;

        // load 20 more items (_loadInterval = 20) after a delay of 2 seconds
        await Future.delayed(Duration(seconds: 2));
        int lastItem = _totalMessages - _messages.length;
        for (int i = 1; i <= _loadInterval; i++) {
          int itemToAdd = lastItem - i;
          if (itemToAdd >= 0) _messages.add("Message   #${itemToAdd}");
        }

        // items are loaded successfully, make _loading = false
        _loading = false;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
      ),
      body: ListView.builder(
        controller: _scrollController,
        reverse: true,
        // reverses the list, to give messaging UI
        itemCount: _messages.length + 1,
        // +1 so that we can also show progress indicator
        itemBuilder: (context, index) {
          // fetched all the messages, no more is left
          if (index == _totalMessages) return Container();

          // reached at the top of the list, show progress indicator
          if (index == _messages.length)
            return Align(child: CircularProgressIndicator());

          // showing messages here
          return ListTile(title: Text("${_messages[index]}"));
        },
      ),
    );
  }
}
