import 'package:analog_clock/config/all_colors.dart';
import 'package:analog_clock/config/models/time_changer_model.dart';
import 'package:flutter/material.dart';

class TimeIncreaseButton extends StatelessWidget {
  final Function(int index) func;
  final int index;
  final bool increase;
  const TimeIncreaseButton({required this.func, required this.index, required this.increase, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        func(index);
      },
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: 50,
          width: 80,
          child: Icon(increase ? Icons.arrow_drop_up_rounded
              :Icons.arrow_drop_down_rounded, size: 60, color: AllColors.white)
        ),
      ),
    );
  }
}
