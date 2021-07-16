import 'package:mobile/Widgets/Dashboard/DashboardController.dart';
import 'package:flashy_tab_bar/flashy_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageController dashboardController = new HomePageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FlashyTabBar(
        animationCurve: Curves.linear,
        animationDuration: new Duration(milliseconds: 300),
        selectedIndex: dashboardController.selectedIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          dashboardController.selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: Icon(FontAwesomeIcons.tachometerAlt),
            title: Text('Dashboard'),
          ),
          FlashyTabBarItem(
            icon: Icon(FontAwesomeIcons.calendar),
            title: Text('Schedules'),
          ),
          FlashyTabBarItem(
            icon: Icon(FontAwesomeIcons.glassCheers),
            title: Text('Events'),
          ),
          FlashyTabBarItem(
            icon: Icon(FontAwesomeIcons.paperPlane),
            title: Text('Compose'),
          ),
          FlashyTabBarItem(
            icon: Icon(FontAwesomeIcons.user),
            title: Text('Profile'),
          ),
        ],
      ),
      body: dashboardController.pages[dashboardController.selectedIndex],
    );
  }
}
