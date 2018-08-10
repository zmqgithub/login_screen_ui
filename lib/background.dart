import 'package:flutter/material.dart';

class Background extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var rect = new Offset(0.0, 0.0)&new Size(size.width, size.height);
    var paint = new Paint();
    paint..color = Colors.orange
      ..strokeWidth = 2.0
      ..shader = new LinearGradient(colors: [Colors.red.withOpacity(0.5), Colors.yellow[800].withOpacity(0.5)],
          begin: Alignment.topRight, end: Alignment.bottomLeft, tileMode:
          TileMode.clamp).createShader(rect)
      ..style = PaintingStyle.fill;

    var path = new Path();
    path.moveTo(size.width*0, size.height);
    path.lineTo(size.width, size.height);
    var endPoint = new Offset(0*size.width/4, 4*size.height/4);
    var ctlPoint = new Offset(0.2*size.width/4, 3*size.height/4);
    path.quadraticBezierTo(ctlPoint.dx, ctlPoint.dy, endPoint.dx, endPoint.dy);


    paint..shader = new LinearGradient(colors: [Colors.yellow.withOpacity(1.0), Colors.red.withOpacity(1.0)],
    begin: Alignment.topRight, end: Alignment.bottomLeft, tileMode:
    TileMode.clamp).createShader(rect);
    var path1 = new Path();
    path1.moveTo(size.width*1, size.height);
    path1.lineTo(size.width*0, size.height);

    var endPoint1 = new Offset(5*size.width/4, 4*size.height/4);
    var ctlPoint1 = new Offset(4.5*size.width/4, 2.5*size.height/4);
    path1.quadraticBezierTo(ctlPoint1.dx, ctlPoint1.dy, endPoint1.dx, endPoint1.dy);

    canvas.drawPath(path1, paint);
    paint..shader = new LinearGradient(colors: [Colors.red.withOpacity(0.2), Colors.yellow[800].withOpacity(0.3)],
        begin: Alignment.topRight, end: Alignment.bottomLeft, tileMode:
        TileMode.clamp).createShader(rect);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

}