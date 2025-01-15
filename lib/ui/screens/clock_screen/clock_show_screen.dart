import 'dart:async';

import 'package:analog_clock/config/all_colors.dart';
import 'package:analog_clock/config/all_texts.dart';
import 'package:analog_clock/ui/screens/clock_screen/clock_screen_widgets/clock_frame.dart';
import 'package:analog_clock/ui/screens/clock_screen/clock_screen_widgets/digital_clock_frame.dart';
import 'package:analog_clock/ui/screens/clock_screen/clock_screen_widgets/indicator.dart';
import 'package:analog_clock/ui/screens/clock_screen/clock_screen_widgets/time_number.dart';
import 'package:flutter/material.dart';

class ClockShowScreen extends StatefulWidget {
  const ClockShowScreen({super.key});

  @override
  State<ClockShowScreen> createState() => _ClockShowScreenState();
}

class _ClockShowScreenState extends State<ClockShowScreen> {
  late Timer _timer;
  final double frameHeight = 300;

  final double framaWidth = 300;

  TimeOfDay timeOfDay = TimeOfDay.now();

  DateTime time = DateTime.now();

  final double secMinDivides = 6.283 / 60;
  final double hourDivides = 6.283 / 12;
  late double secAngles = time.second * secMinDivides;
  late double minAngles = time.minute * secMinDivides;
  late double hourAngles = time.hour * hourDivides;

  timeChanger() {
    setState(() {
      time = DateTime.now();
      timeOfDay = TimeOfDay.now();
      secAngles = time.second * secMinDivides;
      minAngles = time.minute * secMinDivides;
      hourAngles = time.hour * hourDivides;
    });
  }

  @override
  void initState(){
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      timeChanger();
    });
  }

  @override
  void dispose(){
    _timer.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return  Padding(
      padding: const EdgeInsets.all(15.0),
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: frameHeight,
                width: framaWidth,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AllColors.frameBlack),
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    ClockFrame(height: height, width: width),
                    Positioned(
                      top: 60,
                      child: DigitalClockFrame(time: timeOfDay, dateTime: time),
                    ),
                    Positioned(
                        top: 10, child: TimeNumber(number: AllTexts.twelve)),
                    Positioned(
                        top: 25,
                        right: 85,
                        child: TimeNumber(number: AllTexts.one)),
                    Positioned(
                        top: 65,
                        right: 40,
                        child: TimeNumber(number: AllTexts.two)),
                    Positioned(
                        top: 135,
                        right: 15,
                        child: TimeNumber(number: AllTexts.three)),
                    Positioned(
                        bottom: 75,
                        right: 35,
                        child: TimeNumber(number: AllTexts.four)),
                    Positioned(
                        bottom: 25,
                        right: 85,
                        child: TimeNumber(number: AllTexts.five)),
                    Positioned(
                        bottom: 10, child: TimeNumber(number: AllTexts.six)),
                    Positioned(
                        bottom: 25,
                        left: 85,
                        child: TimeNumber(number: AllTexts.seven)),
                    Positioned(
                        bottom: 75,
                        left: 35,
                        child: TimeNumber(number: AllTexts.eight)),
                    Positioned(
                        top: 135,
                        left: 15,
                        child: TimeNumber(number: AllTexts.nine)),
                    Positioned(
                        top: 70,
                        left: 35,
                        child: TimeNumber(number: AllTexts.ten)),
                    Positioned(
                        top: 25,
                        left: 85,
                        child: TimeNumber(number: AllTexts.elev)),


                    // hour indicator
                    Positioned(
                      left: 150,
                      child: Transform.rotate(
                        angle: hourAngles - 1.5708,
                        alignment: Alignment.centerLeft,
                        child: Indicator(height: 5, width: 70, color: AllColors.brightGreen),
                      ),
                    ),
                    // minute indicator
                    Positioned(
                      left: 150,
                      child: Transform.rotate(
                        angle: minAngles - 1.5708,
                        alignment: Alignment.centerLeft,
                        child: Indicator(height: 5, width: 100, color: AllColors.brightBlue),
                      ),
                    ),
                    // second indicator
                    Positioned(
                      left: 150,
                      child: Transform.rotate(
                        angle: secAngles - 1.5708,
                        alignment: Alignment.centerLeft,
                        child: Indicator(height: 2, width: 115, color: AllColors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
