import 'dart:async';

import 'package:flutter/widgets.dart';

class StoperApp extends StatelessWidget {
  const StoperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromARGB(128, 0, 0, 255)),
      child: Center(child: Stoper()),
    );
  }
}

class Stoper extends StatefulWidget {
  const Stoper({super.key});

  @override
  State<Stoper> createState() => _StoperState();
}

class _StoperState extends State<Stoper> {
  int milisec = 0;
  int sec = 0;
  int min = 0;
  late Timer timer;
  int step = 100;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: step), _updateTime);
  }

  _updateTime(Timer t) {
    setState(() {
      milisec += step;
      if (milisec >= 1000) {
        milisec = 0;
        sec++;
      }
      if (sec >= 60) {
        sec = 0;
        min++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$min : $sec : ${milisec / 10}',
      textDirection: TextDirection.ltr,
      style: TextStyle(fontSize: 24),
    );
  }
}
