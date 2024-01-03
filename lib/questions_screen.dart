import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions_list.dart';
import './models/styling.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.finalQuestionAnswerd, {super.key});

  final void Function() finalQuestionAnswerd;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

int currentQuestionIndex = 0;
List<String> selectedAnswers = [];

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    questionAnswerd(item) {
      setState(
        () {
          currentQuestionIndex++;
          if (currentQuestionIndex == questions.length) {
            widget.finalQuestionAnswerd();
          }
        },
      );
      selectedAnswers.add(item);
    }

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            QuestionsText(currentQuestion.text),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map(
              (item) {
                return AnswerButton(
                  onPressed: () {
                    questionAnswerd(item);
                  },
                  text: item,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
