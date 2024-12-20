import 'package:flutter/material.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz')),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('?'),
        ],
      ),
    );
  }
}
