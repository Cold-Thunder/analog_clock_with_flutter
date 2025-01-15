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

  int seconds = 0;
  int minutes = 0;
  int hours = 0;

  timeSetterDialog(context){
    return showDialog(
      context: context,
      builder: (context){
        return ShowDialog(
          seconds: seconds,
          minutes:  minutes,
          hours: hours,
          timeDecrease: timeDecrease,
          timeIncrease: timeIncrease,);
      }
    );
  }

  timeIncrease(int ind){
    if(ind == 0){
      setState((){
        seconds++;
      });
    }else if(ind == 1){
      setState((){
        minutes++;
      });
    }else{
      setState(() {
        hours++;
      });
    }
  }

  timeDecrease(int ind){
    if(ind == 0 && seconds > 0){
      setState(() {
        seconds--;
      });
    }else if(ind == 1 && minutes > 0){
      setState(() {
        minutes--;
      });
    }else if(hours > 0){
      setState((){
        hours--;
      });
    }
  }

  @override
  Widget build(BuildContext context){
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

   return Padding(
     padding: const EdgeInsets.all(15.0),
     child: SizedBox(
       height: height,
       width: width,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         spacing: 50,
         children: [
            TimerScreenFrame(),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               ElevatedButtonDesign(func: ()=> timeSetterDialog(context), title: AllTexts.setTime)
             ],
           )
         ],
       )
     ),
   );
  }
}
