import 'dart:async';

import 'package:analog_clock/config/all_colors.dart';
import 'package:analog_clock/ui/screens/stop_watch_screen/widgets/stop_watch_frame.dart';
import 'package:flutter/material.dart';

class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({super.key});

  @override
  State<StopWatchScreen> createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  Timer? _timer;
  bool start = false;

  int milliSec = 0;
  int seconds = 0;
  int minutes = 0;
  int hours = 0;

  startTime() {
    try{
    if (start == false) {

      _timer = Timer.periodic(
        Duration(milliseconds: 10),
        (timer) {
          setState(
            () {
              start = true;
              milliSec += 10;
              if (milliSec == 1000) {
                seconds += 1;
                milliSec = 0;
                if (seconds == 60) {
                  minutes += 1;
                  seconds = 0;
                  if (minutes == 60) {
                    hours += 1;
                    minutes = 0;
                  }
                }
              }
            },
          );
        },
      );
    } else {
      setState(
        () {
          start = false;
        },
      );
      if (_timer != null) {
        _timer?.cancel();
      }
    }
    }catch(err){
      debugPrint(err.toString());
    }
  }

  resetButton() {
    _timer?.cancel();
    setState(() {
      start = false;
      milliSec = 0;
      seconds = 0;
      minutes = 0;
      hours = 0;
    });
  }

  @override
  void dispose(){
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          // stop watch frame
          StopWatchFrame(
            milliSec: milliSec,
            second: seconds,
            minutes: minutes,
            hours: hours,
          ),
          // buttons row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              ElevatedButton(
                onPressed: () {
                  startTime();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: start ? AllColors.red : AllColors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Icon(start ? Icons.pause : Icons.play_arrow,
                    size: 22, color: AllColors.white),
              ),
              ElevatedButton(
                onPressed: () {
                  resetButton();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AllColors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child:
                    Icon(Icons.restart_alt, size: 22, color: AllColors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
