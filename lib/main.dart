import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'bloc/bomb_grid_bloc.dart';
import 'bomb_grid_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BombGridBloc bombgrid = BombGridBloc();
    return MultiProvider(
      providers: [
        Provider<BombGridBloc>.value(value: bombgrid),
      ],
      child: const MaterialApp(
        home: BombGridScreen(),
      ),
    );
  }
}
