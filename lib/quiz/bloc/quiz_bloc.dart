import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/quiz/model/question.dart';
import 'package:hello_world/quiz/bloc/quiz_event.dart';
import 'package:hello_world/quiz/bloc/quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizQuestion(questions.first)) {
    on<QuestionAnswered>(_onQuestionAnswered);
    on<QuizReset>(_onQuizReset);
  }

  Map<Question, bool> answeredQuestions = Map();

  void _onQuestionAnswered(QuestionAnswered event, Emitter<QuizState> emit) {
    Question quizQuestion = (state as QuizQuestion).currentQuestion;
    answeredQuestions[quizQuestion] =
        (event.answer == quizQuestion.correctAnswer);
    emit(
      answeredQuestions.length == questions.length
          ? QuizResult(_buildQuizResult(), answeredQuestions)
          : QuizQuestion(
              questions[answeredQuestions.length]..answers.shuffle(),
            ),
    );
  }

  void _onQuizReset(QuizReset event, Emitter<QuizState> emit) {
    answeredQuestions = Map();
    emit(QuizQuestion(questions.first));
  }

  String _buildQuizResult() {
    int correctAnswers =
        answeredQuestions.values.where((answer) => answer).length;
    return 'You got $correctAnswers out of ${questions.length} questions' +
        ' correctly!';
  }
}
