
import 'package:analog_clock/config/all_colors.dart';
import 'package:analog_clock/config/styles/all_text_styles.dart';
import 'package:analog_clock/ui/screens/timer_screen/widgets/milli_seconds_viewer.dart';
import 'package:analog_clock/ui/screens/timer_screen/widgets/time_setter_text.dart';
import 'package:flutter/material.dart';

class TimerScreenFrame extends StatefulWidget {
  final int milliSeconds;
  final int hour;
  final int minutes;
  final int sec;
  final double progValue;
  const TimerScreenFrame({
    required this.progValue,
    required this.milliSeconds,required this.hour, required this.minutes, required this.sec, super.key});

  @override
  State<TimerScreenFrame> createState() => _TimerScreenFrameState();
}

class _TimerScreenFrameState extends State<TimerScreenFrame> {

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
            height: 278,
            width: 278,
            child: CircularProgressIndicator(
              value: widget.progValue,
              color: AllColors.purple,
              strokeWidth: 20,
                strokeCap: StrokeCap.round,
            ),
          ),
          Positioned(
            top: 20,
              child: MilliSecondsViewer(milliseconds: (widget.milliSeconds/10).toInt()),
          ),
          Positioned(
            bottom: 75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TimeSetterText(text: widget.hour),
                Text(":",style: AllTextStyles.digitClockTextStyle),
                TimeSetterText(text: widget.minutes),
                Text(":",style: AllTextStyles.digitClockTextStyle),
                TimeSetterText(text: widget.sec),

              ],
            ),
          )
        ],
      )
    );
  }
}
