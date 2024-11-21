import 'package:flutter/material.dart';

class EncuestaPage extends StatelessWidget {
  final int id;

  const EncuestaPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Datos estáticos para pruebas
    final String titulo = "Seguimiento semanal";
    final List<Map<String, dynamic>> preguntas = [
      {
        "pregunta": "¿Cuántos días realizaste ejercicio físico esta semana?",
        "opciones": ["1 día", "Entre 1 y 3 días", "Más de 3 días", "Ningún día"]
      },
      {
        "pregunta": "¿Con qué frecuencia registraste tus niveles de glucosa?",
        "opciones": [
          "Frecuentemente",
          "Poca frecuencia",
          "Muy rara vez",
          "Nunca"
        ]
      },
      {
        "pregunta": "¿Te sentiste motivado a seguir tu plan de alimentación?",
        "opciones": [
          "Muy motivado",
          "Motivado",
          "Poco motivado",
          "Nada motivado"
        ]
      },
      {
        "pregunta":
            "¿Tuviste alguna dificultad para tomar tus medicamentos según lo indicado?",
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
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      titulo,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Preguntas dinámicas
                  ...preguntas.map(
                    (pregunta) => Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: _buildQuestion(
                        pregunta["pregunta"],
                        List<String>.from(pregunta["opciones"]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Botón Enviar
          Padding(
            padding: const EdgeInsets.all(16.0),
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
    );
  }

  Widget _buildQuestion(String question, List<String> options) {
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
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Dos opciones por fila
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 3, // Ajusta la proporción para un mejor diseño
            ),
            itemCount: options.length,
            itemBuilder: (context, index) {
              return ElevatedButton(
                onPressed: () {
                  // Lógica al seleccionar una opción
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black87,
                  side: const BorderSide(color: Colors.teal),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                ),
                child: Text(
                  options[index],
                  style: const TextStyle(fontSize: 12),
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
    home: EncuestaPage(id: 1), // ID estático para pruebas
  ));
}
