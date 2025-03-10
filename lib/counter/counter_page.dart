import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/counter/counter_cubit.dart';
import 'package:hello_world/counter/counter_view.dart';
import 'package:hello_world/di/injectable.dart';

class CounterPage extends StatelessWidget {
  const CounterPage._();

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const CounterPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<CounterCubit>(),
      child: const CounterView(),
    );
  }
}
