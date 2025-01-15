import 'package:analog_clock/config/all_colors.dart';
import 'package:analog_clock/config/styles/all_text_styles.dart';
import 'package:flutter/material.dart';

class TimeSetterText extends StatelessWidget {
  final int text;

  const TimeSetterText({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: AllColors.backGrey,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: AllColors.white
        ),
        boxShadow:[
          BoxShadow(
            offset: Offset(1,1),
            color: AllColors.purple,
            blurRadius: 13
          )
        ]
      ),
      child: Text(
        text.toString().padLeft(1, '0'),
        style: AllTextStyles.digitClockTextStyle.copyWith(
          fontSize: 40
        ),
      )
    );
  }
}
