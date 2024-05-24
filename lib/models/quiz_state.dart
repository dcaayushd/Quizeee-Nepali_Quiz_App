import 'package:quizieee/models/question.dart';

class QuizState {
  final int score;
  final int currentQuestionIndex;
  final List<Question> questions;
  final String? selectedAnswer;

  QuizState({
    this.score = 0,
    this.currentQuestionIndex = 0,
    required this.questions,
    this.selectedAnswer,
  });

  QuizState copyWith({
    int? score,
    int? currentQuestionIndex,
    List<Question>? questions,
    String? selectedAnswer,
  }) {
    return QuizState(
      score: score ?? this.score,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      questions: questions ?? this.questions,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
    );
  }
}
