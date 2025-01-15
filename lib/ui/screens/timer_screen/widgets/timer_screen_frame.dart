import 'package:analog_clock/config/all_colors.dart';
import 'package:flutter/material.dart';

class TimerScreenFrame extends StatelessWidget {
  const TimerScreenFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
        height: 300,
        width: 300,
        decoration: BoxDecoration(
            color: AllColors.black,
            shape: BoxShape.circle,
            border: Border.all(
                color: AllColors.transparent,
            ),
          boxShadow: [
            BoxShadow(
              offset: Offset(1,1),
              color: AllColors.purple,
              blurRadius: 30
            )
          ]
        ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 400,
            width: 400,
            child: CircularProgressIndicator(
              value: 0.5,
              color: AllColors.purple,
              strokeWidth: 20,
                strokeCap: StrokeCap.round,
            ),
          )
        ],
      )
    );
  }
}
