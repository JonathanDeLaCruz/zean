import 'package:flutter/material.dart';

class RegistroPage extends StatelessWidget {
  const RegistroPage({Key? key}) : super(key: key);

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
          "Registro de glucosa",
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
              // Título
              Center(
                child: Text(
                  "REGISTRO DE PARÁMETROS",
                  style: TextStyle(
                    fontSize: isTablet ? 24 : 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),
              SizedBox(height: isTablet ? 30 : 20),

              // Campos de entrada
              _buildInputField(
                label: "Glucosa:",
                hint: "Nivel de glucosa en mg/dL",
                isTablet: isTablet,
              ),
              SizedBox(height: isTablet ? 30 : 20),
              _buildInputField(
                label: "Oxigenación:",
                hint: "Porcentaje de oxigenación",
                isTablet: isTablet,
              ),
              SizedBox(height: isTablet ? 30 : 20),
              _buildInputField(
                label: "Presión:",
                hint: "Porcentaje de presión",
                isTablet: isTablet,
              ),
              SizedBox(height: isTablet ? 30 : 20),
              _buildInputField(
                label: "Sueño:",
                hint: "Horas de sueño",
                isTablet: isTablet,
              ),
              SizedBox(height: isTablet ? 30 : 20),
              _buildInputField(
                label: "Ritmo cardiaco:",
                hint: "Ritmo cardiaco en LPM",
                isTablet: isTablet,
              ),
              SizedBox(height: isTablet ? 50 : 40),

              // Mensaje y conejo
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Los datos que ingreses deben ser lo más precisos posibles para su correcto uso. Usa tu glucómetro o acude con un médico para mayor precisión",
                        style: TextStyle(
                          fontSize: isTablet ? 16 : 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(width: isTablet ? 20 : 10),
                  Image.asset(
                    'assets/images/conejo.png', // Ruta a la imagen del conejo
                    width: isTablet ? 150 : 100,
                    height: isTablet ? 150 : 100,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              SizedBox(height: isTablet ? 50 : 40),

              // Botón Enviar
              Padding(
                padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Lógica para enviar respuestas
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Respuestas enviadas")),
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

  Widget _buildInputField({
    required String label,
    required String hint,
    required bool isTablet,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTablet ? 18 : 14,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        SizedBox(height: isTablet ? 12 : 10),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: isTablet ? 20 : 16,
              horizontal: isTablet ? 20 : 16,
            ),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: RegistroPage(),
  ));
}
