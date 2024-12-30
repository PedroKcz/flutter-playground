import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_world/quiz/bloc/quiz_bloc.dart';
import 'package:hello_world/quiz/bloc/quiz_event.dart';
import 'package:hello_world/quiz/bloc/quiz_state.dart';
import 'package:hello_world/quiz/model/question.dart';
import 'package:hello_world/quiz/repository/quiz_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockQuizRepository extends Mock implements QuizRepository {}

void main() {
  late QuizBloc bloc;
  List<Question> questions = [
    Question(title: '1', answers: ['1'], correctAnswer: '1'),
    Question(title: '2', answers: ['2'], correctAnswer: '2'),
  ];

  group('Quiz Bloc Test', () {
    setUp(() async {
      QuizRepository quizRepository = MockQuizRepository();
      when(() => quizRepository.getQuestions()).thenReturn(questions);
      bloc = QuizBloc(quizRepository);
    });

    test('should load initial question', () {
      expect(bloc.state, QuizQuestion(questions.first));
    });

    blocTest<QuizBloc, QuizState>(
      'should display next question when QuestionAnswered is sent',
      build: () => bloc,
      act: (bloc) => bloc.add(const QuestionAnswered('1')),
      expect: () => [QuizQuestion(questions[1])],
    );

    blocTest<QuizBloc, QuizState>(
      'should display result once all questions are answered',
      build: () => bloc,
      act: (bloc) => {
        bloc.add(const QuestionAnswered('1')),
        bloc.add(const QuestionAnswered('1')),
        bloc.add(const QuizReset()),
      },
      expect: () => [
        QuizQuestion(questions[1]),
        QuizResult(
          'You got 1 out of 2 questions correctly!',
          Map()
            ..[questions.first] = true
            ..[questions[1]] = false,
        ),
        QuizQuestion(questions[0]),
      ],
    );
  });
}
