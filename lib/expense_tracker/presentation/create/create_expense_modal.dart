import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/di/injectable.dart';
import 'package:hello_world/expense_tracker/domain/model/expense_category.dart';
import 'package:hello_world/expense_tracker/presentation/create/bloc/create_expense_bloc.dart';
import 'package:hello_world/expense_tracker/presentation/create/bloc/create_expense_event.dart';
import 'package:hello_world/expense_tracker/presentation/create/bloc/create_expense_state.dart';
import 'package:hello_world/expense_tracker/presentation/dash/widget/expense_extension.dart';
import 'package:hello_world/extensions/string_extensions.dart';

class CreateExpenseModal extends StatelessWidget {
  CreateExpenseModal({super.key});

  void showAsModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (ctx) => PopScope(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: CreateExpenseModal(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<CreateExpenseBloc>(),
      child: BlocBuilder<CreateExpenseBloc, CreateExpenseState>(
        builder: (context, state) {
          if (state.isExpenseSaved) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.pop(context);
            });
          }
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                const Text('Add expense'),
                Row(
                  spacing: 16,
                  children: [
                    Expanded(
                      child: TextField(
                        autofocus: true,
                        maxLength: 50,
                        decoration: const InputDecoration(
                          labelText: 'Title',
                        ),
                        onChanged: (value) => context
                            .read<CreateExpenseBloc>()
                            .add(TitleUpdated(title: value)),
                      ),
                    ),
                    DropdownButton(
                      value: state.expense.category,
                      items: ExpenseCategory.values
                          .map(
                            (category) => DropdownMenuItem(
                              child: Text(category.name.capitalize),
                              value: category,
                            ),
                          )
                          .toList(),
                      onChanged: (category) => category != null
                          ? context
                              .read<CreateExpenseBloc>()
                              .add(CategorySelected(category: category))
                          : null,
                    ),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(
                    prefixText: '\$ ',
                    labelText: 'Amount',
                    errorText:
                        state.showError ? 'Please enter a valid amount' : null,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
                  ],
                  onChanged: (value) => context
                      .read<CreateExpenseBloc>()
                      .add(AmountUpdated(amount: value)),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(state.expense.formattedDate),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton.icon(
                            label: const Text('Change date'),
                            icon: const Icon(Icons.calendar_month),
                            onPressed: () {
                              final DateTime now = DateTime.now();
                              showDatePicker(
                                context: context,
                                firstDate: DateTime(now.year - 5),
                                initialDate: state.expense.date,
                                lastDate: now,
                              ).then(
                                (value) => value != null
                                    ? context
                                        .read<CreateExpenseBloc>()
                                        .add(DateSelected(date: value))
                                    : null,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Center(
                  child: OutlinedButton(
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
