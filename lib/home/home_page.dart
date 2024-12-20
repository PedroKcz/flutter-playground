import 'package:flutter/material.dart';
import 'package:hello_world/counter/counter_page.dart';
import 'package:hello_world/dice/dice_page.dart';
import 'package:hello_world/quiz/quiz_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text('Hello World'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).push<void>(
                CounterPage.route(),
              ),
              child: Text('Counter', style: textTheme.labelLarge),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push<void>(
                DicePage.route(),
              ),
              child: Text('Dice', style: textTheme.labelLarge),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push<void>(
                QuizPage.route(),
              ),
              child: Text('Quiz', style: textTheme.labelLarge),
            ),
          ],
        ),
      ),
    );
  }
}
