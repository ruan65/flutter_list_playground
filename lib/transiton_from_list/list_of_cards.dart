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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) =>
                card(context, Colors.purple, this, index)));
//                card(context, getRandomColor(rnd))));
  }
}

Widget card(
    BuildContext context, Color color, TickerProviderStateMixin ticker, int index) {
  
  String heroTag = 'hero$index';
  AnimationController ctrl =
      AnimationController(vsync: ticker, duration: Duration(milliseconds: 200));

  Animation<double> anim = Tween(begin: 1.0, end: 0.98).animate(ctrl);

  navigateToDetailed(String heroTag) {
    Navigator.push(
        context,
        CustomAnimatedRouter(DetailedScreen(color, heroTag)));
  }

  anim.addListener(() {
    if(anim.isCompleted) {
      navigateToDetailed(heroTag);
      ctrl.reset();
    }
  });


  scaleAndNavigate() {
    ctrl.forward();
  }

  return GestureDetector(
    onTap: scaleAndNavigate,
    onLongPressStart: (_) => scaleAndNavigate(),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ScaleTransition(
        scale: anim,
        child: Hero(
          tag: heroTag,
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
    ),
  );
}

Color getRandomColor(math.Random rnd) => Color(rnd.nextInt(0xffffffff));
