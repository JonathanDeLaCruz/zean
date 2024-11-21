import 'package:flutter/material.dart';
import 'package:zean/game/assets.dart';
import 'package:zean/game/home.dart'; // Asegúrate de que LevelIndicator esté correctamente importado

class MisionesPage extends StatelessWidget {
  const MisionesPage({Key? key}) : super(key: key);

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
              // Barra de nivel reutilizada
              const LevelIndicator(),
              SizedBox(height: isTablet ? 30 : 20),

              // Título de Misiones Diarias
              Center(
                child: Text(
                  "MISIONES DIARIAS",
                  style: TextStyle(
                    fontSize: isTablet ? 24 : 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),
              SizedBox(height: isTablet ? 30 : 20),

              // Lista de misiones diarias
              ..._buildMissionCards(
                missions: [
                  {
                    "title": "Control Matutino",
                    "description":
                        "Registra tus niveles de glucosa en la mañana antes de desayunar.",
                    "points": "+10",
                  },
                  {
                    "title": "Un Paseo Saludable",
                    "description": "Camina al menos 3,000 pasos hoy.",
                    "points": "+15",
                  },
                  {
                    "title": "Toma tu Medicamento",
                    "description":
                        "Confirma la ingesta de tu tratamiento en los horarios indicados.",
                    "points": "+10",
                  },
                ],
                isTablet: isTablet,
              ),
              SizedBox(height: isTablet ? 30 : 20),

              // Título de Misiones Semanales
              Center(
                child: Text(
                  "⭐ MISIONES SEMANALES ⭐",
                  style: TextStyle(
                    fontSize: isTablet ? 24 : 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),
              SizedBox(height: isTablet ? 30 : 20),

              // Lista de misiones semanales
              ..._buildMissionCards(
                missions: [
                  {
                    "title": "Hidrátate Bien",
                    "description":
                        "Registra al menos 1.5 litros de agua consumidos al día durante 5 días.",
                    "points": "+50",
                    "icon": Assets.lente,
                  },
                  {
                    "title": "Chef Saludable",
                    "description":
                        "Prepara al menos 5 comidas basadas en las recomendaciones de tu plan alimenticio.",
                    "points": "+60",
                    "icon": Assets.sombrero,
                  },
                  {
                    "title": "Reto Activo",
                    "description":
                        "Realiza actividad física durante al menos 30 minutos en 3 días de la semana.",
                    "points": "+50",
                    "icon": Assets.bigote,
                  },
                ],
                isTablet: isTablet,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildMissionCards({
    required List<Map<String, String>> missions,
    required bool isTablet,
  }) {
    return missions.map((mission) {
      return _buildMissionCard(
        title: mission["title"]!,
        description: mission["description"]!,
        points: mission["points"]!,
        icon: mission["icon"], // Puede ser null
        isTablet: isTablet,
      );
    }).toList();
  }

  Widget _buildMissionCard({
    required String title,
    required String description,
    required String points,
    String? icon, // Ruta opcional al icono
    required bool isTablet,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icono opcional
          if (icon != null)
            Image.asset(
              icon,
              width: isTablet ? 100 : 60,
              height: isTablet ? 100 : 60,
              fit: BoxFit.cover,
            ),
          if (icon != null) const SizedBox(width: 16),

          // Descripción de la misión
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: isTablet ? 20 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: isTablet ? 12 : 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: isTablet ? 16 : 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),

          // Puntos
          Padding(
            padding: EdgeInsets.only(top: isTablet ? 12 : 8),
            child: Text(
              points,
              style: TextStyle(
                fontSize: isTablet ? 20 : 16,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
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
    home: MisionesPage(),
  ));
}