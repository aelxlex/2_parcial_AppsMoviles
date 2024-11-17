import 'package:flutter/material.dart';

class ConvertidorBasesScreen extends StatefulWidget {
  const ConvertidorBasesScreen({super.key});

  @override
  _ConvertidorBasesScreenState createState() => _ConvertidorBasesScreenState();
}

class _ConvertidorBasesScreenState extends State<ConvertidorBasesScreen> {
  final TextEditingController controladorNumero = TextEditingController();
  String resultado = '';
  String baseEntrada = 'Decimal';
  String baseSalida = 'Binario';

  final Map<String, int> bases = {
    'Decimal': 10,
    'Binario': 2,
    'Octal': 8,
    'Hexadecimal': 16,
  };

  String convertirBases(String numero, String baseEntrada, String baseSalida) {
    try {
      // Convertimos el número de la base de entrada a decimal
      int numeroDecimal = int.parse(numero, radix: bases[baseEntrada]!);

      // Convertimos de decimal a la base de salida
      String resultadoConvertido = numeroDecimal.toRadixString(bases[baseSalida]!);

      // Convertimos a mayúsculas si la base es hexadecimal
      return baseSalida == 'Hexadecimal' ? resultadoConvertido.toUpperCase() : resultadoConvertido;
    } catch (e) {
      return 'Error: Número inválido para la base seleccionada';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Convertidor de Bases")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Número a Convertir:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: controladorNumero,
              decoration:const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ingrese el número',
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Base de Entrada:",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    DropdownButton<String>(
                      value: baseEntrada,
                      items: bases.keys.map((String base) {
                        return DropdownMenuItem<String>(
                          value: base,
                          child: Text(base),
                        );
                      }).toList(),
                      onChanged: (nuevoValor) {
                        setState(() {
                          baseEntrada = nuevoValor!;
                        });
                      },
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Base de Salida:",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    DropdownButton<String>(
                      value: baseSalida,
                      items: bases.keys.map((String base) {
                        return DropdownMenuItem<String>(
                          value: base,
                          child: Text(base),
                        );
                      }).toList(),
                      onChanged: (nuevoValor) {
                        setState(() {
                          baseSalida = nuevoValor!;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    resultado = convertirBases(
                      controladorNumero.text,
                      baseEntrada,
                      baseSalida,
                    );
                  });
                },
                child:const  Text("Convertir"),
              ),
            ),
            const SizedBox(height: 16),
            if (resultado.isNotEmpty)
              Center(
                child: Text(
                  "Resultado: $resultado",
                  style:const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
