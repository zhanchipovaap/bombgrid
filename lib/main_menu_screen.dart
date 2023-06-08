import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: const Text("Добро пожаловать в игру"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {}, child: const Text("Начать игру")),
          ElevatedButton(onPressed: () {}, child: const Text("Настройки")),
        ],
      )
    );
  }
}