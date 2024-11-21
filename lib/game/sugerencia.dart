import 'package:flutter/material.dart';
import 'package:zean/game/assets.dart';
import 'package:zean/game/encuesta.dart';
import 'package:zean/game/recomendacion.dart';

class SugerenciaPage extends StatelessWidget {
  const SugerenciaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Encabezado
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey[300],
                    child: const Icon(
                      Icons.person,
                      color: Colors.brown,
                      size: 32,
                    ),
                  ),
                  const Text(
                    "SUGERENCIAS",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const Icon(
                    Icons.notifications,
                    color: Colors.orange,
                    size: 32,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Sugerencias (Carrusel de imágenes)
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildSuggestionImage(Assets.uno, 1, context),
                    _buildSuggestionImage(Assets.dos, 2, context),
                    _buildSuggestionImage(Assets.tres, 3, context),
                    _buildSuggestionImage(Assets.cuatro, 4, context),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Encuestas
              const Text(
                "ENCUESTAS",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 10),

              // Tarjetas de encuestas
              _buildSurveyCard(
                id: 1,
                title: "Experiencia de Vida con Diabetes",
                timeRemaining: "14hrs",
                context: context,
              ),
              _buildSurveyCard(
                id: 2,
                title: "Impacto de la Diabetes en la Vida Diaria",
                timeRemaining: "1d",
                context: context,
              ),
              _buildSurveyCard(
                id: 3,
                title: "Percepción y Educación sobre la Diabetes",
                timeRemaining: "1d 12hrs",
                context: context,
              ),
              _buildSurveyCard(
                id: 4,
                title: "Retos y Soluciones en el Tratamiento de la Diabetes",
                timeRemaining: "2d",
                context: context,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuggestionImage(String imagePath, int id, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navegación a la página de recomendaciones pasando el id
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecomendacionPage(id: id),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildSurveyCard({
    required int id,
    required String title,
    required String timeRemaining,
    required BuildContext context,
    bool isHighlighted = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: isHighlighted ? Colors.blue[50] : Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: isHighlighted ? Border.all(color: Colors.blue, width: 2) : null,
      ),
      child: Row(
        children: [
          // Texto del título y tiempo restante
          Expanded(
            flex: 6, // Ocupa 6 columnas del espacio disponible
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 14,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "Termina en: $timeRemaining",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10), // Espacio entre texto y botón
          // Botón Responder
          Expanded(
            flex: 2, // Ocupa 2 columnas del espacio disponible
            child: ElevatedButton(
              onPressed: () {
                // Navegación a la página de encuestas pasando el id
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EncuestaPage(id: id),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF53746E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 12, // Tamaño vertical adecuado
                ),
              ),
              child: const Text(
                "Responder",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: SugerenciaPage(),
  ));
}
