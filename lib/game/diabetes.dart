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
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600; // Determina si es tablet o no.

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Encuesta",
          style: TextStyle(
            color: Colors.black,
            fontSize: isTablet ? 24 : 18,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Datos Básicos Sobre Tu Diabetes",
                  style: TextStyle(
                    fontSize: isTablet ? 28 : 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildQuestionCard(
                questions: [
                  {
                    "question":
                        "¿Hace cuánto tiempo fuiste diagnosticado con diabetes?",
                    "options": [
                      "Menos de un año",
                      "1-5 años",
                      "Más de 5",
                      "No estoy seguro"
                    ],
                  },
                  {
                    "question":
                        "¿Con qué frecuencia monitoreas tus niveles de glucosa?",
                    "options": [
                      "Varias veces al día",
                      "Una vez al día",
                      "Varias veces a la semana",
                      "Rara vez o nunca"
                    ],
                  },
                  {
                    "question":
                        "¿Cuáles han sido tus niveles promedio de glucosa en las últimas semanas? (en mg/dL)",
                    "options": [
                      "Menos de 100",
                      "Entre 100 y 180",
                      "Más de 180",
                      "No estoy seguro"
                    ],
                  },
                ],
                selectedValues: [
                  _selectedOption1,
                  _selectedOption2,
                  _selectedOption3,
                ],
                onOptionSelected: (index, value) {
                  setState(() {
                    if (index == 0) {
                      _selectedOption1 = value;
                    } else if (index == 1) {
                      _selectedOption2 = value;
                    } else {
                      _selectedOption3 = value;
                    }
                  });
                },
                isTablet: isTablet,
              ),
              const SizedBox(height: 30),
              // Conejo y mensaje
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(isTablet ? 16.0 : 12.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 2,
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: const Text(
                        "Intenta responder la encuesta de forma precisa",
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    'assets/images/conejo.png', // Ruta al conejo
                    width: isTablet ? 140 : 100,
                    height: isTablet ? 140 : 100,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResultadoPage(
                              puntos: 11,
                              estado: 'CONTROL DEFICIENTE',
                              descripcion:
                                  'El usuario presenta síntomas frecuentes, falta de monitoreo y/o poca adherencia al tratamiento. Requiere intervención inmediata',
                              color: Colors.red), // Implementado
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF53746E),
                      padding: EdgeInsets.symmetric(
                        vertical: isTablet ? 20 : 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Enviar",
                      style: TextStyle(
                        fontSize: isTablet ? 20 : 16,
                        color: Colors.white,
                      ),
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

Widget _buildQuestionCard({
  required List<Map<String, dynamic>> questions,
  required List<String?> selectedValues,
  required void Function(int index, String value) onOptionSelected, // Cambiar el tipo aquí
  required bool isTablet,
}) {
  return Container(
    padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
    decoration: BoxDecoration(
      color: Colors.blue[50],
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.teal, width: 1),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: questions.asMap().entries.map((entry) {
        final index = entry.key;
        final question = entry.value["question"];
        final options = entry.value["options"] as List<String>;

        return Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                question,
                style: TextStyle(
                  fontSize: isTablet ? 18 : 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.0,
                  crossAxisSpacing: 12.0,
                  childAspectRatio: isTablet ? 4 : 3.2,
                ),
                itemCount: options.length,
                itemBuilder: (context, optionIndex) {
                  final option = options[optionIndex];
                  return ElevatedButton(
                    onPressed: () => onOptionSelected(index, option), // Uso del callback
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedValues[index] == option
                          ? Colors.teal
                          : Colors.white,
                      foregroundColor: selectedValues[index] == option
                          ? Colors.white
                          : Colors.black87,
                      side: BorderSide(
                        color: option.contains("No estoy seguro")
                            ? Colors.red.shade300
                            : Colors.teal.shade300,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: isTablet ? 16 : 12,
                      ),
                    ),
                    child: Text(
                      option,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isTablet ? 16 : 14,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      }).toList(),
    ),
  );
}

}

void main() {
  runApp(const MaterialApp(
    home: DiabetesPage(),
  ));
}
