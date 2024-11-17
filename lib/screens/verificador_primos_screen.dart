import 'package:flutter/material.dart';

class VerificadorPrimosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controladorNumero = TextEditingController();
    String resultado = '';

    bool esPrimo(int numero) {
      if (numero < 2) return false;
      for (int i = 2; i < numero; i++) {
        if (numero % i == 0) {
          return false;
        }
      }
      return true;
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Verificar Primo")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controladorNumero,
              decoration: const InputDecoration(
                labelText: 'Número',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                int numero = int.tryParse(controladorNumero.text) ?? 0;
                resultado = esPrimo(numero)
                    ? "$numero es un número primo"
                    : "$numero no es un número primo";
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    content: Text(resultado),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Aceptar"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Verificar"),
            ),
          ],
        ),
      ),
    );
  }
}
