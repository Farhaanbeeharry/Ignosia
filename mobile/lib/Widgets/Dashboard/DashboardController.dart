import 'package:flutter/material.dart';
import 'package:mobile/Widgets/Compose/Compose.dart';
import 'package:mobile/Widgets/Events/EventView.dart';
import 'package:mobile/Widgets/Profile/Profile.dart';

class HomePageController {
  int selectedIndex = 0;
  List<Widget> pages = [
    Container(
      child: Center(
        child: Text('Dashboard'),
      ),
    ),
    Container(
      child: Center(
        child: Text('Schedules'),
      ),
    ),
    EventView(),
    ComposeView(),
    ProfileView()
  ];
}
