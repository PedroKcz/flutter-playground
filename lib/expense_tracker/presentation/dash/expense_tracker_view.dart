import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/expense_tracker/presentation/dash/bloc/expense_tracker_bloc.dart';
import 'package:hello_world/expense_tracker/presentation/dash/bloc/expense_tracker_event.dart';
import 'package:hello_world/expense_tracker/presentation/dash/bloc/expense_tracker_state.dart';
import 'package:hello_world/expense_tracker/presentation/dash/widget/expense_item.dart';

class ExpenseTrackerView extends StatelessWidget {
  const ExpenseTrackerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expense Tracker')),
      body: BlocBuilder<ExpenseTrackerBloc, ExpenseTrackerState>(
        builder: (context, state) {
          switch (state) {
            case LoadingState():
              return const Center(child: CircularProgressIndicator.adaptive());
            case ExpensesState():
              return Column(
                children: [
                  const Text('Chart'),
                  Expanded(
                    child: ListView.separated(
                      itemCount: state.expenses.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 8),
                      itemBuilder: (_, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ExpenseItem(state.expenses[index]),
                      ),
                    ),
                  ),
                ],
              );
            case ErrorState():
              return Center(
                child: Column(
                  children: [
                    const Text(
                      'Error while getting the expenses, please try again',
                    ),
                    OutlinedButton(
                      onPressed: () => context
                          .read<ExpenseTrackerBloc>()
                          .add(const FindExpense()),
                      child: const Text('Try again'),
                    ),
                  ],
                ),
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: const Key('add_expense'),
        child: const Icon(Icons.add),
        onPressed: () => {},
      ),
    );
  }
}
