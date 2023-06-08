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
                  onPressed: () {
                    context.read<BombGridBloc>().add(BombGridInitialEvent());
                  },
                  child: const Text("Новая игра"),
                ),
                TextButton(
                  onPressed: () {
                    context
                        .read<BombGridBloc>()
                        .add(BombGridSpinCellEvent(const [1, 1]));
                  },
                  child: const Text("перевернуть ячейку"),
                ),
              ],
            );
          }
          if (state is BombGridInGameState) {
            return GridView.count(crossAxisCount: 5, children: <Widget>[
              for (var i = 0; i < state.grid.length; i++)
                for (var j = 0; j < state.grid[0].length; j++)
                  TextButton(
                    onPressed: () {
                      context
                          .read<BombGridBloc>()
                          .add(BombGridSpinCellEvent([i, j]));
                    },
                    child: Text(state.grid[i][j].index.toString()),
                  ),
            ]);
          }
          if (state is BombGridInvertedCellState) {
            return GridView.count(crossAxisCount: 5, children: <Widget>[
              for (var i = 0; i < state.grid.length; i++)
                for (var j = 0; j < state.grid[0].length; j++)
                  TextButton(
                    onPressed: () {
                      context
                          .read<BombGridBloc>()
                          .add(BombGridSpinCellEvent([i, j]));
                    },
                    child: Text(state.grid[i][j].index.toString()),
                  ),
            ]);
          }
          if (state is BombGridEndGameState) {
            return Text("KABOOM");
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
