import 'package:flutter/material.dart';

class WidgetsTransition extends StatefulWidget {
  const WidgetsTransition({super.key});

  @override
  State<WidgetsTransition> createState() => _WidgetsTransitionState();
}

class _WidgetsTransitionState extends State<WidgetsTransition>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'RotationalTransition',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              _animationController!.isAnimating
                  ? _animationController!.stop()
                  : _animationController!.repeat();
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: RotationTransition(
                turns: _animationController!,
                alignment: Alignment.center,
                child: Image.asset(
                  'images/hypno.png',
                  height: 150,
                  width: 150,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Tap to STOP/START',
            style: TextStyle(fontSize: 24),
          )
        ],
      ),
    );
  }
}
