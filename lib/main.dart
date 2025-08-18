import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:flutter_learn_2025/my_liquid_glass/home_screen.dart';
import 'package:flutter_learn_2025/todo_app/app.dart';
import 'package:flutter_learn_2025/todo_app/utils/locator.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

void main() {
  // debugRepaintRainbowEnabled = true;
  setupLocator();
  runApp(TodoApp());
}

//https://docs.flutter.dev/ui/layout/constraints
