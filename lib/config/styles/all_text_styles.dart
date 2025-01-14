import 'package:analog_clock/config/all_colors.dart';
import 'package:flutter/material.dart';

class AllTextStyles{
    static TextStyle clockTimeTextStyle = TextStyle(
      fontSize: 25,
      color: AllColors.white,
      fontWeight: FontWeight.bold
    );

    static TextStyle digitClockTextStyle = TextStyle(
        fontSize: 30,
        color: AllColors.brightBlue,
        fontFamily: "Digital_Clock_mono",
    );
}