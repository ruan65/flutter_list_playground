import 'package:flutter/material.dart';

class DetailedScreen extends StatefulWidget {
  final Color color;
  final String heroTag;

  const DetailedScreen(this.color, this.heroTag);

  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Hero(
            tag: widget.heroTag,
            child: Material(
              child: Container(
                height: 300,
                color: widget.color,
                child: Row(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 1000,
            color: Colors.amber,
          ),
          Text('The End'),
        ],
      ),
    ));
  }
}
