import 'package:flutter/material.dart';
import 'package:zean/game/perfil.dart';

class NotificacionesPage extends StatelessWidget {
  const NotificacionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600; // Determina si es tablet o no.

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Encabezado personalizado
          CustomHeader(
            title: "NOTIFICACIONES",
            isTablet: isTablet,
            onAvatarTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PerfilPage(),
                ),
              );
            },
            onNotificationTap: () {},
          ),
          SizedBox(height: isTablet ? 24.0 : 16.0),

          // Lista de notificaciones
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
              children: [
                _buildNotificationCard(
                  title: "Alerta presión arterial",
                  description:
                      "¡¡Tu presión arterial rebasa lo habitual, se recomienda aplicar medicamentos o ir a tu centro de salud más cercano!!",
                  backgroundColor: const Color(0xFFFFE6E6), // Suave rojo
                  iconColor: Colors.red,
                  icon: Icons.warning,
                  isTablet: isTablet,
                ),
                _buildNotificationCard(
                  title: "¡Un Paseo Saludable!",
                  description:
                      "Haz completado la misión del día, aprovecha a canjear tus recompensas.",
                  backgroundColor: const Color(0xFFF6FFF6), // Suave verde
                  iconColor: Colors.green,
                  icon: Icons.directions_walk,
                  isTablet: isTablet,
                ),
                _buildNotificationCard(
                  title: "¡Toma tu Medicamento!",
                  description:
                      "Haz completado la misión del día, aprovecha a canjear tus recompensas.",
                  backgroundColor: const Color(0xFFF6FFF6), // Suave verde
                  iconColor: Colors.green,
                  icon: Icons.medication,
                  isTablet: isTablet,
                ),
                _buildNotificationCard(
                  title: "Hidrátate Bien",
                  description:
                      "Recordatorio de misión diaria: \"Registra al menos 1.5 litros de agua consumidos al día durante 5 días.\"",
                  backgroundColor: const Color(0xFFE6F7FF), // Suave azul
                  iconColor: Colors.blue,
                  icon: Icons.water_drop,
                  isTablet: isTablet,
                ),
                _buildNotificationCard(
                  title: "Sueño no reparador",
                  description:
                      "¡Parece que no has dormido las horas suficientes para mejorar tu salud! Se recomienda descansar y evitar trasnochar.",
                  backgroundColor: const Color(0xFFFFE6E6), // Suave rojo
                  iconColor: Colors.red,
                  icon: Icons.bedtime,
                  isTablet: isTablet,
                ),
                _buildNotificationCard(
                  title: "Reto Activo",
                  description:
                      "Recordatorio de misión semanal: \"Realiza actividad física durante al menos 30 minutos en 3 días de la semana.\"",
                  backgroundColor: const Color(0xFFE6F7FF), // Suave azul
                  iconColor: Colors.blue,
                  icon: Icons.fitness_center,
                  isTablet: isTablet,
                ),
                _buildNotificationCard(
                  title: "¡Control matutino!",
                  description:
                      "Haz completado la misión del día, aprovecha a canjear tus recompensas.",
                  backgroundColor: const Color(0xFFF6FFF6), // Suave verde
                  iconColor: Colors.green,
                  icon: Icons.check_circle,
                  isTablet: isTablet,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard({
    required String title,
    required String description,
    required Color backgroundColor,
    required Color iconColor,
    required IconData icon,
    required bool isTablet,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: isTablet ? 16.0 : 12.0),
      padding: EdgeInsets.all(isTablet ? 20.0 : 16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: isTablet ? 36 : 28,
                color: iconColor,
              ),
              SizedBox(width: isTablet ? 16.0 : 12.0),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: isTablet ? 20 : 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: isTablet ? 12 : 8),
          Text(
            description,
            style: TextStyle(
              fontSize: isTablet ? 16 : 14,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: isTablet ? 16 : 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.delete, size: 20),
                color: Colors.black54,
                onPressed: () {
                  // Acción para eliminar notificación
                },
              ),
              IconButton(
                icon: const Icon(Icons.check, size: 20),
                color: Colors.black54,
                onPressed: () {
                  // Acción para marcar como leída o completada
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget reutilizable para el encabezado
class CustomHeader extends StatelessWidget {
  final String title;
  final VoidCallback onAvatarTap;
  final VoidCallback onNotificationTap;
  final bool isTablet;

  const CustomHeader({
    Key? key,
    required this.title,
    required this.onAvatarTap,
    required this.onNotificationTap,
    required this.isTablet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onAvatarTap,
            child: CircleAvatar(
              radius: isTablet ? 35 : 25,
              backgroundColor: Colors.grey[300],
              child: Icon(
                Icons.person,
                color: Colors.brown,
                size: isTablet ? 40 : 32,
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: isTablet ? 24 : 18,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          GestureDetector(
            onTap: onNotificationTap,
            child: Icon(
              Icons.notifications,
              color: Colors.orange,
              size: isTablet ? 40 : 32,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: NotificacionesPage(),
  ));
}
