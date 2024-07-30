import 'package:flutter/cupertino.dart';
import 'package:pico_user/presentation/configs/configs.dart';

class RightCurveContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = kPrimary
      ..strokeWidth = 3.0
    ..style = PaintingStyle.fill;
    Path path = Path()
      ..moveTo(20, 0.0)
      ..quadraticBezierTo(-10, size.height / 2, 20, size.height)
      ..lineTo(size.width * 0.8, size.height)
      ..lineTo(size.width * 0.8, 0.0)
    ..close();
    canvas.drawPath(path, paint);
    final BorderRadius borderRadius = BorderRadius.circular(20);
    final Rect rect = Rect.fromLTRB(50, 0, size.width, size.height);
    final RRect outer = borderRadius.toRRect(rect);
    canvas.drawRRect(outer, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class LeftCurveContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = kGrey300
      ..strokeWidth = 3.0
      ..style = PaintingStyle.fill;
    Path path = Path()
      ..moveTo(20, 0.0)
      ..lineTo(20, size.height)
      ..lineTo(size.width + 30, size.height)
      ..lineTo(size.width + 30, 0.0)
      ..close();
    canvas.drawPath(path, paint);
    final BorderRadius borderRadius = BorderRadius.circular(20);
    final Rect rect = Rect.fromLTRB(0, 0, size.width, size.height);
    final RRect outer = borderRadius.toRRect(rect);
    canvas.drawRRect(outer, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class BottomCurveContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = kGrey300
      ..strokeWidth = 3.0
      ..style = PaintingStyle.fill;
    Path path = Path()
      ..moveTo(0.0, 0.0)
      ..lineTo(0.0, size.height)
      ..quadraticBezierTo(size.width/2, size.height + 60, size.width , size.height)
      ..lineTo(size.width, 0.0)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}