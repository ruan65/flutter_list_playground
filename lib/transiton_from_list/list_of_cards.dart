import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_playground/transiton_from_list/detailed_screen.dart';

class ListOfCards extends StatefulWidget {
  @override
  _ListOfCardsState createState() => _ListOfCardsState();
}

class _ListOfCardsState extends State<ListOfCards> {
  final rnd = math.Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) =>
                card(context, getRandomColor(rnd))));
  }
}

Widget card(BuildContext context, Color color) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailedScreen(color)),
      );
    },
    child: Card(
      color: color,
      child: Container(
        height: 200,
      ),
    ),
  );
}

Color getRandomColor(math.Random rnd) => Color(rnd.nextInt(0xffffffff));
