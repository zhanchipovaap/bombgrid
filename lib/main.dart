import 'package:flutter/material.dart';

import 'end_game_screen.dart';
import 'main_menu_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: MainMenuScreen(),//EndGameScreen(),//
      );
  }
}
