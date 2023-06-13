import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bomb_grid_bloc.dart';

class BombGridScreen extends StatelessWidget {
  const BombGridScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Игровое поле'),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            BlocBuilder<BombGridBloc, BombGridState>(
              builder: (context, state) {
                if (state is BombGridInitialState) {
                  //TODO тут что-то надо придумать иначе кринж
                  int gridW = 10;
                  int gridH = 10;

                  return GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(10),
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    crossAxisCount: gridW,
                    shrinkWrap: true,
                    children: <Widget>[
                      for (var i = 0; i < gridH; i++)
                        for (var j = 0; j < gridW; j++)
                          TextButton(
                            onPressed: () {
                              context
                                  .read<BombGridBloc>()
                                  .add(BombGridSpinCellEvent([i, j]));
                            },
                            child: const Text("_"),
                          ),
                    ],
                  );
                }
                if (state is BombGridInGameState) {
                  return GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(10),
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    crossAxisCount: state.grid.length,
                    shrinkWrap: true,
                    children: <Widget>[
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
                    ],
                  );
                }
                if (state is BombGridEndGameState) {
                  return Text("KABOOM");
                } else {
                  return Container();
                }
              },
            ),
            const SizedBox(
              height: 150,
            ),
          ],
        ));
  }
}
