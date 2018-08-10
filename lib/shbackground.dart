import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:core';
import 'dart:math' as math;

class SHBackground extends StatefulWidget {
  @override
  _Animbg createState() => new _Animbg();
}

class _Animbg extends State<SHBackground> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;

  @override
  initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  buildCircle(double delay) {
    return new ScaleTransition(
      scale: new DelayTween(begin: 0.85, end: 1.5, delay: delay)
          .animate(_controller),
      child: new Container(
        height: 10.0,
        width: 10.0,
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.deepPurpleAccent,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return new Center(
      child: new Container(
        width: 80.0,
        height: 80.0,
        color: Colors.lightGreen,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildCircle(.0),
            buildCircle(.2),
            buildCircle(.4),
//            buildCircle(.6),
//            buildCircle(.8),
          ],
        ),
      ),
    );
  }
}


class DelayTween extends Tween<double> {
  final double delay;
  DelayTween({
    double begin,
    double end,
    this.delay,
  }) : super(begin: begin, end: end);

  @override
  double lerp(double t) {
    double value = (math.sin((t - delay) * 2 * math.pi) + 1) / 2;
    return super.lerp(value);
  }

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}

class BgPainter extends CustomPainter {
  double value;

  BgPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    _drawCircle(canvas, size, 0.0);
    _drawCircle(canvas, size, size.width / 8 - size.width / 4);
  }

  _drawCircle(Canvas canvas, Size size, double radius) {
    radius = radius + value * size.width / 4;
    if (radius > size.width / 2) radius = 0.0;
    double opacity = (1.0 - radius / size.width / 2) < 0
        ? 0.0
        : (1.0 - radius / size.width / 2);
    opacity = opacity > 1.0 ? 1.0 : opacity;

    canvas.drawCircle(new Offset(size.width / 2, size.height / 2), (radius),
        new Paint()..color = Colors.red.withOpacity(opacity));
  }

  _drawPath(Canvas canvas, Size size) {
    Paint p = new Paint();
    p..color = Colors.red;
    p..strokeWidth = 2.0;

    var path = new Path();
    path.moveTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height - 10);
//    path.addRect(new Rect.fromPoints(Offset(0.0, size.height-1), Offset(size.width, size.height)));

    var endPoint = new Offset(size.width * value, size.height);

    var controlPoint = new Offset(size.width * value, size.height * 0);

    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    var endPoint1 = new Offset(size.width - value * size.width, size.height);

    var controlPoint1 =
        new Offset(size.width - size.width * value * 0, size.height * value);

//    path.quadraticBezierTo(controlPoint1.dx, controlPoint1.dy, endPoint1.dx, endPoint1.dy);

    path.close();
    canvas.drawPath(path, new Paint()..color = Colors.lightGreen);

    canvas.drawLine(endPoint, controlPoint, p);
    canvas.drawLine(endPoint1, controlPoint1, p);
  }

  @override
  bool shouldRepaint(BgPainter oldDelegate) => oldDelegate.value != value;
}
