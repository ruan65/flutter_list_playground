import 'package:flutter/material.dart';

class ScaleRectScreen extends StatefulWidget {
  @override
  _ScaleRectScreenState createState() => _ScaleRectScreenState();
}

class _ScaleRectScreenState extends State<ScaleRectScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = Tween(begin: 1.0, end: 0.5).animate(controller);

    animation.addListener(() {
      if (animation.isCompleted) print('completed 1');
    });

    animation.addListener(() {
      if (animation.isCompleted) print('completed 2');
    });
//    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: GestureDetector(
            onTap: () {
              controller.reverse();
            },
            onLongPressStart: (_) {
              controller.forward();
            },
            child: Container(
              height: 100,
              width: 210,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
