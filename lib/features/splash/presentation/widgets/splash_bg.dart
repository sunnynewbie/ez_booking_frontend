import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class SplashBg extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2465964, size.height * 0.4845071);
    path_0.cubicTo(
        size.width * -0.01446903,
        size.height * 0.4327405,
        size.width * -0.1974359,
        size.height * 0.3124336,
        size.width * -0.1974359,
        size.height * 0.1722820);
    path_0.cubicTo(
        size.width * -0.1974359,
        size.height * -0.01513223,
        size.width * 0.1297408,
        size.height * -0.1670616,
        size.width * 0.5333333,
        size.height * -0.1670616);
    path_0.cubicTo(
        size.width * 0.9369256,
        size.height * -0.1670616,
        size.width * 1.264103,
        size.height * -0.01513223,
        size.width * 1.264103,
        size.height * 0.1722820);
    path_0.cubicTo(
        size.width * 1.264103,
        size.height * 0.2954277,
        size.width * 1.122844,
        size.height * 0.4032536,
        size.width * 0.9114641,
        size.height * 0.4627227);
    path_0.lineTo(size.width * 0.5885667, size.height * 0.3758791);
    path_0.cubicTo(
        size.width * 0.8065308,
        size.height * 0.3632583,
        size.width * 0.9751949,
        size.height * 0.2769159,
        size.width * 0.9751949,
        size.height * 0.1722820);
    path_0.cubicTo(
        size.width * 0.9751949,
        size.height * 0.05896173,
        size.width * 0.7773667,
        size.height * -0.03290249,
        size.width * 0.5333333,
        size.height * -0.03290249);
    path_0.cubicTo(
        size.width * 0.2893000,
        size.height * -0.03290249,
        size.width * 0.09147282,
        size.height * 0.05896173,
        size.width * 0.09147282,
        size.height * 0.1722820);
    path_0.cubicTo(
        size.width * 0.09147282,
        size.height * 0.2467251,
        size.width * 0.1768462,
        size.height * 0.3119088,
        size.width * 0.3046077,
        size.height * 0.3478720);
    path_0.lineTo(size.width * 0.8200692, size.height * 0.4835024);
    path_0.cubicTo(
        size.width * 1.081136,
        size.height * 0.5352678,
        size.width * 1.264103,
        size.height * 0.6555758,
        size.width * 1.264103,
        size.height * 0.7957275);
    path_0.cubicTo(
        size.width * 1.264103,
        size.height * 0.9831422,
        size.width * 0.9369256,
        size.height * 1.135071,
        size.width * 0.5333333,
        size.height * 1.135071);
    path_0.cubicTo(
        size.width * 0.1297408,
        size.height * 1.135071,
        size.width * -0.1974359,
        size.height * 0.9831422,
        size.width * -0.1974359,
        size.height * 0.7957275);
    path_0.cubicTo(
        size.width * -0.1974359,
        size.height * 0.6725818,
        size.width * -0.05617641,
        size.height * 0.5647559,
        size.width * 0.1552028,
        size.height * 0.5052867);
    path_0.lineTo(size.width * 0.4781000, size.height * 0.5921303);
    path_0.cubicTo(
        size.width * 0.2601359,
        size.height * 0.6047512,
        size.width * 0.09147282,
        size.height * 0.6910936,
        size.width * 0.09147282,
        size.height * 0.7957275);
    path_0.cubicTo(
        size.width * 0.09147282,
        size.height * 0.9090474,
        size.width * 0.2893000,
        size.height * 1.000912,
        size.width * 0.5333333,
        size.height * 1.000912);
    path_0.cubicTo(
        size.width * 0.7773667,
        size.height * 1.000912,
        size.width * 0.9751949,
        size.height * 0.9090474,
        size.width * 0.9751949,
        size.height * 0.7957275);
    path_0.cubicTo(
        size.width * 0.9751949,
        size.height * 0.7212844,
        size.width * 0.8898205,
        size.height * 0.6561007,
        size.width * 0.7620590,
        size.height * 0.6201363);
    path_0.lineTo(size.width * 0.2465964, size.height * 0.4845071);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0x1a316ff6);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
