import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/observer/hello_world_bloc_observer.dart';
import 'package:hello_world/home/home_page.dart';

void main() {
  Bloc.observer = const HelloWorldBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
