import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_playground/transiton_from_list/detailed_screen.dart';
import 'package:flutter_playground/transiton_from_list/router_custom_animated.dart';

class ListOfCards extends StatefulWidget {
  @override
  _ListOfCardsState createState() => _ListOfCardsState();

  ListOfCards();
}

class _ListOfCardsState extends State<ListOfCards>
    with TickerProviderStateMixin {
  final rnd = math.Random();
  AnimationController animController;
  Animation<double> anim;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    anim = Tween(begin: 150.0, end: 90.0).animate(animController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) =>
                card(context, Colors.purple, anim)));
//                card(context, getRandomColor(rnd))));
  }
}

Widget card(BuildContext context, Color color, Animation<double> anim) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
//        MaterialPageRoute(builder: (context) => DetailedScreen(color)),
          CustomAnimatedRouter(DetailedScreen(color)));
    },
    onLongPressStart: (details) {
      print('logn press ${details.globalPosition}');

    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ScaleTransition(
        scale: anim,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5,
          color: Colors.purple,
          child: Container(
            height: 150,
          ),
        ),
      ),
    ),
  );
}

Color getRandomColor(math.Random rnd) => Color(rnd.nextInt(0xffffffff));
