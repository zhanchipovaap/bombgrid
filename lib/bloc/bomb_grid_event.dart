part of 'bomb_grid_bloc.dart';

@immutable
abstract class BombGridEvent {}

class BombGridInitialEvent extends BombGridEvent {}

class BombGridSpinCellEvent extends BombGridEvent {
  List<int> cell;
  BombGridSpinCellEvent(this.cell);
}

class BombGridBombExplodeEvent extends BombGridEvent {}

class BombGridUndoLastMoveEvent extends BombGridEvent {}

class BombGridReplayEvent extends BombGridEvent {}