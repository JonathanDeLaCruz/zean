import 'package:flutter/material.dart';

class EncuestaPage extends StatelessWidget {
  final int id;

  const EncuestaPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;

    final String titulo = "Seguimiento semanal";
    final List<Map<String, dynamic>> preguntas = [
      {
        "pregunta": "¿Cuántos días realizaste ejercicio físico esta semana?",
        "opciones": ["1 día", "Entre 1 y 3 días", "Más de 3 días", "Ningún día"]
      },
      {
        "pregunta": "¿Con qué frecuencia registraste tus niveles de glucosa?",
        "opciones": ["Frecuentemente", "Poca frecuencia", "Muy rara vez", "Nunca"]
      },
      {
        "pregunta": "¿Te sentiste motivado a seguir tu plan de alimentación?",
        "opciones": ["Muy motivado", "Motivado", "Poco motivado", "Nada motivado"]
      },
      {
        "pregunta": "¿Tuviste alguna dificultad para tomar tus medicamentos según lo indicado?",
        "opciones": ["Ninguna", "Algunas pocas", "Algunas", "Muchas"]
      },
    ];

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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      titulo,
                      style: TextStyle(
                        fontSize: isTablet ? 28 : 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  SizedBox(height: isTablet ? 30 : 20),

                  // Preguntas dinámicas
                  ...preguntas.map(
                    (pregunta) => Padding(
                      padding: EdgeInsets.only(bottom: isTablet ? 30.0 : 20.0),
                      child: _buildQuestion(
                        pregunta["pregunta"],
                        List<String>.from(pregunta["opciones"]),
                        isTablet: isTablet,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Botón Enviar
          Padding(
            padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
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
    );
  }

  Widget _buildQuestion(String question, List<String> options, {required bool isTablet}) {
    return Container(
      padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.teal, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: TextStyle(
              fontSize: isTablet ? 18 : 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 columnas para la cuadrícula
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 12.0,
              childAspectRatio: isTablet ? 3.5 : 3.0, // Ajuste de proporciones
            ),
            itemCount: options.length,
            itemBuilder: (context, index) {
              return ElevatedButton(
                onPressed: () {
                  // Lógica al seleccionar una opción
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.teal,
                  side: const BorderSide(color: Colors.teal),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: isTablet ? 16 : 12,
                  ),
                ),
                child: Text(
                  options[index],
                  style: TextStyle(
                    fontSize: isTablet ? 16 : 14,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: EncuestaPage(id: 1),
  ));
}
