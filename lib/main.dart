import 'package:flutter/material.dart';
import 'builder_animation.dart';
import 'xyz_transition.dart';
import 'tween_animation.dart';
import 'animated_xyz.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animation Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Animations'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Ani..xyz'),
              Tab(text: 'Tween'),
              Tab(text: 'XYZTra..'),
              Tab(text: 'Builder'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // AnimatedXYZ(),
            // TweenAnimation(),
            // XYZTransition(),
            // BuilderAnimation(),
            Container(
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
