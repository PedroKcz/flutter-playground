// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:hello_world/counter/counter_cubit.dart' as _i629;
import 'package:hello_world/dice/dice_cubit.dart' as _i84;
import 'package:hello_world/expense_tracker/bloc/expense_tracker_bloc.dart'
    as _i911;
import 'package:hello_world/quiz/bloc/quiz_bloc.dart' as _i881;
import 'package:hello_world/quiz/repository/quiz_repository.dart' as _i847;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i84.DiceCubit>(() => _i84.DiceCubit());
    gh.factory<_i629.CounterCubit>(() => _i629.CounterCubit());
    gh.factory<_i911.ExpenseTrackerBloc>(() => _i911.ExpenseTrackerBloc());
    gh.singleton<_i847.QuizRepository>(() => _i847.QuizRepository());
    gh.factory<_i881.QuizBloc>(
        () => _i881.QuizBloc(gh<_i847.QuizRepository>()));
    return this;
  }
}
