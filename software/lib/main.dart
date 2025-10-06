import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta la franja de debug
      title: 'Suma de Números',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: SumaScreen(),
    );
  }
}

class SumaScreen extends StatefulWidget {
  @override
  _SumaScreenState createState() => _SumaScreenState();
}

class _SumaScreenState extends State<SumaScreen> {
  final num1Controller = TextEditingController();
  final num2Controller = TextEditingController();
  String resultado = "";

  void sumar() {
    final n1 = double.tryParse(num1Controller.text) ?? 0;
    final n2 = double.tryParse(num2Controller.text) ?? 0;
    setState(() {
      resultado = "Resultado: ${(n1 + n2).toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Suma de 2 Números"),
        centerTitle: true,
        elevation: 4,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.calculate, size: 80, color: Colors.indigo),
                  const SizedBox(height: 20),
                  Text(
                    "Calculadora de Suma",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[700],
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: num1Controller,
                    decoration: InputDecoration(
                      labelText: "Número 1",
                      prefixIcon: Icon(Icons.looks_one),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: num2Controller,
                    decoration: InputDecoration(
                      labelText: "Número 2",
                      prefixIcon: Icon(Icons.looks_two),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: sumar,
                    icon: Icon(Icons.add),
                    label: Text("Sumar"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    resultado,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[800],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
