class Question {
  Question({
    required this.title,
    required this.answers,
    required this.correctAnswerIndex,
  });

  final String title;
  final List<String> answers;
  final int correctAnswerIndex;
  bool? hasGuessedCorrectly;
}

final List<Question> questions = [
  Question(title: 'a?', answers: ['a', 'b'], correctAnswerIndex: 0),
];
