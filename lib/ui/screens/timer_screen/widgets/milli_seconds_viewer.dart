import 'package:analog_clock/config/styles/all_text_styles.dart';
import 'package:flutter/material.dart';

class MilliSecondsViewer extends StatelessWidget {
  final int milliseconds;

  const MilliSecondsViewer({required this.milliseconds, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      milliseconds.toString(),
      style: AllTextStyles.digitClockTextStyle.copyWith(
        fontSize: 90,
      )
    );
  }
}
