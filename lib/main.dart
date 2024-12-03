import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio 4: Paso de Parámetros Pi y e',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _resultado = "";
  String _resultado2 = "";
  TextEditingController _piController = TextEditingController();
  TextEditingController _eController = TextEditingController();

  // Función para calcular pi y e dados los parámetros
  void _calcularValores() {
    try {
      double piInput = double.parse(_piController.text);  // Lee el input del usuario
      double eInput = double.parse(_eController.text);  // Lee el input del usuario

      // Calcular el valor de pi usando acos(piInput) y e usando exp(eInput)
      double pi = acos(piInput);  // Calcula el valor de pi usando el input del usuario
      double e = exp(eInput);     // Calcula el valor exponencial usando el input del usuario

      // Actualizar los resultados
      setState(() {
        _resultado = 'El valor de pi con el input $piInput es: $pi';
        _resultado2 = 'El valor de e con el input $eInput es: $e';
      });
    } catch (e) {
      setState(() {
        _resultado = 'Error en el cálculo de pi. Asegúrate de ingresar un valor válido para pi.';
        _resultado2 = 'Error en el cálculo de e. Asegúrate de ingresar un valor válido para e.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 4: paso de parametros con pi y e'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.purple.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TextField para ingresar un valor para el cálculo de pi
                TextField(
                  controller: _piController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Ingresa un valor para calcular pi (Debe ser -1)',
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20),

                // TextField para ingresar un valor para el cálculo de e
                TextField(
                  controller: _eController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Ingresa un valor para calcular e (Debe ser, 1)',
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20),

                // Botón para ejecutar el cálculo
                ElevatedButton(
                  onPressed: _calcularValores,
                  child: Text('Calcular Pi y e'),
                ),
                SizedBox(height: 20),

                // Mostrar los resultados
                Text(
                  _resultado,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  _resultado2,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
