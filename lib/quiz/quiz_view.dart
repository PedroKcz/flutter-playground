import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/quiz/bloc/quiz_bloc.dart';
import 'package:hello_world/quiz/bloc/quiz_event.dart';
import 'package:hello_world/quiz/bloc/quiz_state.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz')),
      body: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: switch (state) {
                QuizQuestion() => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 8,
                    children: [
                      Text(
                        state.currentQuestion.title,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      ...state.currentQuestion.answers.map(
                        (question) => ElevatedButton(
                          key: Key(state.currentQuestion.title + question),
                          onPressed: () => context
                              .read<QuizBloc>()
                              .add(QuestionAnswered(question)),
                          child: Text(question),
                        ),
                      ),
                    ],
                  ),
                QuizResult() => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 16,
                    children: [
                      Text(state.summary),
                      ...state.questions.entries.map((answer) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8,
                          children: [
                            answer.value == true
                                ? const Icon(
                                    Icons.check_circle_rounded,
                                    color: Colors.teal,
                                  )
                                : const Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 8,
                                children: [
                                  Text('Question: ${answer.key.title}'),
                                  Text(
                                    'Correct answer: ' +
                                        answer.key.correctAnswer,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                      OutlinedButton.icon(
                        key: const Key('retake-quiz'),
                        onPressed: () =>
                            context.read<QuizBloc>().add(const QuizReset()),
                        label: const Text('Retake quiz'),
                        icon: const Icon(Icons.refresh),
                      ),
                    ],
                  ),
              },
            ),
          );
        },
      ),
    );
  }
}
