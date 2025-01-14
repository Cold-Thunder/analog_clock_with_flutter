import 'package:analog_clock/config/styles/all_text_styles.dart';
import 'package:flutter/material.dart';

class TimeNumber extends StatelessWidget {
  final String number;
  const TimeNumber({required this.number, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      number,
      style: AllTextStyles.clockTimeTextStyle
    );
  }
}
