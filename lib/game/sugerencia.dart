import 'package:flutter/material.dart';
import 'package:zean/game/assets.dart';
import 'package:zean/game/encuesta.dart';
import 'package:zean/game/recomendacion.dart';

class SugerenciaPage extends StatelessWidget {
  const SugerenciaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600; // Determina si es tablet o no.

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Encabezado
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: isTablet ? 35 : 25,
                    backgroundColor: Colors.grey[300],
                    child: Icon(
                      Icons.person,
                      color: Colors.brown,
                      size: isTablet ? 40 : 32,
                    ),
                  ),
                  Text(
                    "SUGERENCIAS",
                    style: TextStyle(
                      fontSize: isTablet ? 24 : 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  Icon(
                    Icons.notifications,
                    color: Colors.orange,
                    size: isTablet ? 40 : 32,
                  ),
                ],
              ),
              SizedBox(height: isTablet ? 30 : 20),

              // Sugerencias (Carrusel de imágenes)
              SizedBox(
                height: isTablet ? 150 : 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildSuggestionImage(Assets.uno, 1, context, isTablet),
                    _buildSuggestionImage(Assets.dos, 2, context, isTablet),
                    _buildSuggestionImage(Assets.tres, 3, context, isTablet),
                    _buildSuggestionImage(Assets.cuatro, 4, context, isTablet),
                  ],
                ),
              ),
              SizedBox(height: isTablet ? 30 : 20),

              // Encuestas
              Text(
                "ENCUESTAS",
                style: TextStyle(
                  fontSize: isTablet ? 24 : 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              SizedBox(height: isTablet ? 20 : 10),

              // Tarjetas de encuestas
              _buildSurveyCard(
                id: 1,
                title: "Experiencia de Vida con Diabetes",
                timeRemaining: "14hrs",
                context: context,
                isTablet: isTablet,
              ),
              _buildSurveyCard(
                id: 2,
                title: "Impacto de la Diabetes en la Vida Diaria",
                timeRemaining: "1d",
                context: context,
                isTablet: isTablet,
              ),
              _buildSurveyCard(
                id: 3,
                title: "Percepción y Educación sobre la Diabetes",
                timeRemaining: "1d 12hrs",
                context: context,
                isTablet: isTablet,
              ),
              _buildSurveyCard(
                id: 4,
                title: "Retos y Soluciones en el Tratamiento de la Diabetes",
                timeRemaining: "2d",
                context: context,
                isTablet: isTablet,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuggestionImage(
      String imagePath, int id, BuildContext context, bool isTablet) {
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
        margin: EdgeInsets.symmetric(horizontal: isTablet ? 16.0 : 8.0),
        width: isTablet ? 150 : 100,
        height: isTablet ? 150 : 100,
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
    required bool isTablet,
    bool isHighlighted = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: isTablet ? 16.0 : 12.0),
      padding: EdgeInsets.all(isTablet ? 16.0 : 12.0),
      decoration: BoxDecoration(
        color: isHighlighted ? Colors.blue[50] : Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: isHighlighted ? Border.all(color: Colors.blue, width: 2) : null,
      ),
      child: Row(
        children: [
          // Texto del título y tiempo restante
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: isTablet ? 18 : 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: isTablet ? 8 : 5),
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
                      style: TextStyle(
                        fontSize: isTablet ? 14 : 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),

          // Botón Responder
          Expanded(
            flex: 2,
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
                padding: EdgeInsets.symmetric(
                  vertical: isTablet ? 14 : 12,
                ),
              ),
              child: Text(
                "Responder",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 14 : 12,
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
