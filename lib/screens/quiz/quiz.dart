import 'package:flutter/material.dart';
import 'package:hyper_car_showcase/data/questions.dart';
import 'package:hyper_car_showcase/screens/quiz/questions_screen.dart';
import 'package:hyper_car_showcase/screens/quiz/results_questions/results_screen.dart';
import 'package:hyper_car_showcase/screens/quiz/start_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;
  String activeTitle = 'Car Quiz';

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void chosenAnswers(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(selectedAnswers, restartQuiz);
        activeTitle = 'Results';
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(chosenAnswers);
      activeTitle = 'Questions';
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = StartScreen(switchScreen);
      activeTitle = 'Car Quiz';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        title: Text(activeTitle),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: activeScreen,
      ),
    );
  }
}
