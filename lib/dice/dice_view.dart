import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/dice/dice_cubit.dart';

class DiceView extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<DiceView> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _currentValue = 1;
  int _animatedValue = 1;
  static const double diceRadius = 8;

  final positions = const [
    Offset(0.5, 0.5), // Center
    Offset(0.2, 0.2), // Top-left
    Offset(0.8, 0.8), // Bottom-right
    Offset(0.8, 0.2), // Top-right
    Offset(0.2, 0.8), // Bottom-left
    Offset(0.2, 0.5), // Left-center
    Offset(0.8, 0.5), // Right-center
  ];

  final activeDots = const {
    1: [0],
    2: [1, 2],
    3: [0, 1, 2],
    4: [1, 2, 3, 4],
    5: [0, 1, 2, 3, 4],
    6: [1, 2, 3, 4, 5, 6],
  };

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reset();
        }
      });

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut)
      ..addListener(() {
        if ((_animation.value * 100).truncate().remainder(20) == 0) {
          _animatedValue = activeDots.keys.elementAt(
            new Random().nextInt(activeDots.length),
          );
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dice')),
      body: Center(
        child: BlocBuilder<DiceCubit, int?>(
          builder: (context, state) {
            if (state != null) _currentValue = state;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _animation.value * 2 * pi,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(diceRadius),
                          boxShadow: const [
                            BoxShadow(color: Colors.black26, blurRadius: 42),
                          ],
                        ),
                        child: _buildDiceFace(
                          _animation.isAnimating
                              ? _animatedValue
                              : _currentValue,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    context.read<DiceCubit>().roll();
                    _controller.forward();
                  },
                  child: const Text('Roll Dice'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildDiceFace(int value) {
    return Center(
      child: SizedBox(
        height: 100,
        width: 100,
        child: Stack(
          children: activeDots[value]!.map((index) {
            final position = positions[index];
            return Positioned(
              top: position.dy * 100 - diceRadius,
              left: position.dx * 100 - diceRadius,
              child: const CircleAvatar(
                radius: diceRadius,
                backgroundColor: Colors.black,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
