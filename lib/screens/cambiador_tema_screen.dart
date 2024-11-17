import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/tema_provider.dart';

class CambiadorTemaScreen extends StatelessWidget {
  const CambiadorTemaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final temaProvider = Provider.of<TemaProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Cambiar Tema")),
      body: Center(
        child: SwitchListTile(
          title: const Text("Modo Oscuro"),
          value: temaProvider.esModoOscuro,
          onChanged: (valor) {
            temaProvider.cambiarTema();
          },
        ),
      ),
    );
  }
}
