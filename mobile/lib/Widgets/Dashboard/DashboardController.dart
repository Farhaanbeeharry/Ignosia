import 'package:flutter/material.dart';
import 'package:mobile/Widgets/Compose/Compose.dart';
import 'package:mobile/Widgets/Profile/Profile.dart';

class DashboardController {
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
    Container(
      child: Center(
        child: Text('Events'),
      ),
    ),
    ComposeView(),
    ProfileView()
  ];
}
