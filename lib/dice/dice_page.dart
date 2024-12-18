import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/dice/dice_cubit.dart';
import 'package:hello_world/dice/dice_view.dart';

class DicePage extends StatelessWidget {
  const DicePage._();

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const DicePage._());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => DiceCubit(), child: const DiceView());
  }
}
