// ignore: file_names
import 'package:flutter/material.dart';
import 'package:quiz_app/Model/questions.dart';
import 'package:quiz_app/Screen/resultScreen.dart';
import 'package:quiz_app/Screen/startScreen.dart';
import 'package:quiz_app/Screen/quizScreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(changeScreen);
    super.initState();
  }

  final List<String> selectedvalues = [];

  void getBackToHomeScreen() {
    setState(() {
      selectedvalues.clear();
      activeScreen = StartScreen(changeScreen);
    });
  }

  void updateValues(String value) {
    print("homeScreen");
    selectedvalues.add(value);

    print(selectedvalues.length);

    if (selectedvalues.length == Questions.length) {
      setState(() {
        activeScreen = ResultScreen(
            getBackToHomeScreen: getBackToHomeScreen,
            selectedValues: selectedvalues);
      });
    }
  }

  void changeScreen() {
    setState(() {
      activeScreen = QuizScreen(updateValues);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueGrey.shade700, Colors.blueGrey.shade200],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
