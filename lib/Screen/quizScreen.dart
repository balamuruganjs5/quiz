// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:quiz_app/Atoms/custom_elevated_button.dart';
import 'package:quiz_app/Model/questions.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen(this.updateValues, {super.key});

  void Function(String value) updateValues;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int activeIndex = 0;

  void handleSelectNextQuestion(String value) {
    widget.updateValues(value);
    print("Quiz Screen");
    print(activeIndex);
    print("Questins length");
    print(Questions.length);
    if (activeIndex != Questions.length - 1) {
      setState(() {
        activeIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var activeQuestion = Questions[activeIndex];

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            activeQuestion.text,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          ...activeQuestion.suffeldOptions.map(
            (item) => CustomElevatedButton(item, handleSelectNextQuestion),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
