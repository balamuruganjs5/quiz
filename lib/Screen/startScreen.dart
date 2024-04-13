// ignore_for_file: file_names

import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(void Function() this.startQuiz, {super.key});

  final Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/quiz-logo.png',
              fit: BoxFit.contain,
              width: 400,
              color: const Color.fromARGB(72, 0, 0, 0),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Train your brain and raise your IQ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              backgroundColor: Colors.white,
            ),
            label: const Text('Start Quiz'),
            icon: const Icon(Icons.arrow_right),
          )
        ],
      ),
    );
  }
}
