import 'package:flutter/material.dart';
import 'package:zean/game/resultado.dart';

class DiabetesPage extends StatefulWidget {
  const DiabetesPage({Key? key}) : super(key: key);

  @override
  _DiabetesPageState createState() => _DiabetesPageState();
}

class _DiabetesPageState extends State<DiabetesPage> {
  // Variables para almacenar la selección de cada pregunta
  String? _selectedOption1;
  String? _selectedOption2;
  String? _selectedOption3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Encuesta",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Datos Básicos Sobre Tu Diabetes",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildQuestion(
                question:
                    "¿Hace cuánto tiempo fuiste diagnosticado con diabetes?",
                options: [
                  "Menos de un año",
                  "1-5 años",
                  "Más de 5",
                  "No estoy seguro",
                ],
                selectedValue: _selectedOption1,
                onOptionSelected: (value) {
                  setState(() {
                    _selectedOption1 = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              _buildQuestion(
                question:
                    "¿Con qué frecuencia monitoreas tus niveles de glucosa?",
                options: [
                  "Varias veces al día",
                  "Una vez al día",
                  "Varias veces a la semana",
                  "Rara vez o nunca",
                ],
                selectedValue: _selectedOption2,
                onOptionSelected: (value) {
                  setState(() {
                    _selectedOption2 = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              _buildQuestion(
                question:
                    "¿Cuáles han sido tus niveles promedio de glucosa en las últimas semanas? (en mg/dL)",
                options: [
                  "Menos de 100",
                  "Entre 100 y 180",
                  "Más de 180",
                  "No estoy seguro",
                ],
                selectedValue: _selectedOption3,
                onOptionSelected: (value) {
                  setState(() {
                    _selectedOption3 = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              // Conejo y mensaje
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        "Intenta responder la encuesta de forma precisa",
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    'assets/images/conejo.png', // Ruta al conejo
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ResultadoPage(puntos: 11, estado: 'CONTROL DEFICIENTE', descripcion : 'El usuario presenta síntomas frecuentes, falta de monitoreo y/o poca adherencia al tratamiento. Requiere intervención inmediata', color: Colors.red), // Asegúrate de tener CrearPage implementado
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF53746E),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Enviar",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestion({
    required String question,
    required List<String> options,
    required String? selectedValue,
    required ValueChanged<String> onOptionSelected,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: options.sublist(0, 2).map((option) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: ElevatedButton(
                        onPressed: () => onOptionSelected(option),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selectedValue == option
                              ? Colors.teal
                              : Colors.white,
                          foregroundColor: selectedValue == option
                              ? Colors.white
                              : Colors.black87,
                          side: BorderSide(
                            color: option.contains("No estoy seguro")
                                ? Colors.red
                                : Colors.teal,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                        ),
                        child: Text(
                          option,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: options.sublist(2, 4).map((option) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: ElevatedButton(
                        onPressed: () => onOptionSelected(option),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selectedValue == option
                              ? Colors.teal
                              : Colors.white,
                          foregroundColor: selectedValue == option
                              ? Colors.white
                              : Colors.black87,
                          side: BorderSide(
                            color: option.contains("No estoy seguro")
                                ? Colors.red
                                : Colors.teal,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                        ),
                        child: Text(
                          option,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: DiabetesPage(),
  ));
}
