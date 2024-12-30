import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/quiz/model/question.dart';
import 'package:hello_world/quiz/bloc/quiz_event.dart';
import 'package:hello_world/quiz/bloc/quiz_state.dart';
import 'package:hello_world/quiz/repository/quiz_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc(this._quizRepository)
      : super(QuizQuestion(_quizRepository.getQuestions().first)) {
    on<QuestionAnswered>(_onQuestionAnswered);
    on<QuizReset>(_onQuizReset);
    _questions = _quizRepository.getQuestions();
  }

  final QuizRepository _quizRepository;
  List<Question> _questions = List.empty();
  Map<Question, bool> _answeredQuestions = Map();

  void _onQuestionAnswered(QuestionAnswered event, Emitter<QuizState> emit) {
    Question quizQuestion = (state as QuizQuestion).currentQuestion;
    _answeredQuestions[quizQuestion] =
        (event.answer == quizQuestion.correctAnswer);
    emit(
      _answeredQuestions.length == _questions.length
          ? QuizResult(_buildQuizResult(), _answeredQuestions)
          : QuizQuestion(
              _questions[_answeredQuestions.length]..answers.shuffle(),
            ),
    );
  }

  void _onQuizReset(QuizReset event, Emitter<QuizState> emit) {
    _answeredQuestions = Map();
    emit(QuizQuestion(_questions.first));
  }

  String _buildQuizResult() {
    int correctAnswers =
        _answeredQuestions.values.where((answer) => answer).length;
    return 'You got $correctAnswers out of ${_questions.length} questions' +
        ' correctly!';
  }
}
