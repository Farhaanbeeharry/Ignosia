import 'package:flutter/material.dart';
import 'package:mobile/Model/EventModel.dart';
import 'package:mobile/Widgets/Events/DetailedEventWidget/DetailedWidgetController.dart';

class DetailedEventWidget extends StatefulWidget {

  final EventModel event;

  DetailedEventWidget({this.event});

  @override
  _DetailedEventWidgetState createState() => _DetailedEventWidgetState();
}

class _DetailedEventWidgetState extends State<DetailedEventWidget> {
  DetailedEventController detailedEventController = new DetailedEventController();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
