import 'package:flutter/material.dart';

class MusicAlbumAnimation extends StatefulWidget {
  @override
  _MusicAlbumAnimationState createState() => _MusicAlbumAnimationState();
}

int ms = 2200;
int ms2 = 2000;

class _MusicAlbumAnimationState extends State<MusicAlbumAnimation>
    with TickerProviderStateMixin {
  Animation<double> _animation1;
  AnimationController _controller1;
  AnimationController _controller2;

  @override
  void initState() {
    super.initState();
//    _controller1 =
//        AnimationController(vsync: this, duration: Duration(milliseconds: ms));
//    _controller2 =
//        AnimationController(vsync: this, duration: Duration(milliseconds: ms2));
//
//    _animation1 = Tween(begin: 0.5, end: 1).animate(CurvedAnimation(
//        parent: CurvedAnimation(parent: _controller2, curve: Curves.easeInOut),
//        curve: null));
//
//    _controller2.forward();
//    _controller1.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: Container(child: _getContent()),
    );
  }

  Widget _getContent() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Opacity(
          opacity: 0.5,
          child: Image.asset('assets/mic.jpeg', fit: BoxFit.cover,),
        )
      ],
    );
  }
}
