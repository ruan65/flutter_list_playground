import 'package:flutter/material.dart';

class AnimationStarsScreen extends StatefulWidget {
  @override
  _AnimationStarsScreenState createState() => _AnimationStarsScreenState();
}

class _AnimationStarsScreenState extends State<AnimationStarsScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;
  Tween _tween;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));

    _tween = Tween<double>(begin: 150.0, end: 480.0);

    _animation = _tween.animate(_controller);
    _animation.addListener(() {
      setState(() {
      });
    });
    _controller.forward();
//    _controller.repeat();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget getStar(Color color, double xPosition) => Positioned(
    top: _animation.value,
    left: xPosition,
    child: ScaleTransition(
      scale: _controller,
      child: Icon(Icons.star, color: color,),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          getStar(Colors.amber, 50),
          getStar(Colors.red, 100),
          getStar(Colors.red, 150),
          getStar(Colors.red, 200),
        ],
      ),
    );
  }
}
