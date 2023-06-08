import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

enum SettingsMode { noob, mid, pro, custom}

class _SettingsScreenState extends State<SettingsScreen> {
  SettingsMode? _mode = SettingsMode.noob;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Настройки")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Text("Выберите сложность игры"),
          ListTile(
          title: const Text('Новичок'),
          leading: Radio<SettingsMode>(
            value: SettingsMode.noob,
            groupValue: _mode,
            onChanged: (SettingsMode? value) {
              setState(() {
                _mode = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Любитель'),
          leading: Radio<SettingsMode>(
            value: SettingsMode.mid,
            groupValue: _mode,
            onChanged: (SettingsMode? value) {
              setState(() {
                _mode = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Професиионал'),
          leading: Radio<SettingsMode>(
            value: SettingsMode.pro,
            groupValue: _mode,
            onChanged: (SettingsMode? value) {
              setState(() {
                _mode = value;
              });
            },
          ),
        ),
        ]
      ),);
  }
}