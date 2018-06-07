//画笔
import 'package:flutter/material.dart';

class SignaturePainter extends CustomPainter {
  final List<Offset> points;
  SignaturePainter(this.points);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = new Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (var i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(SignaturePainter old) {
    //
    return old.points != points;
  }
}

class Signature extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //
    return _SignatureState();
  }
}

class _SignatureState extends State<Signature> {
  List<Offset> _points = <Offset>[];
  @override
  Widget build(BuildContext context) {
    //
    return new GestureDetector(
        onPanUpdate: (DragUpdateDetails detail) {
          setState(() {
            RenderBox renderBox = context.findRenderObject();
            Offset locationOffset =
                renderBox.globalToLocal(detail.globalPosition);
            _points = new List.from(_points)..add(locationOffset);
          });
        },
        onPanEnd: (DragEndDetails detail) => _points..add(null),
        child: new CustomPaint(
          painter: new SignaturePainter(_points),
        ));
  }
}

class PaintDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    return new Scaffold(
        appBar: AppBar(
          title: Text('画板'),
        ),
        body: new Signature());
  }
}
