import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  final void Function() startQuiz;

  const StartScreen(this.startQuiz, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/carchat.png',
            width: 450,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
          Text(
            'Lets Play Car Quiz!',
            style: GoogleFonts.macondo(color: Colors.white, fontSize: 40),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
              onPressed: startQuiz,
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.white),
              icon: const Icon(Icons.arrow_right_alt_rounded),
              label: const Text('Start Quiz'))
        ],
      ),
    );
  }
}
