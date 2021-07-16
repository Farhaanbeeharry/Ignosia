import 'package:mobile/Widgets/Compose/Compose.dart';
import 'package:mobile/Widgets/Dashboard/DashView/DashView.dart';
import 'package:mobile/Widgets/Events/EventView.dart';
import 'package:mobile/Widgets/Profile/Profile.dart';
import 'package:mobile/Widgets/Schedule/ScheduleView.dart';
import 'package:flutter/material.dart';

class HomePageController {
  int selectedIndex = 0;
  List<Widget> pages = [DashView(), ScheduleView(), EventView(), ComposeView(), ProfileView()];
}
