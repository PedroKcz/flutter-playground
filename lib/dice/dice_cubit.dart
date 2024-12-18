import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiceCubit extends Cubit<int?> {
  DiceCubit() : super(null);

  void roll() => emit(Random().nextInt(6) + 1);
}
