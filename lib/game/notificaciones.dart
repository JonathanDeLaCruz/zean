import 'package:flutter/material.dart';
import 'package:zean/game/perfil.dart';

class NotificacionesPage extends StatelessWidget {
  const NotificacionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Encabezado personalizado
          CustomHeader(
            title: "NOTIFICACIONES",
            onAvatarTap: () {
              // Navegar a la página de perfil
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PerfilPage(), // Implementa PerfilPage
                ),
              );
            },
            onNotificationTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificacionesPage(), // Implementa PerfilPage
                ),
              );
            },
          ),
          const SizedBox(height: 16.0),

          // Lista de notificaciones
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildNotificationCard(
                  context,
                  title: "Alerta presión arterial",
                  description:
                      "¡¡Tu presión arterial rebasa lo habitual, se recomienda aplicar medicamentos o ir a tu centro de salud más cercano!!",
                  backgroundColor: Colors.red[100]!,
                  iconColor: Colors.red,
                ),
                _buildNotificationCard(
                  context,
                  title: "¡Un Paseo Saludable!",
                  description:
                      "Haz completado la misión del día, aprovecha a canjear tus recompensas.",
                  backgroundColor: Colors.green[100]!,
                  iconColor: Colors.green,
                ),
                _buildNotificationCard(
                  context,
                  title: "¡Toma tu Medicamento!",
                  description:
                      "Haz completado la misión del día, aprovecha a canjear tus recompensas.",
                  backgroundColor: Colors.green[100]!,
                  iconColor: Colors.green,
                ),
                _buildNotificationCard(
                  context,
                  title: "Hidrátate Bien",
                  description:
                      "Recordatorio de misión diaria, \"Registra al menos 1.5 litros de agua consumidos al día durante 5 días.\"",
                  backgroundColor: Colors.blue[100]!,
                  iconColor: Colors.blue,
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
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      padding: const EdgeInsets.all(16.0),
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
                    fontSize: 16,
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
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
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

  const CustomHeader({
    Key? key,
    required this.title,
    required this.onAvatarTap,
    required this.onNotificationTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onAvatarTap,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey[300],
              child: const Icon(
                Icons.person,
                color: Colors.brown,
                size: 32,
              ),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          GestureDetector(
            onTap: onNotificationTap,
            child: const Icon(
              Icons.notifications,
              color: Colors.orange,
              size: 32,
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
