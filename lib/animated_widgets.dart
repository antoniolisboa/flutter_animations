import 'package:flutter/material.dart';

class AnimatedWidgets extends StatefulWidget {
  const AnimatedWidgets({super.key});

  @override
  State<AnimatedWidgets> createState() => _AnimatedWidgetsState();
}

class _AnimatedWidgetsState extends State<AnimatedWidgets> {
  bool _toggle = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'AnimatedContainer',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 24,
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              height: _toggle ? 100 : 400,
              width: _toggle ? 100 : 200,
              curve: Curves.easeInOutBack,
              decoration: BoxDecoration(
                color: _toggle ? Colors.blueAccent : Colors.deepPurpleAccent,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _toggle = !_toggle;
                });
              },
              child: const Text(
                'Animate',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
