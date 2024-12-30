import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/expense_tracker/bloc/expense_tracker_event.dart';
import 'package:hello_world/expense_tracker/bloc/expense_tracker_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExpenseTrackerBloc
    extends Bloc<ExpenseTrackerEvent, ExpenseTrackerState> {
  ExpenseTrackerBloc() : super(LoadingState());
}
