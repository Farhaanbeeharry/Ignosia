import 'package:flutter/material.dart';

class HomepageController {
  Color selectedBox = Color(0XFF6C63FF);
  Color unselectedBox = Colors.white;
  Color hoverBox = Colors.black12;
  Color hoverText = Colors.black;
  Color selectedText = Colors.white;
  Color unselectedText = Colors.black54;

  Map<String, bool> selectedNavBar = {
    "dashboard": true,
    "cases": false,
    "schedule": false,
    "validator": false,
    "finance": false,
    "event": false,
    "members": false,
    "beneficiary": false,
    "analytics": false,
  };
  Color currentDashboardText = Colors.white;
  Color currentDashboardBox = Color(0XFF6C63FF);

  Color currentCasesText = Colors.black54;
  Color currentCasesBox = Colors.white;

  Color currentScheduleText = Colors.black54;
  Color currentScheduleBox = Colors.white;

  Color currentValidatorText = Colors.black54;
  Color currentValidatorBox = Colors.white;

  Color currentFinanceText = Colors.black54;
  Color currentFinanceBox = Colors.white;

  Color currentEventText = Colors.black54;
  Color currentEventBox = Colors.white;

  Color currentMembersText = Colors.black54;
  Color currentMembersBox = Colors.white;

  Color currentBeneficiaryText = Colors.black54;
  Color currentBeneficiaryBox = Colors.white;

  Color currentAnalyticsText = Colors.black54;
  Color currentAnalyticsBox = Colors.white;

  Color currentSettingsText = Colors.black;
  Color currentSettingsBox = Colors.white;

  Color currentLogoutText = Colors.black;
  Color currentLogoutBox = Colors.white;
}
