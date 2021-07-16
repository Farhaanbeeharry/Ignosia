import 'package:Ignosia/Widgets/Compose/Compose.dart';
import 'package:Ignosia/Widgets/Dashboard/DashView/DashView.dart';
import 'package:Ignosia/Widgets/Events/EventView.dart';
import 'package:Ignosia/Widgets/Profile/Profile.dart';
import 'package:Ignosia/Widgets/Schedule/ScheduleView.dart';
import 'package:flutter/material.dart';

class HomePageController {
  int selectedIndex = 0;
  List<Widget> pages = [DashView(), ScheduleView(), EventView(), ComposeView(), ProfileView()];
}
