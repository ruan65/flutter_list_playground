import 'package:flutter/material.dart';

class MusicAlbumAnimation extends StatefulWidget {
  @override
  _MusicAlbumAnimationState createState() => _MusicAlbumAnimationState();
}

int ms = 2200;
int ms2 = 2000;

class _MusicAlbumAnimationState extends State<MusicAlbumAnimation>
    with TickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller1;
  AnimationController _controller2;

  @override
  void initState() {
    super.initState();
    _controller1 =
        AnimationController(vsync: this, duration: Duration(milliseconds: ms));
    _controller2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: ms2));

    _animation = Tween(begin: 0.2, end: 0.7).animate(
        CurvedAnimation(parent: _controller2, curve: Curves.easeInOut));

//    _animation = Tween(begin: 0.2, end: 0.7).animate(
//        CurvedAnimation(parent: _controller2, curve: Curves.easeInOut));

//    _animation = CurvedAnimation(parent: _controller2, curve: Curves.easeInOut);

    _animation.addListener(() {
      setState(() {});
    });

    _controller2.forward();
    _controller1.repeat();
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
          opacity: _animation.value,
          child: Image.asset(
            'assets/mic.jpeg',
            fit: BoxFit.cover,
          ),
        ),
        _centralButton(),
        Positioned(
          top: 10,
          left: 10,
          child: RotationTransition(
            turns: _controller1,
            child: Icon(Icons.play_arrow),
          ),
        ),
      ],
    );
  }

  Widget _centralButton() {
    return Center(
      child: ScaleTransition(
        scale: _controller2,
        child: CircleAvatar(
          radius: 35,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/adel.png'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }
}
