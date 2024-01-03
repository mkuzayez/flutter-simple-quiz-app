import 'package:flutter/material.dart';

class AnswersText extends StatelessWidget {
  const AnswersText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          shadows: [
            Shadow(color: Colors.black),
          ],
          fontFamily: 'CascadiaMono',
          fontSize: 15),
      textAlign: TextAlign.center,
    );
  }
}

class QuestionsText extends StatelessWidget {
  const QuestionsText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color.fromARGB(235, 255, 255, 255),
        fontSize: 24,
        shadows: [
          Shadow(color: Color.fromARGB(255, 0, 0, 0), blurRadius: 25),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}

class AnswerButton extends StatelessWidget {
  const AnswerButton({required this.text, required this.onPressed, super.key});

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10),
        backgroundColor: const Color.fromARGB(240, 33, 1, 95),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
      ),
      child: AnswersText(text),
    );
  }
}

class ResultText extends StatelessWidget {
  const ResultText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 24,
        shadows: [
          Shadow(color: Color.fromARGB(255, 0, 0, 0), blurRadius: 25),
        ],
      fontWeight: FontWeight.w600
      ),
      textAlign: TextAlign.center,
      
    );
  }
}


class SummaryText extends StatelessWidget {
  const SummaryText({required this.text, required this.color, super.key});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 14,
        shadows: const [
          Shadow(color: Color.fromARGB(255, 0, 0, 0), blurRadius: 25),
        ],
        fontWeight: FontWeight.w500
      ),
      textAlign: TextAlign.center,
    );
  }
}
