import 'package:flutter/material.dart';
import 'package:hello_world/counter/counter_page.dart';
import 'package:hello_world/dice/dice_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).push<void>(
                CounterPage.route(),
              ),
              child: Text('Counter', style: textTheme.labelLarge),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push<void>(
                DicePage.route(),
              ),
              child: Text('Dice', style: textTheme.labelLarge),
            ),
          ],
        ),
      ),
    );
  }
}
