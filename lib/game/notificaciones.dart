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
              // Navegar a la página de perfil
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PerfilPage(),
                ),
              );
            },
            onNotificationTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificacionesPage(),
                ),
              );
            },
          ),
          SizedBox(height: isTablet ? 24.0 : 16.0),

          // Lista de notificaciones
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
              children: [
                _buildNotificationCard(
                  context,
                  title: "Alerta presión arterial",
                  description:
                      "¡¡Tu presión arterial rebasa lo habitual, se recomienda aplicar medicamentos o ir a tu centro de salud más cercano!!",
                  backgroundColor: Colors.red[100]!,
                  iconColor: Colors.red,
                  isTablet: isTablet,
                ),
                _buildNotificationCard(
                  context,
                  title: "¡Un Paseo Saludable!",
                  description:
                      "Haz completado la misión del día, aprovecha a canjear tus recompensas.",
                  backgroundColor: Colors.green[100]!,
                  iconColor: Colors.green,
                  isTablet: isTablet,
                ),
                _buildNotificationCard(
                  context,
                  title: "¡Toma tu Medicamento!",
                  description:
                      "Haz completado la misión del día, aprovecha a canjear tus recompensas.",
                  backgroundColor: Colors.green[100]!,
                  iconColor: Colors.green,
                  isTablet: isTablet,
                ),
                _buildNotificationCard(
                  context,
                  title: "Hidrátate Bien",
                  description:
                      "Recordatorio de misión diaria, \"Registra al menos 1.5 litros de agua consumidos al día durante 5 días.\"",
                  backgroundColor: Colors.blue[100]!,
                  iconColor: Colors.blue,
                  isTablet: isTablet,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard(
    BuildContext context, {
    required String title,
    required String description,
    required Color backgroundColor,
    required Color iconColor,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: isTablet ? 20 : 16,
                    fontWeight: FontWeight.bold,
                    color: iconColor,
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.delete, size: 20),
                    color: Colors.black,
                    onPressed: () {
                      // Acción para eliminar notificación
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.check, size: 20),
                    color: Colors.black,
                    onPressed: () {
                      // Acción para marcar como leída o completada
                    },
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: isTablet ? 12 : 8),
          Text(
            description,
            style: TextStyle(
              fontSize: isTablet ? 16 : 14,
              color: Colors.black,
            ),
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
