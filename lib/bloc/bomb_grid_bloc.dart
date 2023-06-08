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

    List<List<Cell>> grid=[];
    int gridW = 5;
    int gridH = 5;
    int numMines = 4;

  _doInitial(BombGridInitialEvent event, Emitter emit) {
    int index = 0;
    for(var i =0; i<gridH; i++){
      List<Cell> row = [];
      for(var j =0; j<gridW; j++){
        index ++;
        row.add(Cell(index: index, isBomb: false, isOpen: false));
      }
      grid.add(row);
    }
    //TODO добавить какую то проверку на количество мин, одинак знач

    //add mines
    for(var i=0; i<numMines; i++){
      grid[Random().nextInt(gridH)][Random().nextInt(gridW)].isBomb = true;
    }
    emit(BombGridInGameState(grid));
  }
  bool outBounds(int x,int y, int gridW, int gridH){
    return x<0||y<0||x>=gridW||y>=gridH;
  }

  int calcNear(int x, int y, int gridW, int gridH) {
    if(outBounds(x,y,gridW,gridH))return 0;
    int i=0;
    for (int offsetX=-1; offsetX<=1; offsetX++) {
      for (int offsetY=-1; offsetY<=1; offsetY++) {
        if(!outBounds(offsetX+x,offsetY+y,gridW,gridH)){
          if(grid[offsetX+x][offsetY+y].isBomb){
            i++;
          }
        }
        
      }
    }
    return i;
  }

  _spinIt(BombGridSpinCellEvent event, Emitter emit) {
    List<int> cell = event.cell;

    if(grid[cell[0]][cell[1]].isBomb == true){
      // emit(BombGridEndGameState());
      grid[cell[0]][cell[1]].index = -1;
    }else{
      int value = calcNear(cell[0], cell[1], gridW, gridH) ;
      grid[cell[0]][cell[1]].index = value;

      emit(BombGridInGameState(grid));
    }
  }

  _explodeIt(BombGridBombExplodeEvent event, Emitter emit) {}

  _updoIt(BombGridUndoLastMoveEvent event, Emitter emit) {}

  _replayIt(BombGridReplayEvent event, Emitter emit) {}

}
