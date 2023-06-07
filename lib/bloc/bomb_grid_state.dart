part of 'bomb_grid_bloc.dart';

@immutable
abstract class BombGridState {}

class BombGridInitialState extends BombGridState {
}

class BombGridInGameState extends BombGridState {
  List<List<int>> mines;
  BombGridInGameState(this.mines);
}

class BombGridInvertedCellState extends BombGridState {
  int value;
  BombGridInvertedCellState(this.value);
}

class BombGridEndGameState extends BombGridState {}

class BombGridContinuedState extends BombGridState {}
