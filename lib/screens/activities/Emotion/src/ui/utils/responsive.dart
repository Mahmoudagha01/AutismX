import 'package:flutter/material.dart';
import 'dart:math' as math;

class Responsive {
  final Size size;
  double get width => size.width;
  double get height => size.height;
  final double diagonal;

  factory Responsive.of(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final diagonal = math.sqrt(
      math.pow(size.width, 2) + math.pow(size.height, 2),
    );
    return Responsive(
      size: size,
      diagonal: diagonal,
    );
  }

  double wp(double percent) {
    return percent * width / 100;
  }

  double hp(double percent) {
    return percent * height / 100;
  }

  double dp(double percent) {
    return percent * diagonal / 100;
  }

  Responsive({
    @required this.size,
    @required this.diagonal,
  });
}
