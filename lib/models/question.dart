class Question {
  final int id;
  final String text;
  final List<String> options;
  final int correctAnswer;
  final String category;

  Question({
    required this.id,
    required this.text,
    required this.options,
    required this.correctAnswer,
    required this.category,
  });
}
