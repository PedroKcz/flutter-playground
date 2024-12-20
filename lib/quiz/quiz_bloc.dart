import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/quiz/question.dart';
import 'package:hello_world/quiz/quiz_event.dart';
import 'package:hello_world/quiz/quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizQuestion(questions.first)) {
    on<QuestionAnswered>(_onQuestionAnswered);
    on<QuizReset>(_onQuizReset);
  }

  List<Question> answeredQuestions = [];

  void _onQuestionAnswered(QuestionAnswered event, Emitter<QuizState> emit) {
    Question quizQuestion = (state as QuizQuestion).currentQuestion;
    answeredQuestions.add(
      quizQuestion
        ..hasGuessedCorrectly = (event.answer ==
            quizQuestion.answers[quizQuestion.correctAnswerIndex]),
    );
    emit(
      answeredQuestions.length == questions.length
          ? QuizResult(_buildQuizResult(), answeredQuestions)
          : QuizQuestion(questions[answeredQuestions.length - 1]),
    );
  }

  void _onQuizReset(QuizReset event, Emitter<QuizState> emit) {
    answeredQuestions = [];
    emit(QuizQuestion(questions.first));
  }

  String _buildQuizResult() {
    int correctAnswers = answeredQuestions
        .where((question) => question.hasGuessedCorrectly == true)
        .length;
    return 'You got $correctAnswers out of ${questions.length} questions' +
        ' correctly!';
  }
}
