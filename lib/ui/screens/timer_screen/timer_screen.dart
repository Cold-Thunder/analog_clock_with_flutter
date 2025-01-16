import 'dart:async';

import 'package:analog_clock/config/all_colors.dart';
import 'package:analog_clock/config/all_texts.dart';
import 'package:analog_clock/ui/screens/timer_screen/widgets/show_dialog.dart';
import 'package:analog_clock/ui/screens/timer_screen/widgets/timer_screen_frame.dart';
import 'package:analog_clock/ui/widgets/elevated_button.dart';
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  bool start = false;
  Timer? _timer;

  int seconds = 0;
  int minutes = 0;
  int hours = 0;
  int milliseconds = 0;

  int mainTotalMill = 0;

  double progressValue = 1;


  timeIncrease(int ind) {
    if (ind == 0 && seconds < 60) {
      setState(() {
        seconds++;
        milliseconds = 999;
      });
    } else if (ind == 1 && minutes < 60) {
      setState(() {
        minutes++;
        milliseconds = 999;

      });
    } else if(ind == 2){
      setState(() {
        hours++;
        milliseconds = 999;
      });
    }
  }

  timeDecrease(int ind) {
    if (ind == 0 && seconds > 0) {
      setState(() {
        seconds--;
      });
    } else if (ind == 1 && minutes > 0) {
      setState(() {
        minutes--;
      });
    } else if (ind == 2 && hours > 0) {
      setState(() {
        hours--;
      });
    }
  }


  // timer method
  startTimer() {


     if(start == false) {
        if(hours == 0 && minutes == 0 && seconds ==0){
          _timer?.cancel();
          setState(() {
            start = false;
          });
        }else{


          seconds -=1;

          int mainHoursMil = hours*60*60*1000;
          int mainMinMil = minutes*60*1000;
          int mainSecMil = seconds*1000;
          mainTotalMill = mainHoursMil + mainMinMil + mainSecMil;


            _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
              if(hours == 0 && minutes == 0 && seconds == 0 && milliseconds <=0){
                setState(() {
                  start = false;
                });
                _timer?.cancel();
              }else{
                setState(() {
                  start = true;
                  if(milliseconds > 0) {
                    milliseconds -= 10;
                    if (seconds > 0 && milliseconds <= 0) {
                      seconds--;
                      milliseconds = 999;
                      if (minutes > 0 && seconds == 0) {
                        minutes--;
                        seconds = 59;
                      } else if (hours > 0 && minutes == 0) {
                        hours--;
                        minutes = 59;
                      }
                    }
                  }
                });
              }

              if(mainTotalMill > 0){
                int hoursMil = hours*60*60*1000;
                int minMil = minutes*60*1000;
                int secMil = seconds*1000;
                int totalMilliSec = hoursMil + minMil + secMil;

                mainTotalMill >0 ?
                progressValue = 1 - (1- 0.01) : 0;
              }
            });

        }
     }else{
       setState(() {
         start = false;
       });
       _timer?.cancel();
     }
  }





  @override
  void dispose(){
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 50,
              children: [
                ShowDialog(
                  start: start,
                    seconds: seconds,
                    minutes: minutes,
                    hours: hours,
                    timeIncrease: timeIncrease,
                    timeDecrease: timeDecrease),
                TimerScreenFrame(
                  hour: hours,
                  minutes: minutes,
                  sec: seconds,
                  milliSeconds: milliseconds,
                  progValue: progressValue,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [
                    ElevatedButtonDesign(
                        color: start ? AllColors.red : AllColors.purple,
                        func: startTimer,
                        title: start ? AllTexts.breakTime : AllTexts.start),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
