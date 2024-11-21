import 'package:flutter/material.dart';
import 'package:zean/game/assets.dart';
import 'package:zean/game/home.dart'; // Asegúrate de que LevelIndicator esté correctamente importado

class MisionesPage extends StatelessWidget {
  const MisionesPage({Key? key}) : super(key: key);

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
              // Barra de nivel reutilizada
              const LevelIndicator(),
              const SizedBox(height: 20),

              // Título de Misiones Diarias
              const Center(
                child: Text(
                  "MISIONES DIARIAS",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Lista de misiones diarias
              _buildMissionCard(
                title: "Control Matutino",
                description:
                    "Registra tus niveles de glucosa en la mañana antes de desayunar.",
                points: "+10",
              ),
              _buildMissionCard(
                title: "Un Paseo Saludable",
                description: "Camina al menos 3,000 pasos hoy.",
                points: "+15",
              ),
              _buildMissionCard(
                title: "Toma tu Medicamento",
                description:
                    "Confirma la ingesta de tu tratamiento en los horarios indicados.",
                points: "+10",
              ),
              const SizedBox(height: 20),

              // Título de Misiones Semanales
              const Center(
                child: Text(
                  "⭐ MISIONES SEMANALES ⭐",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Lista de misiones semanales
              _buildMissionCard(
                title: "Hidrátate Bien",
                description:
                    "Registra al menos 1.5 litros de agua consumidos al día durante 5 días.",
                points: "+50",
                icon: Assets.lente, // Ruta a tu icono
              ),
              _buildMissionCard(
                title: "Chef Saludable",
                description:
                    "Prepara al menos 5 comidas basadas en las recomendaciones de tu plan alimenticio.",
                points: "+60",
                icon: Assets.sombrero, // Ruta a tu icono
              ),
              _buildMissionCard(
                title: "Reto Activo",
                description:
                    "Realiza actividad física durante al menos 30 minutos en 3 días de la semana.",
                points: "+50",
                icon: Assets.bigote, // Ruta a tu icono
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMissionCard({
    required String title,
    required String description,
    required String points,
    String? icon, // Ruta opcional al icono
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Descripción de la misión
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          // Icono opcional y puntos
          Column(
            children: [
              if (icon != null)
                Image.asset(
                  icon,
                  width: 150,
                  height: 150,
                ),
              const SizedBox(height: 10),
              Text(
                points,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
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
    home: MisionesPage(),
  ));
}
