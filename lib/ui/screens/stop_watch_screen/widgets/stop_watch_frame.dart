import 'package:analog_clock/config/all_colors.dart';
import 'package:analog_clock/config/styles/all_text_styles.dart';
import 'package:flutter/material.dart';

class StopWatchFrame extends StatelessWidget {
  final int milliSec;
  final int second;
  final int minutes;
  final int hours;
  const StopWatchFrame({required this.milliSec, required this.second, required this.minutes, required this.hours, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
       height: 300,
      width: 300,
      decoration: BoxDecoration(
        color: AllColors.deepPurple,
        shape: BoxShape.circle,
        border: Border.all(
          width: 12,
          color: AllColors.purple
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              (milliSec/10).toInt().toString(),
              style: AllTextStyles.digitClockTextStyle.copyWith(
                fontSize: 80
              )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${hours.toString()}:",
                style: AllTextStyles.digitClockTextStyle.copyWith(
                  fontSize: 50
                )
              ),
              Text(
                  "${minutes.toString()}:",
                  style: AllTextStyles.digitClockTextStyle.copyWith(
                      fontSize: 50
                  )
              ),
              Text(
                  second.toString(),
                  style: AllTextStyles.digitClockTextStyle.copyWith(
                      fontSize: 50
                  )
              ),
            ]
          )
        ]
      )
    );
  }
}
