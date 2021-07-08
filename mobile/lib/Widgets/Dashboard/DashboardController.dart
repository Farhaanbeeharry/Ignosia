import 'package:flutter/material.dart';
import 'package:mobile/Widgets/Compose/Compose.dart';
import 'package:mobile/Widgets/Events/EventView.dart';
import 'package:mobile/Widgets/Profile/Profile.dart';
import 'package:mobile/Widgets/Schedule/ScheduleView.dart';

class HomePageController {
  int selectedIndex = 0;
  List<Widget> pages = [
    Container(
      child: Center(
        child: Text('Dashboard'),
      ),
    ),
    ScheduleView(),
    EventView(),
    ComposeView(),
    ProfileView()
  ];
}
