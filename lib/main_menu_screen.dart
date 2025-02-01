import 'package:bomb/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'bloc/bomb_grid_bloc.dart';
import 'bomb_grid_screen.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BombGridBloc bombgrid = BombGridBloc(16, 16, 8);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Добро пожаловать в игру"),
      ),
      body: MultiProvider(
        providers: [
          Provider<BombGridBloc>.value(value: bombgrid),
        ],
        child: MaterialApp(
          home: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 140,
                height: 38,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        bombgrid.add(BombGridInitialEvent());
                        return BlocProvider<BombGridBloc>.value(
                            value: bombgrid, child: const BombGridScreen());
                      }));
                    },
                    child: const Text("Начать игру")),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 140,
                height: 38,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingsScreen()));
                    },
                    child: const Text("Настройки")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
