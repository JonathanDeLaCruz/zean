import 'package:flutter/material.dart';

class EncuestaPage extends StatelessWidget {
  final int id;

  const EncuestaPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600; // Determina si es tablet o no.

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
                        fontSize: isTablet ? 28 : 18,
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
    );
  }

  Widget _buildQuestion(String question, List<String> options, {required bool isTablet}) {
    return Container(
      padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: TextStyle(
              fontSize: isTablet ? 18 : 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isTablet ? 3 : 2, // Tres opciones por fila en tablets
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 12.0,
              childAspectRatio: isTablet ? 4 : 3, // Proporción ajustada para tablets
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
                  padding: EdgeInsets.symmetric(
                    horizontal: isTablet ? 24 : 16,
                    vertical: isTablet ? 14 : 10,
                  ),
                ),
                child: Text(
                  options[index],
                  style: TextStyle(
                    fontSize: isTablet ? 16 : 12,
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
    home: EncuestaPage(id: 1), // ID estático para pruebas
  ));
}