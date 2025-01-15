import 'package:analog_clock/config/all_colors.dart';
import 'package:analog_clock/config/styles/all_text_styles.dart';
import 'package:flutter/material.dart';

class DigitalClockFrame extends StatelessWidget {
  final TimeOfDay time;
  final DateTime dateTime;
  const DigitalClockFrame({required this.time, required this.dateTime, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(bottom: 10),
      height: 80,
      width: 163,
      decoration: BoxDecoration(
        color: AllColors.deepPurple,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Text(
            "${dateTime.day}/${dateTime.month}/${dateTime.year}",
            style: AllTextStyles.digitClockTextStyle.copyWith(
                fontSize: 20
            )
          ),
          RichText(
            text: TextSpan(
              text: "${time.hourOfPeriod.toString().padLeft(1, '0')}:${time.minute.toString().padLeft(1, '0')}:${dateTime.second.toString().padLeft(1, '0')} ",
                style: AllTextStyles.digitClockTextStyle,
              children: [
                TextSpan(
                  text: time.period.name,
                  style: AllTextStyles.digitClockTextStyle.copyWith(
                    fontSize: 18
                  )
                )
              ]
            )
          ),

        ],
      )
    );
  }
}
