import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/di/injectable.dart';
import 'package:hello_world/expense_tracker/presentation/create/bloc/create_expense_bloc.dart';
import 'package:hello_world/expense_tracker/presentation/create/bloc/create_expense_event.dart';
import 'package:hello_world/expense_tracker/presentation/create/bloc/create_expense_state.dart';

class CreateExpenseModal extends StatelessWidget {
  CreateExpenseModal({super.key});

  void showAsModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (_) => CreateExpenseModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<CreateExpenseBloc>(),
      child: BlocBuilder<CreateExpenseBloc, CreateExpenseState>(
        builder: (context, state) {
          if (state.isExpenseSaved) Navigator.pop(context);
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                const Text('Add expense'),
                TextField(
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                  onChanged: (value) => context
                      .read<CreateExpenseBloc>()
                      .add(TitleUpdated(title: value)),
                ),
                TextField(
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    labelText: 'Amount',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => context
                      .read<CreateExpenseBloc>()
                      .add(const AmountUpdated(amount: 12.11)),
                ),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButton(
                        items: List.empty(),
                        onChanged: (_) => {},
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: OutlinedButton.icon(
                        label: const Text('Select date'),
                        icon: const Icon(Icons.calendar_month),
                        onPressed: () => {},
                      ),
                    ),
                  ],
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: state.isSubmitButtonEnabled
                        ? () => context
                            .read<CreateExpenseBloc>()
                            .add(const Submit())
                        : null,
                    child: state.isLoading
                        ? const CircularProgressIndicator.adaptive()
                        : const Text('Submit'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
