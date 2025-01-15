
import 'package:analog_clock/config/all_colors.dart';
import 'package:analog_clock/ui/screens/clock_screen/clock_show_screen.dart';
import 'package:analog_clock/ui/screens/stop_watch_screen/stop_watch_screen.dart';
import 'package:analog_clock/ui/screens/timer_screen/timer_screen.dart';
import 'package:flutter/material.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> with SingleTickerProviderStateMixin{
  late final TabController _tabController;


  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AllColors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: AllColors.purple,
          bottom: TabBar(
            controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: AllColors.white,
              tabs: [
                Tab(
                  icon: Icon(Icons.watch_later_outlined, size: 22, color: AllColors.white)
                ),
                Tab(
                    icon: Icon(Icons.hourglass_bottom, size: 22, color: AllColors.white)
                ),
                Tab(
                    icon: Icon(Icons.watch, size: 22, color: AllColors.white)
                ),
              ]
          )
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ClockShowScreen(),
          StopWatchScreen(),
          TimerScreen(),
        ]
      ),
    );
  }
}
