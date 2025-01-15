import 'package:analog_clock/config/all_colors.dart';
import 'package:analog_clock/config/all_texts.dart';
import 'package:analog_clock/config/styles/all_text_styles.dart';
import 'package:analog_clock/ui/screens/timer_screen/widgets/time_increase_button.dart';
import 'package:analog_clock/ui/screens/timer_screen/widgets/time_setter_text.dart';
import 'package:analog_clock/ui/widgets/elevated_button.dart';
import 'package:flutter/material.dart';

class ShowDialog extends StatefulWidget {
  final int seconds;
  final int minutes;
  final int hours;
  final Function(int index) timeIncrease;
  final Function(int index) timeDecrease;

  const ShowDialog({
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

    return Center(
      child: StatefulBuilder(
        builder: (context, setState){
          return  Material(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      color: AllColors.backGrey,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          width: 5,
                          color: AllColors.purple
                      )
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 10,
                            children: [
                              TimeIncreaseButton(func: widget.timeIncrease, index: 2, increase: true),
                              TimeIncreaseButton(func: widget.timeIncrease, index: 1, increase: true),
                              TimeIncreaseButton(func: widget.timeIncrease, index: 0, increase: true),
                            ]
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 10,
                            children: [
                              TimeSetterText(text: widget.hours),
                              Text(":",style: AllTextStyles.digitClockTextStyle),
                              TimeSetterText(text: widget.minutes),
                              Text(":",style: AllTextStyles.digitClockTextStyle),
                              TimeSetterText(text: widget.seconds),
                            ]
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 10,
                            children: [
                              TimeIncreaseButton(func: widget.timeDecrease, index: 2, increase: false),
                              TimeIncreaseButton(func: widget.timeDecrease, index: 1, increase: false),
                              TimeIncreaseButton(func: widget.timeDecrease, index: 0, increase: false),
                            ]
                        ),
                        ElevatedButtonDesign(func: (){
                          Navigator.pop(context);
                        }, title: AllTexts.set)
                      ]
                  )
              )
          );
        },
      ),
    );
  }
}
