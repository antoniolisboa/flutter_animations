import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({super.key});

  @override
  State<TweenAnimation> createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> {
  Color firstColor = Colors.white;
  Color secondColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'TweenAnimationBuilder',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 10),
          TweenAnimationBuilder<Color?>(
            tween: ColorTween(
              begin: firstColor,
              end: secondColor,
            ),
            duration: const Duration(seconds: 1),
            builder: (_, Color? color, __) {
              return ColorFiltered(
                colorFilter: ColorFilter.mode(
                  color ?? Colors.transparent,
                  BlendMode.modulate,
                ),
                child: Image.asset(
                  'images/bird.png',
                  height: 180,
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                firstColor =
                    firstColor == Colors.white ? Colors.yellow : Colors.white;
                secondColor =
                    secondColor == Colors.yellow ? Colors.white : Colors.yellow;
              });
            },
            child: const Text('Change Color'),
          ),
        ],
      ),
    );
  }
}
