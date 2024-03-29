import 'package:flutter/material.dart';
import 'package:flutter_playground/animated_list.dart';
import 'package:flutter_playground/classical_screen.dart';
import 'package:flutter_playground/column_screen.dart';
import 'package:flutter_playground/cook_book_list_android_physics.dart';
import 'package:flutter_playground/cook_book_list_asp_physics.dart';
import 'package:flutter_playground/cook_book_list_ios_physics.dart';
import 'package:flutter_playground/indexed_list_screen.dart';
import 'package:flutter_playground/list_view_no_builder.dart';
import 'package:flutter_playground/transiton_from_list/list_of_cards.dart';

import 'cook_book_list.dart';

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
//      home: ScaleRectScreen(),
//      home: MusicAlbumAnimation(),
//      home: AnimationStarsScreen(),
      home: MyHomePage(),
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Cards'),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) => ListOfCards()));
                },
              ),
              RaisedButton(
                child: Text('Cook book'),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => CookbookList()));
                },
              ),
              RaisedButton(
                child: Text('Cook book ios BouncingScrollPhysics'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => CookbookListIOsPhysics()));
                },
              ),

              RaisedButton(
                child: Text('Cook book CookbookListPageScrollPhysics'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => CookbookListPageScrollPhysics()));
                },
              ),

              RaisedButton(
                child: Text('Cook book AlwaysScrollableScrollPhysics'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => CookbookListASPhysics()));
                },
              ),
//              RaisedButton(
//                child: Text('Animation stars'),
//                onPressed: () {
//                  Navigator.of(context).push(MaterialPageRoute(
//                      builder: (ctx) => AnimationStarsScreen()));
//                },
//              ),
              RaisedButton(
                child: Text('Transition from list item'),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) => ListOfCards()));
                },
              ),
              RaisedButton(
                child: Text('Classical Screen'),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => ClassicalScreen()));
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
//              RaisedButton(
//                child: Text('list view with controller'),
//                onPressed: () {
//                  Navigator.of(context).push(MaterialPageRoute(
//                      builder: (ctx) =>
//                          ListScreenWithControllerAndListeners()));
//                },
//              ),
              RaisedButton(
                child: Text('Column'),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => ColumnScreen()));
                },
              ),
              RaisedButton(
                child: Text('INDEXED'),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => IndexedListScreen()));
                },
              ),
            ],
          ),
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
