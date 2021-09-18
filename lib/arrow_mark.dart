import 'package:flutter/material.dart';
import 'dart:math';

class ArrowMark extends StatelessWidget {
  static double totalWidth = 25.0;
  static double totalHeight = 25.0;
  final double boxSize = 25.0;

  final Color color;
  final bool flippedX;
  final bool flippedY;

  const ArrowMark(this.color, this.flippedX, this.flippedY);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..rotateY((flippedX ? 180 : 0) / 180 * pi)
        ..rotateX((flippedX ? 180 : 0) / 180 * pi),
      child: Transform.translate(
        offset: Offset(-12.0, 15.0),
        child: Container(
          width: totalWidth,
          height: totalHeight,
          child: Image.asset(
            'asset.wa_full.png',
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
