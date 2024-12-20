sealed class QuizEvent {
  const QuizEvent();
}

final class QuestionAnswered extends QuizEvent {
  const QuestionAnswered(this.answer);

  final String answer;
}

final class QuizReset extends QuizEvent {
  const QuizReset();
}
