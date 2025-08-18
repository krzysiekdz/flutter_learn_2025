import 'package:flutter/material.dart';
import 'package:flutter_learn_2025/my_liquid_glass/background_capture_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey backgroundKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          RepaintBoundary(
            key: backgroundKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/sample_1.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/sample_2.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/sample_3.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          BackgroundCaptureWidget(
            height: 180,
            width: 180,
            backgroundKey: backgroundKey,
          )
        ],
      ),
    );
  }
}
