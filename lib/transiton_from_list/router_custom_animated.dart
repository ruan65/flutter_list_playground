import 'package:flutter/widgets.dart';

class CustomAnimatedRouter extends PageRouteBuilder {
  final Widget widget;

  CustomAnimatedRouter(this.widget)
      : super(
            transitionDuration: Duration(milliseconds: 1500),
            pageBuilder: (BuildContext context, Animation<double> anim,
                Animation<double> secondaryAnim) {
              return widget;
            },
            transitionsBuilder: (BuildContext context, Animation<double> anim,
                Animation<double> secondaryAnim, Widget child) {

              CurvedAnimation curvedAnimation = CurvedAnimation(
                parent: anim,
                curve: Curves.fastLinearToSlowEaseIn,
              );

              Tween<double> tween = Tween(begin: 0.3, end: 1.0);


              Animation<double> tweenAnimation = tween.animate(curvedAnimation);

//              return FadeTransition(
//                opacity: tweenAnimation,
//                child: child,
//              );
              return ScaleTransition(
                scale: tweenAnimation,
                child: child,
              );
            });
}
