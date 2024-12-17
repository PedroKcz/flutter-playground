import 'package:flutter/material.dart';
import 'package:hello_world/counter/counter_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).push<void>(
                CounterPage.route(),
              ),
              child: const Text('Counter'),
            ),
          ],
        ),
      ),
    );
  }
}
