import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part '../bomb_grid_event.dart';
part '../bomb_grid_state.dart';

class BombGridBloc extends Bloc<BombGridEvent, BombGridState> {
  BombGridBloc() : super(BombGridInitial()) {
    on<BombGridEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
