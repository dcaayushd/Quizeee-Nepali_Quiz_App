import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/question.dart';
import '../models/quiz_state.dart';

final quizProvider = StateNotifierProvider<QuizNotifier, QuizState>((ref) {
  return QuizNotifier();
});

class QuizNotifier extends StateNotifier<QuizState> {
  QuizNotifier()
      : super(QuizState(
          questions: [
            // Science questions
            Question(
              id: 1,
              text: 'What is the national flower of Nepal?',
              options: ['Rhododendron', 'Lotus', 'Sunflower', 'Rose'],
              correctAnswer: 0,
              category: 'Science',
            ),
            Question(
              id: 2,
              text: 'Which mountain is the highest in Nepal?',
              options: [
                'Annapurna',
                'Dhaulagiri',
                'Kanchenjunga',
                'Mount Everest'
              ],
              correctAnswer: 3,
              category: 'Science',
            ),
            // History questions
            Question(
              id: 3,
              text: 'When did Nepal become a republic?',
              options: ['2006', '2008', '2015', '2020'],
              correctAnswer: 1,
              category: 'History',
            ),
            Question(
              id: 4,
              text: 'Who was the first king of unified Nepal?',
              options: [
                'Prithvi Narayan Shah',
                'Tribhuvan',
                'Mahendra',
                'Birendra'
              ],
              correctAnswer: 0,
              category: 'History',
            ),
            // Politics questions
            Question(
              id: 5,
              text: 'What is the current political system in Nepal?',
              options: ['Monarchy', 'Democracy', 'Communism', 'Dictatorship'],
              correctAnswer: 1,
              category: 'Politics',
            ),
            Question(
              id: 6,
              text: 'Who is the current Prime Minister of Nepal?',
              options: [
                'KP Sharma Oli',
                'Pushpa Kamal Dahal',
                'Sher Bahadur Deuba',
                'Khadga Prasad Sharma Oli'
              ],
              correctAnswer: 2,
              category: 'Politics',
            ),
            // Geography questions
            Question(
              id: 7,
              text: 'What is the largest lake in Nepal?',
              options: ['Rara Lake', 'Phewa Lake', 'Begnas Lake', 'Fewa Lake'],
              correctAnswer: 1,
              category: 'Geography',
            ),
            Question(
              id: 8,
              text: 'Which river flows through the Kathmandu Valley?',
              options: [
                'Koshi River',
                'Gandaki River',
                'Karnali River',
                'Bagmati River'
              ],
              correctAnswer: 3,
              category: 'Geography',
            ),
            // Culture questions
            Question(
              id: 9,
              text: 'What is the main religion in Nepal?',
              options: ['Hinduism', 'Buddhism', 'Islam', 'Christianity'],
              correctAnswer: 0,
              category: 'Culture',
            ),
            Question(
              id: 10,
              text: 'Which festival is celebrated by lighting oil lamps?',
              options: ['Dashain', 'Tihar', 'Holi', 'Chhath'],
              correctAnswer: 1,
              category: 'Culture',
            ),
            // Add more questions here
          ],
        ));

  void selectAnswer(String answer) {
    final currentQuestion = state.questions[state.currentQuestionIndex];
    final isCorrect =
        currentQuestion.options[currentQuestion.correctAnswer] == answer;
    state = state.copyWith(
      score: isCorrect ? state.score + 1 : state.score,
      currentQuestionIndex: state.currentQuestionIndex + 1,
      selectedAnswer: answer,
    );
  }

  void reset() {
    state = state.copyWith(
      score: 0,
      currentQuestionIndex: 0,
      selectedAnswer: null,
    );
  }
}
