import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  
  const Indicator({required this.height, required this.width, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10)
      ),
    );
  }
}
