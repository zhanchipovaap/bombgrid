part of 'bomb_grid_bloc.dart';

@immutable
abstract class BombGridState {}

class BombGridInitialState extends BombGridState {
}

class BombGridInGameState extends BombGridState {
  List<List<Cell>> grid;
  BombGridInGameState(this.grid);
}

class BombGridInvertedCellState extends BombGridState {
  int value;
  List<List<Cell>> grid;
  BombGridInvertedCellState(this.value, this.grid);
}

class BombGridEndGameState extends BombGridState {}

class BombGridContinuedState extends BombGridState {}
