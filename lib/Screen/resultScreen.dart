import 'package:flutter/material.dart';
import 'package:quiz_app/Atoms/summary_list.dart';
import 'package:quiz_app/Model/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key,
      required this.getBackToHomeScreen,
      required this.selectedValues});

  final void Function() getBackToHomeScreen;

  final List<String> selectedValues;

  List<Map<String, Object>> get summarydata {
    final List<Map<String, Object>> resultData = [];

    for (int i = 0; i < Questions.length; i++) {
      resultData.add({
        'question_index': i,
        'question': Questions[i].text,
        'correct_answer': Questions[i].options[0],
        'user_answer': selectedValues[i]
      });
    }

    return resultData;
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> summaryData = summarydata;

    final String noOfCurrectAnswers = summaryData
        .where((w) => w['user_answer'] == w['correct_answer'])
        .length
        .toString();

    final String totalQuestions = summaryData.length.toString();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'You answered $noOfCurrectAnswers out of $totalQuestions questions corrected.',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SummaryList(summaryData: summaryData),
          const SizedBox(
            height: 30,
          ),
          TextButton.icon(
            onPressed: getBackToHomeScreen,
            icon: const Icon(Icons.restart_alt_outlined),
            label: const Text('Restart Quiz!'),
          ),
        ],
      ),
    );
  }
}
