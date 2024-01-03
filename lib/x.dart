import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';
import 'questions_screen.dart';
import './result_screen.dart';

class X extends StatefulWidget {
  const X({super.key});

  @override
  State<X> createState() => XState();
}

Widget? activeScreen;

class XState extends State<X> {
  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void finalQuestionAnswerd() {
    setState(
      () {
        activeScreen = ResultScreen(restartQuiz);
      },
    );
  }

  void switchScreen() {
    setState(
      () {
        activeScreen = QuestionsScreen(finalQuestionAnswerd);
      },
    );
  }

  void restartQuiz() {
    setState(
      () {
        currentQuestionIndex = 0;
        selectedAnswers = [];
        activeScreen = StartScreen(switchScreen);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 61, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(child: activeScreen),
        ),
      ),
    );
  }
}
