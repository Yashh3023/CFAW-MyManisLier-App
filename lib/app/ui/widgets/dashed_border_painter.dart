import 'dart:ui';
import 'package:mymanislier/app/utils/helpers/exporter.dart';

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color(0XFF494949)
      ..strokeWidth = 1.w
      ..style = PaintingStyle.stroke;

    final Path path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Radius.circular(16.r),
      ));

    double dashWidth = 5.w;
    double dashSpace = 1.w;
    final PathMetrics pathMetrics = path.computeMetrics();

    for (PathMetric pathMetric in pathMetrics) {
      double distance = 0.0;
      bool draw = true;
      while (distance < pathMetric.length) {
        if (draw) {
          canvas.drawPath(
            Path()
              ..addPath(
                pathMetric.extractPath(distance, distance + dashWidth),
                Offset.zero,
              ),
            paint,
          );
        }
        distance += dashWidth;
        draw = !draw;
        if (distance + dashSpace < pathMetric.length) {
          distance += dashSpace;
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
