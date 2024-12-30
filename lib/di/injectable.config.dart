// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../quiz/bloc/quiz_bloc.dart' as _i0;
import '../quiz/repository/quiz_repository.dart' as _i684;

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
    gh.singleton<_i684.QuizRepository>(() => _i684.QuizRepository());
    gh.factory<_i0.QuizBloc>(() => _i0.QuizBloc(gh<_i684.QuizRepository>()));
    return this;
  }
}
