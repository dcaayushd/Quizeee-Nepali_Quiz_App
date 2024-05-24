import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ResultScreen({super.key, 
    required this.score,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Result'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score:',
              style: GoogleFonts.montserrat(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              '$score/$totalQuestions',
              style: GoogleFonts.montserrat(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: score >= (totalQuestions * 0.7)
                    ? Colors.green
                    : score >= (totalQuestions * 0.4)
                        ? Colors.orange
                        : Colors.red,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              score >= (totalQuestions * 0.7)
                  ? 'Congratulations You passed with flying colors!'
                  : score >= (totalQuestions * 0.4)
                      ? 'Good job You passed, but there\'s room for improvement.'
                      : 'Don\'t worry, you can do better next time!',
              style: GoogleFonts.montserrat(
                fontSize: 18.0,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 16.0,
                ),
              ),
              child: Text(
                'Play Again',
                style: GoogleFonts.montserrat(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
