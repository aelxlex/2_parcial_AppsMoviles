import 'package:flutter/material.dart';
import 'screens/convertidor_bases_screen.dart';
import 'screens/convertidor_monedas_screen.dart';
import 'screens/verificador_primos_screen.dart';
import 'screens/cambiador_tema_screen.dart';
import 'provider/tema_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TemaProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final temaProvider = Provider.of<TemaProvider>(context);
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: temaProvider.modoTema,
      home: const BarraNavegacion(),
    );
  }
}

class BarraNavegacion extends StatefulWidget {
  const BarraNavegacion({super.key});

  @override
  _BarraNavegacionState createState() => _BarraNavegacionState();
}

class _BarraNavegacionState extends State<BarraNavegacion> {
  int _indiceActual = 0;

  //Barra de Navegacin
  final List<Widget> _pantallas = [
    ConvertidorBasesScreen(),
    ConvertidorMonedasScreen(),
    VerificadorPrimosScreen(),
    CambiadorTemaScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pantallas[_indiceActual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceActual,
        onTap: (indice) {
          setState(() {
            _indiceActual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Bases',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Monedas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.numbers),
            label: 'Primos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.color_lens),
            label: 'Tema',
          ),
        ],
      ),
    );
  }
}
