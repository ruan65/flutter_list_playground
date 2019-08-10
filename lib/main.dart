import 'package:flutter/material.dart';
import 'package:flutter_playground/animated_list.dart';
import 'package:flutter_playground/column_screen.dart';
import 'package:flutter_playground/list_view_no_builder.dart';
import 'package:flutter_playground/list_view_with_contoller_and_listeners.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Animated list view'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => AnimatedListScreenDemo()));
              },
            ),
            RaisedButton(
              child: Text('Simple list view'),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => SimpleListScreen()));
              },
            ),
            RaisedButton(
              child: Text('list view with controller'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => ListScreenWithControllerAndListeners()));
              },
            ),

            RaisedButton(
              child: Text('Column'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => ColumnScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
