import 'package:analog_clock/config/all_colors.dart';
import 'package:analog_clock/config/styles/all_text_styles.dart';
import 'package:flutter/material.dart';

class ElevatedButtonDesign extends StatelessWidget {
  final Function func;
  final String title;
  final Color? color;
  const ElevatedButtonDesign({this.color, required this.func, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        func();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AllColors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(title,
          style: AllTextStyles.elevatedTextStyle
      ),
    );
  }
}
