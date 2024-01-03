import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.start, {super.key});
  final void Function() start;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quiz-logo.png',
              color: const Color.fromARGB(194, 255, 255, 255)),
          const SizedBox(height: 80),
          const Text(
            'Learn Flutter',
            style: TextStyle(
              color: Color.fromARGB(194, 255, 255, 255),
              fontSize: 33,
              shadows: [
                Shadow(color: Colors.black, blurRadius: 25),
              ],
            ),
          ),
          const SizedBox(height: 80),
          OutlinedButton(
            onPressed: start,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 33, 1, 95),
              ),
            ),
            child: const Text(
              'Continue',
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255), fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
