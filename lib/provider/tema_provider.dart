import 'package:flutter/material.dart';

class TemaProvider extends ChangeNotifier {
  ThemeMode _modoTema = ThemeMode.light;

  ThemeMode get modoTema => _modoTema;

  bool get esModoOscuro => _modoTema == ThemeMode.dark;

  void cambiarTema() {
    _modoTema = _modoTema == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
