// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:hello_world/counter/counter_cubit.dart' as _i629;
import 'package:hello_world/di/register_module.dart' as _i876;
import 'package:hello_world/dice/dice_cubit.dart' as _i84;
import 'package:hello_world/expense_tracker/data/repository/expenses_repository_impl.dart'
    as _i323;
import 'package:hello_world/expense_tracker/domain/expenses_repository.dart'
    as _i906;
import 'package:hello_world/expense_tracker/presentation/dash/bloc/expense_tracker_bloc.dart'
    as _i215;
import 'package:hello_world/quiz/bloc/quiz_bloc.dart' as _i881;
import 'package:hello_world/quiz/repository/quiz_repository.dart' as _i847;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

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
    final registerModule = _$RegisterModule();
    gh.factory<_i84.DiceCubit>(() => _i84.DiceCubit());
    gh.factory<_i629.CounterCubit>(() => _i629.CounterCubit());
    gh.factory<_i215.ExpenseTrackerBloc>(() => _i215.ExpenseTrackerBloc());
    gh.factoryAsync<_i460.SharedPreferences>(() => registerModule.prefs);
    gh.singleton<_i847.QuizRepository>(() => _i847.QuizRepository());
    gh.singletonAsync<_i906.ExpensesRepository>(() async =>
        _i323.ExpensesRepositoryImpl(
            prefs: await getAsync<_i460.SharedPreferences>()));
    gh.factory<_i881.QuizBloc>(
        () => _i881.QuizBloc(gh<_i847.QuizRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i876.RegisterModule {}
