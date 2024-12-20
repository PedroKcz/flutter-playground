import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/quiz/quiz_cubic.dart';
import 'package:hello_world/quiz/quiz_view.dart';

class QuizPage extends StatelessWidget {
  const QuizPage._();

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => const QuizPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QuizCubic(),
      child: const QuizView(),
    );
  }
}
