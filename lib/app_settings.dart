
import 'package:shared_preferences/shared_preferences.dart';

class AppSettings {
  int gridW;
  int gridH;
  int boomb;

  AppSettings({
    required this.gridW,
    required this.gridH,
    required this.boomb,
  });

  init() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('gridW', gridW);
    prefs.setInt('gridH', gridH);
    prefs.setInt('boomb', boomb);
  }
}