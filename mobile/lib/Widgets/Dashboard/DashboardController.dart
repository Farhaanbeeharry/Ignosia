import 'package:flutter/material.dart';
import 'package:ignosia/Widgets/Compose/Compose.dart';
import 'package:ignosia/Widgets/Dashboard/DashView/DashView.dart';
import 'package:ignosia/Widgets/Events/EventView.dart';
import 'package:ignosia/Widgets/Profile/Profile.dart';
import 'package:ignosia/Widgets/Schedule/ScheduleView.dart';

class HomePageController {
  int selectedIndex = 0;
  List<Widget> pages = [DashView(), ScheduleView(), EventView(), ComposeView(), ProfileView()];
}
