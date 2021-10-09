import 'dart:ui' as ui;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FreakyTipsCard extends StatelessWidget {
  final freakyTipsImage;
  final freakyTipsName;
  const FreakyTipsCard({
    @required this.freakyTipsImage,
    @required this.freakyTipsName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 5, right: 16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Container(
          width: double.infinity,
          height: 170,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xffad51a5), Color(0xff5c54e2)],
            ),
            boxShadow: [BoxShadow(color: Colors.black)],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 32),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        '$freakyTipsName',
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      ),
                    ),
                    CachedNetworkImage(imageUrl: freakyTipsImage,width: 100,height: 80,),
                    SizedBox(width: 10,),
                  ],
                ),
                Positioned(
                  right: 1,
                  top: 1,
                  bottom:1,
                  child: CustomPaint(
                    size: Size(200, 80),
                    painter: EllipsePainter(16.0,Colors.white.withOpacity(0.1), Colors.white.withOpacity(0.1)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class EllipsePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;
  EllipsePainter(this.radius, this.startColor, this.endColor);
  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;
    var paint = Paint();

    paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}