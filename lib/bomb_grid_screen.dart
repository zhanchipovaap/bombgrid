import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bomb_grid_bloc.dart';

class BombGridScreen extends StatelessWidget {
  const BombGridScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int gridW = 16;
    int gridH = 16;

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
                return GridView.extent(
                  maxCrossAxisExtent: 150,
                  primary: false,
                  padding: const EdgeInsets.all(10),
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  // crossAxisCount: gridW,
                  shrinkWrap: true,
                  children: <Widget>[
                    for (var i = 0; i < gridH; i++)
                      for (var j = 0; j < gridW; j++)
                        ElevatedButton(
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
                  crossAxisCount: gridW,
                  shrinkWrap: true,
                  children: <Widget>[
                    for (var i = 0; i < state.grid.length; i++)
                      for (var j = 0; j < state.grid[0].length; j++)
                        ElevatedButton(
                          onPressed: () {
                            context
                                .read<BombGridBloc>()
                                .add(BombGridSpinCellEvent([i, j]));
                          },
                          child: Text(state.grid[i][j].index == -2
                              ? ""
                              : state.grid[i][j].index.toString()),
                        ),
                  ],
                );
              }
              if (state is BombGridEndGameState) {
                return SimpleDialog(
                  title: const Text('KABOOM!!!'),
                  children: <Widget>[
                    const ListTile(title: Text("Игра окончена")),
                    Row(children: <Widget>[
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 140,
                        height: 38,
                        child: ElevatedButton(
                          onPressed: () {
                            context
                                .read<BombGridBloc>()
                                .add(BombGridInitialEvent());
                          },
                          child: const Text("Новая игра"),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 140,
                        height: 38,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Выйти"),
                        ),
                      ),
                    ]),
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
          const SizedBox(
            height: 150,
          ),
        ],
      ),
    );
  }
}
