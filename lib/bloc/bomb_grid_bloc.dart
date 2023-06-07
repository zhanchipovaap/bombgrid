import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bomb/mines.dart';
import 'package:meta/meta.dart';

part 'bomb_grid_event.dart';
part 'bomb_grid_state.dart';

class BombGridBloc extends Bloc<BombGridEvent, BombGridState> {
  BombGridBloc() : super(BombGridInitialState()) {
    on<BombGridEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<BombGridInitialEvent>(_doInitial);
    on<BombGridSpinCellEvent>(_spinIt);
    on<BombGridBombExplodeEvent>(_explodeIt);
    on<BombGridUndoLastMoveEvent>(_updoIt);
    on<BombGridReplayEvent>(_replayIt);
  }

  List<List<int>> mines=[];
  _doInitial(BombGridInitialEvent event, Emitter emit) {
    int gridW = 10;
    int gridH = 10;
    int numMines = 8;

    for(var i =0; i<gridH; i++){
      List<int> row = [];
      for(var j =0; j<gridW; j++){
        row.add(0);
      }
      mines.add(row);
    }
    //TODO добавить какую то проверку на количество мин, одинак знач

    //add mines
    for(var i=0; i<numMines; i++){
      mines[Random().nextInt(gridH)][Random().nextInt(gridW)] = 1;
    }
    emit(BombGridInGameState(mines));
  }
  bool outBounds(int x,int y, int gridW, int gridH){
    return x<0||y<0||x>=gridW||y>=gridH;
  }

  int calcNear(int x, int y) {
    if(outBounds(x,y,10,10))return 0;
    int i=0;
    for (int offsetX=-1; offsetX<=1; offsetX++) {
      for (int offsetY=-1; offsetY<=1; offsetY++) {
        if(outBounds(offsetX+x,offsetY+y,10,10))return 0;
        i+=mines[offsetX+x][offsetY+y];
      }
    }
    return i;
  }

  _spinIt(BombGridSpinCellEvent event, Emitter emit) {
    List<int> cell = event.cell;

    if(mines[cell[1]][cell[0]] == 1){
      emit(BombGridEndGameState());
    }else{
      int value = calcNear(cell[1], cell[0]) ;
      emit(BombGridInvertedCellState(value));
    }
  }

  _explodeIt(BombGridBombExplodeEvent event, Emitter emit) {}

  _updoIt(BombGridUndoLastMoveEvent event, Emitter emit) {}

  _replayIt(BombGridReplayEvent event, Emitter emit) {}

}
