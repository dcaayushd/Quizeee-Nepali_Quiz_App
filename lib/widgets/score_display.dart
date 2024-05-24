import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScoreDisplay extends StatelessWidget {
  final int score;
  final int total;

  const ScoreDisplay({super.key, 
    required this.score,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Score: $score/$total',
      style: GoogleFonts.montserrat(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: score >= (total * 0.7)
            ? Colors.green
            : score >= (total * 0.4)
                ? Colors.orange
                : Colors.red,
      ),
    );
  }
}
