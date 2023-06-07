import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bomb_grid_bloc.dart';

class BombGridScreen extends StatelessWidget {
  const BombGridScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BombGridBloc, BombGridState>(
        builder: (context, state) {
          if (state is BombGridInitialState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {context
                        .read<BombGridBloc>()
                        .add(BombGridInitialEvent());},
                  child: const Text("Новая игра"),
                ),
                TextButton(
                  onPressed: () {context
                        .read<BombGridBloc>()
                        .add(BombGridSpinCellEvent(const [1,1]));},
                  child: const Text("перевернуть ячейку"),
                ),
              ],
            );
          }
          if (state is BombGridInGameState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {context
                        .read<BombGridBloc>()
                        .add(BombGridSpinCellEvent(const [1,1]));},
                  child: const Text("перевернуть ячейку"),
                ),
              ],
            );
          } 
          if (state is BombGridInvertedCellState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("количество мин "+ state.value.toString()),
                TextButton(
                  onPressed: () {context
                        .read<BombGridBloc>()
                        .add(BombGridSpinCellEvent([Random().nextInt(10),Random().nextInt(10)]));},
                  child: const Text("перевернуть ячейку"),
                ),
              ],
            );
          } 
          if (state is BombGridEndGameState) {
            return Text("KABOOM");
          }
          else {
            return Container();
          }
        },
      ),
    );
  }
}
