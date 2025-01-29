import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'questions_number.dart';

class SummaryItem extends StatelessWidget {
  final Map<String, Object> itemData;

  const SummaryItem(this.itemData, {super.key});

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer = itemData['User Answer'] == itemData['Answer'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionsIdentifier(itemData['Question Index'] as int, isCorrectAnswer),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['Question'] as String,
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(itemData['User Answer'] as String,
                  style: const TextStyle(color: Colors.red)),
              Text(itemData['Answer'] as String,
                  style: const TextStyle(color: Colors.green))
            ],
          ),
        ),
      ],
    );
  }
}
