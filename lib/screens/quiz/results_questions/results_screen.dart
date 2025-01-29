import 'package:hyper_car_showcase/data/questions.dart';
import 'package:hyper_car_showcase/screens/quiz/results_questions/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> finalAnswers;
  final void Function() onRestart;

  const ResultsScreen(this.finalAnswers, this.onRestart, {super.key});

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < finalAnswers.length; i++) {
      summary.add(
        {
          'Question Index': i,
          'Question': questions[i].text,
          'Answer': questions[i].answers[0],
          'User Answer': finalAnswers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuest = questions.length;
    final numCorrectQuest = summaryData.where((data) {
      return data['Answer'] == data['User Answer'];
    }).length;

    return Padding(
      padding: EdgeInsets.all(25),
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'You answered $numCorrectQuest out of $numTotalQuest correctly!',
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            ElevatedButton.icon(
                onPressed: onRestart,
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white),
                icon: const Icon(Icons.refresh),
                label: const Text('Restart Quiz!'))
          ],
        ),
      ),
    );
  }
}
