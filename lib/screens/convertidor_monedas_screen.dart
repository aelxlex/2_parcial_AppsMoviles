import 'package:flutter/material.dart';

class ConvertidorMonedasScreen extends StatefulWidget {
  const ConvertidorMonedasScreen({super.key});

  @override
  _ConvertidorMonedasScreenState createState() => _ConvertidorMonedasScreenState();
}

class _ConvertidorMonedasScreenState extends State<ConvertidorMonedasScreen> {
  final TextEditingController controladorMonto = TextEditingController();
  String resultado = '';
  String conversionSeleccionada = 'Bs a Dolar';
  final tasaCambio = 7.0; // Con cambio de $1 = 7 Bs.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Conversor de Moneda")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controladorMonto,
              decoration: const InputDecoration(
                labelText: 'Ingrese el monto',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Tipo de conversión:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                DropdownButton<String>(
                  value: conversionSeleccionada,
                  items:const [
                    DropdownMenuItem(
                      value: 'Bs a Dolar',
                      child: Text('Bolivianos a Dólares'),
                    ),
                    DropdownMenuItem(
                      value: 'Dolar a Bs',
                      child: Text('Dólares a Bolivianos'),
                    ),
                  ],
                  onChanged: (nuevoValor) {
                    setState(() {
                      conversionSeleccionada = nuevoValor!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    double monto = double.tryParse(controladorMonto.text) ?? 0;

                    if (conversionSeleccionada == 'Bs a Dolar') {
                      resultado = "En Dólares: \$${(monto / tasaCambio).toStringAsFixed(2)}";
                    } else {
                      resultado = "En Bolivianos: Bs ${(monto * tasaCambio).toStringAsFixed(2)}";
                    }
                  });
                },
                child: const Text("Convertir"),
              ),
            ),
            const SizedBox(height: 16),
            if (resultado.isNotEmpty)
              Center(
                child: Text(
                  resultado,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
