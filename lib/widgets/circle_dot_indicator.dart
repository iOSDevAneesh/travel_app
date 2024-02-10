import 'package:flutter/material.dart';

class CircleDotIndicator extends Decoration {
  final Color color;
  double radius;

  CircleDotIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }


}

class _CirclePainter extends BoxPainter {

  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset _circleOffset = Offset(configuration.size!.width/2 -radius/2, configuration.size!.height);

    canvas.drawCircle(offset+_circleOffset, radius, _paint);
  }


}