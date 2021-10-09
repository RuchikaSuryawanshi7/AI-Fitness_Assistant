import 'package:flutter/material.dart';

class FreakyTipsCard extends StatelessWidget {
  final freakyTipsImage;
  final freakyTipsName;
  const FreakyTipsCard({
    required this.freakyTipsImage,
    required this.freakyTipsName,
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
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/cardImage.png',
                ),
                fit: BoxFit.fill),
            boxShadow: [BoxShadow(color: Colors.black)],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 32),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset('$freakyTipsImage'),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '$freakyTipsName',
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// class EllipsePainter extends CustomPainter {
//   final double radius;
//   final Color startColor;
//   final Color endColor;
//   EllipsePainter(this.radius, this.startColor, this.endColor);
//   @override
//   void paint(Canvas canvas, Size size) {
//     var radius = 24.0;
//     var paint = Paint();

//     paint.shader = ui.Gradient.linear(
//         Offset(0, 0), Offset(size.width, size.height), [
//       HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
//       endColor
//     ]);

//     var path = Path()
//       ..moveTo(0, size.height)
//       ..lineTo(size.width - radius, size.height)
//       ..quadraticBezierTo(
//           size.width, size.height, size.width, size.height - radius)
//       ..lineTo(size.width, radius)
//       ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
//       ..lineTo(size.width - 1.5 * radius, 0)
//       ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
//       ..close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
