import 'package:flutter/material.dart';

class BuilderAnimation extends StatefulWidget {
  const BuilderAnimation({super.key});

  @override
  State<BuilderAnimation> createState() => _BuilderAnimationState();
}

class _BuilderAnimationState extends State<BuilderAnimation>
    with TickerProviderStateMixin {
  Animation? _startAnimation;
  AnimationController? _startAnimationController;
  bool _toggle = false;

  @override
  void initState() {
    super.initState();
    _startAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _startAnimation = Tween(begin: 140.0, end: 180.0).animate(
      CurvedAnimation(
        parent: _startAnimationController!,
        curve: Curves.easeInOut,
      ),
    );

    _startAnimationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _startAnimationController!.repeat();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _startAnimationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'AnimatedBuilder',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            width: 200,
            child: AnimatedBuilder(
              animation: _startAnimationController!,
              builder: (context, child) {
                return Icon(
                  Icons.audiotrack,
                  color: Colors.deepOrangeAccent,
                  size: _startAnimation!.value,
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _toggle = !_toggle;
              _toggle
                  ? _startAnimationController!.forward()
                  : _startAnimationController!.stop();
            },
            child: const Text('Start / Stop'),
          )
        ],
      ),
    );
  }
}
