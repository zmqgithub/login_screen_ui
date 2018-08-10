import 'package:flutter/material.dart';

class HexagoneLogo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return new Stack(
      alignment: Alignment.center,
      children: <Widget>[
        new CustomPaint(
          painter: new _HexagoneLogo(),
          size:  new Size(width/4, width/4),
        ),
        new CustomPaint(
          painter: new _HexagoneLogo(),
          size:  new Size(width/6, width/6),
        ),new CustomPaint(
          painter: new _HexagoneLogo(),
          size:  new Size(width/12, width/12),
        )
      ],);
  }

}

class _HexagoneLogo extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    var rect = new Offset(0.0, 0.0)&new Size(size.width, size.height);
    var paint = new Paint();
    paint..color = Colors.orange
      ..strokeWidth = 2.0
      ..shader = new LinearGradient(colors: [Colors.red, Colors.yellow],
          begin: Alignment.topRight, end: Alignment.bottomLeft, tileMode:
          TileMode.clamp).createShader(rect)
      ..style = PaintingStyle.fill;
    var path = new Path();
    path.moveTo(1*size.width/2, 0*size.height/4); //.
    path.lineTo(2*size.width/2, 1*size.height/4);// \
    path.lineTo(2*size.width/2, 3*size.height/4);// \
    path.lineTo(1*size.width/2, 4*size.height/4);// \
    path.lineTo(0*size.width/2, 3*size.height/4);// \
    path.lineTo(0*size.width/2, 1*size.height/4);// \
    path.lineTo(1*size.width/2, 0*size.height/4);// \

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

}