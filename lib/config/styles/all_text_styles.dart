import 'package:analog_clock/config/all_colors.dart';
import 'package:flutter/material.dart';

class AllTextStyles{
    static TextStyle clockTimeTextStyle = TextStyle(
      fontSize: 27,
      color: AllColors.white,
      fontWeight: FontWeight.bold,
        shadows: [
            Shadow(
                offset: Offset(1, 1),
                color: AllColors.frameBlack,
                blurRadius: 4
            )
        ]
    );

    static TextStyle digitClockTextStyle = TextStyle(
        fontSize: 30,
        color: AllColors.white,
        fontFamily: "Digital_Clock_mono",
    );
    static TextStyle elevatedTextStyle = TextStyle(
        fontSize: 18,
        color: AllColors.white,
    );
}