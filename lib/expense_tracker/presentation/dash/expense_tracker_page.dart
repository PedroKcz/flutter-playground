import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/di/injectable.dart';
import 'package:hello_world/expense_tracker/presentation/dash/bloc/expense_tracker_bloc.dart';
import 'package:hello_world/expense_tracker/presentation/dash/expense_tracker_view.dart';

class ExpenseTrackerPage extends StatelessWidget {
  const ExpenseTrackerPage._();

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ExpenseTrackerPage._());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<ExpenseTrackerBloc>(),
      child: const ExpenseTrackerView(),
    );
  }
}
