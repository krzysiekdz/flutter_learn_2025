import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

class MyGlassWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // This is the content that will be behind the glass
          Positioned.fill(
            child: Image.network(
              'https://picsum.photos/seed/glass/800/800',
              fit: BoxFit.cover,
            ),
          ),
          // The LiquidGlass widget sits on top
          Center(
            child: LiquidGlass(
              shape: LiquidRoundedSuperellipse(
                borderRadius: Radius.circular(50),
              ),
              child: const SizedBox(
                height: 200,
                width: 200,
                child: Center(
                  child: FlutterLogo(size: 100),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyGlassWidget(),
    );
  }
}

void main() {
  runApp(MyApp());
}
