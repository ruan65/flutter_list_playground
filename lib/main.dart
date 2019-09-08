import 'package:flutter/material.dart';
import 'package:flutter_playground/animated_list.dart';
import 'package:flutter_playground/classical_screen.dart';
import 'package:flutter_playground/column_screen.dart';
import 'package:flutter_playground/indexed_list_screen.dart';
import 'package:flutter_playground/list_view_no_builder.dart';
import 'package:flutter_playground/list_view_with_contoller_and_listeners.dart';
import 'package:flutter_playground/transiton_from_list/list_of_cards.dart';

import 'animation_training/animation_stars.dart';
import 'animation_training/music_album_animation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: ListOfCards(),
      home: MusicAlbumAnimation(),
//      home: AnimationStarsScreen(),
//      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Animation stars'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => AnimationStarsScreen()));
              },
            ),
            RaisedButton(
              child: Text('Transition from list item'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => ListOfCards()));
              },
            ),
            RaisedButton(
              child: Text('Classical Screen'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => ClassicalScreen()));
              },
            ),
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

            RaisedButton(
              child: Text('INDEXED'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => IndexedListScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget circularProgressWithColor({Color color = Colors.black}) => Center(
  child: CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation<Color>(color),
  ),
);
