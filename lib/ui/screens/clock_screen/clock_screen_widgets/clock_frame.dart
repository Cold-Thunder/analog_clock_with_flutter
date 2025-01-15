import 'package:analog_clock/config/all_colors.dart';
import 'package:flutter/material.dart';

class ClockFrame extends StatelessWidget {
  final double height;
  final double width;
  const ClockFrame({required this.height, required this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration:BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 10,
          color: AllColors.purple,
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(1,1),
            color: AllColors.purple,
            blurRadius: 20,
          )
        ]
      ),
    );
  }
}
