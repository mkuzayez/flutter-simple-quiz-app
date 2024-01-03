import 'package:flutter/material.dart';
import './models/styling.dart';
import './questions_screen.dart';
import 'data/questions_list.dart';

List<Map<String, Object>> summary = [];

// ignore: must_be_immutable
class ResultScreen extends StatelessWidget {
  const ResultScreen(this.restart, {super.key});

  final void Function()? restart;

  @override
  Widget build(BuildContext context) {
    int correctAnswersCount = 0;

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'answer': questions[i].answers[0],
          'user_answer': selectedAnswers[i],
        },
      );
      if (selectedAnswers[i] == questions[i].answers[0]) correctAnswersCount++;
    }

    int y = questions.length;
    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 50,
          ),
          ResultText(
              'You have answerd $correctAnswersCount of $y questions correctlly.'),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Correct answers are blue, yours are the reds.',
            style: TextStyle(
              color: Colors.white,
              shadows: [
                Shadow(color: Color.fromARGB(255, 0, 0, 0), blurRadius: 25),
              ],
              fontSize: 13,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Summary(),
          const SizedBox(
            height: 100,
          ),
          OutlinedButton(
            onPressed: restart,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 33, 1, 95),
              ),
            ),
            child: const Text(
              'Restart Quiz',
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255), fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map(
            (x) {
              return Container(
                margin: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    SummaryText(
                      text: x['question'] as String,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SummaryText(
                      text: x['answer'] as String,
                      color: const Color.fromARGB(255, 111, 162, 255),
                    ),
                    SummaryText(
                      text: x['user_answer'] as String,
                      color: Colors.redAccent,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
