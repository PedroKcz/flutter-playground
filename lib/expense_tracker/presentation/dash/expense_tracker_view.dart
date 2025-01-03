import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/expense_tracker/presentation/create/create_expense_modal.dart';
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
              return CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      child: Center(child: Text('Chart')),
                      height: 200,
                    ),
                  ),
                  state.expenses.isEmpty
                      ? SliverToBoxAdapter(
                          child: Column(
                            spacing: 16,
                            children: [
                              const Text('No expenses found, try adding one'),
                              OutlinedButton(
                                onPressed: () =>
                                    CreateExpenseModal().showAsModal(context),
                                child: const Text('Add expense'),
                              ),
                            ],
                          ),
                        )
                      : const SliverAppBar(
                          pinned: true,
                          automaticallyImplyLeading: false,
                          flexibleSpace: FlexibleSpaceBar(
                            title: const Text('Expenses'),
                            titlePadding: EdgeInsets.all(16),
                            centerTitle: false,
                          ),
                        ),
                  SliverList.separated(
                    itemCount: state.expenses.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemBuilder: (_, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Dismissible(
                        key: ValueKey(index),
                        onDismissed: (_) => context
                            .read<ExpenseTrackerBloc>()
                            .add(DeleteExpense(state.expenses[index].id)),
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
        onPressed: () => CreateExpenseModal().showAsModal(context),
      ),
    );
  }
}
