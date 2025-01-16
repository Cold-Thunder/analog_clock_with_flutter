import 'package:analog_clock/config/all_colors.dart';
import 'package:analog_clock/config/styles/all_text_styles.dart';
import 'package:analog_clock/ui/screens/timer_screen/widgets/time_increase_button.dart';
import 'package:analog_clock/ui/screens/timer_screen/widgets/time_setter_text.dart';
import 'package:flutter/material.dart';

class ShowDialog extends StatefulWidget {
  final bool start;
  final int seconds;
  final int minutes;
  final int hours;
  final Function(int index) timeIncrease;
  final Function(int index) timeDecrease;

  const ShowDialog({
    required this.start,
    required this.seconds,
    required this.minutes,
    required this.hours,
    required this.timeIncrease,
    required this.timeDecrease, super.key});

  @override
  State<ShowDialog> createState() => _ShowDialogState();
}

class _ShowDialogState extends State<ShowDialog> {
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
            padding: const EdgeInsets.symmetric( vertical: 10),
            height: 190,
            width: 300,
            decoration: BoxDecoration(
                color: AllColors.backGrey,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    width: 5,
                    color: AllColors.purple
                )
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimeIncreaseButton(func: widget.timeIncrease, index: 2, increase: true),
                      TimeSetterText(text: widget.hours),
                      TimeIncreaseButton(func: widget.timeDecrease, index: 2, increase: false),

                    ],
                  ),
                  Text(":",style: AllTextStyles.timerPointTextStyle),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimeIncreaseButton(func: widget.timeIncrease, index: 1, increase: true),
                      TimeSetterText(text: widget.minutes),
                      TimeIncreaseButton(func: widget.timeDecrease, index: 1, increase: false),

                    ],
                  ),
                  Text(":",style: AllTextStyles.timerPointTextStyle),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimeIncreaseButton(func: widget.timeIncrease, index: 0, increase: true),
                      TimeSetterText(text: widget.seconds),
                      TimeIncreaseButton(func: widget.timeDecrease, index: 0, increase: false),

                    ],
                  )
                ]
            )
        ),
        Visibility(
          visible: widget.start,
            child: Container(
              width: 300,
              height: 190,
              decoration: BoxDecoration(
                color: AllColors.transparentBlack,
                borderRadius: BorderRadius.circular(20)
              )
            )
        )
      ],
    );
  }
}
