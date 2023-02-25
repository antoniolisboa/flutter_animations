import 'package:flutter/material.dart';
import 'animated_widgets.dart';
import 'tween_animation.dart';
import 'widgets_transition.dart';
import 'builder_animation.dart';

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
        primarySwatch: Colors.deepPurple,
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
              Tab(text: 'Animated'),
              Tab(text: 'Tween'),
              Tab(text: 'Trasition'),
              Tab(text: 'Builder'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // Widgets implícitos
            AnimatedWidgets(),
            TweenAnimation(),

            // Widgets explícitos
            WidgetsTransition(),
            BuilderAnimation(),
          ],
        ),
      ),
    );
  }
}
