// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../providers/quiz_provider.dart';
// import '../widgets/answer_button.dart';
// import '../widgets/question_card.dart';
// import '../widgets/score_display.dart';

// class QuizScreen extends ConsumerWidget {
//   const QuizScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final quizState = ref.watch(quizProvider);
//     final currentQuestion = quizState.questions[quizState.currentQuestionIndex];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Nepal Quiz'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(height: 16.0),
//             QuestionCard(question: currentQuestion),
//             SizedBox(height: 16.0),
//             ...currentQuestion.options.map((option) => AnswerButton(
//                   text: option,
//                   isSelected: quizState.selectedAnswer == option,
//                   onPressed: () {
//                     ref.read(quizProvider.notifier).selectAnswer(option);
//                   },
//                 )).toList(),
//             SizedBox(height: 16.0),
//             if (quizState.currentQuestionIndex == quizState.questions.length)
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   ScoreDisplay(score: quizState.score, total: quizState.questions.length),
//                   SizedBox(height: 16.0),
//                   ElevatedButton(
//                     onPressed: () {
//                       ref.read(quizProvider.notifier).reset();
//                       Navigator.pushReplacementNamed(context, '/');
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(vertical: 16.0),
//                     ),
//                     child: Text(
//                       'Restart Quiz',
//                       style: GoogleFonts.montserrat(
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/quiz_provider.dart';
import '../widgets/answer_button.dart';
import '../widgets/question_card.dart';
import '../widgets/score_display.dart';
import 'result_screen.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizState = ref.watch(quizProvider);

    if (quizState.currentQuestionIndex >= quizState.questions.length) {
      return ResultScreen(
          score: quizState.score, totalQuestions: quizState.questions.length);
    }

    final currentQuestion = quizState.questions[quizState.currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nepal Quiz'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16.0),
            QuestionCard(question: currentQuestion),
            const SizedBox(height: 16.0),
            ...currentQuestion.options
                .map((option) => AnswerButton(
                      text: option,
                      isSelected: quizState.selectedAnswer == option,
                      onPressed: () {
                        ref.read(quizProvider.notifier).selectAnswer(option);
                      },
                    ))
                ,
            const SizedBox(height: 16.0),
            ScoreDisplay(
                score: quizState.score, total: quizState.questions.length),
          ],
        ),
      ),
    );
  }
}
