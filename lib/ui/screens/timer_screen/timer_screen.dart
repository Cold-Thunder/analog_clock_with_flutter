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

  double progressValue = 1;


  int mainHour = 0;
  int mainMin =  0;
  int mainSec = 0;

  int mainTotalMill = 0;



  timeIncrease(int ind) {
    if (ind == 0 && seconds < 60) {
      setState(() {
        seconds++;
        mainSec++;
        mainTotalMill += 1000;
      });
    } else if (ind == 1 && minutes < 60) {
      setState(() {
        minutes++;
        mainMin++;
        mainTotalMill += 60*1000;
      });
    } else if(ind == 2){
      setState(() {
        hours++;
        mainHour++;
        mainTotalMill += 60*60*1000;
      });
    }
  }

  timeDecrease(int ind) {
    if (ind == 0 && seconds > 0) {
      setState(() {
        seconds--;
        mainSec--;
        mainTotalMill -= 1000;
      });
    } else if (ind == 1 && minutes > 0) {
      setState(() {
        minutes--;
        mainMin--;
        mainTotalMill -= 60*1000;
      });
    } else if (ind == 2 && hours > 0) {
      setState(() {
        hours--;
        mainHour--;
        mainTotalMill -= 60*60*1000;
      });
    }
  }


  // timer method
  startTimer() {

     if(start == false) {

       // Circular Progress Indicator value controller value
       setState(() {
         if(seconds > 0 || minutes > 0 || hours > 0 || milliseconds > 0){
           if(mainTotalMill != mainSec*1000 + mainMin*60*1000 + mainHour*60*60*1000 + milliseconds){
             mainTotalMill = seconds*1000 + minutes*60*1000 + hours*60*60*1000 + milliseconds;
             progressValue = 1 - 1/(mainTotalMill/10);
           }else{
             if(progressValue > 0){
               progressValue = progressValue;
             }else if(progressValue <= 0){
               progressValue = 1;
             }
           }
         }
       });


        if(hours == 0 && minutes == 0 && seconds ==0 && milliseconds == 0){
          _timer?.cancel();
          setState(() {
            start = false;
          });
        }else{
            _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
              if(hours == 0 && minutes == 0 && seconds == 0 && milliseconds <=0){
                setState(() {
                  start = false;
                  mainTotalMill = 0;
                  mainHour = 0;
                  mainMin = 0;
                  mainSec =0;
                });
                _timer?.cancel();
              }else{
                setState(() {

                  start = true;

                  // progress value change
                  if(mainTotalMill > 0){
                    progressValue -= 1/(mainTotalMill/10);
                  }


                  // time changer
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
                });
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
