import 'package:flutter/material.dart';

class DetailedScreen extends StatefulWidget {
  final Color color;

  const DetailedScreen(this.color);

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
          Container(
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
