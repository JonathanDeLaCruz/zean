import 'package:flutter/material.dart';
import 'package:zean/game/modal_no_datos.dart';
import 'package:zean/game/notificaciones.dart';
import 'package:zean/game/perfil.dart';

class GlucosaPage extends StatelessWidget {
  const GlucosaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ModalNoDatos.show(context); // Invoca el método estático de tu modal
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Encabezado
              CustomHeader(
                title: "NIVEL DE GLUCOSA",
                onAvatarTap: () {
                  // Navegar a la página de perfil
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const PerfilPage(), // Implementa PerfilPage
                    ),
                  );
                },
                onNotificationTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const NotificacionesPage(), // Implementa PerfilPage
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),

              // Indicador principal
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.yellow,
                    width: 4,
                  ),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "100\nmg/dL",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Fila de indicadores secundarios
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIndicatorCard(
                    title: "Oxigenación",
                    value: "95%",
                    description: "Tus niveles de oxigenación",
                    progressValue: 0.95,
                    progressColor: Colors.blue,
                  ),
                  _buildIndicatorCard(
                    title: "Presión",
                    value: "95%",
                    description: "Tus niveles de presión",
                    progressValue: 0.95,
                    progressColor: Colors.red,
                  ),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIndicatorCard(
                    title: "Horas de sueño",
                    value: "2 horas",
                    description: "Tus horas de sueño",
                    progressValue: 0.2,
                    progressColor: Colors.red,
                  ),
                  _buildIndicatorCard(
                    title: "Ritmo Cardíaco",
                    value: "79 LPM",
                    description: "Tus niveles de ritmo cardíaco",
                    progressValue: 0.79,
                    progressColor: Colors.blueGrey,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Gráfico de glucosa
              const Text(
                "Registro de Glucosa",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 200,
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    "Gráfico de Glucosa (Simulado)",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIndicatorCard({
    required String title,
    required String value,
    required String description,
    required double progressValue,
    required Color progressColor,
  }) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
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
          LinearProgressIndicator(
            value: progressValue,
            backgroundColor: Colors.grey[300],
            color: progressColor,
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            description,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: GlucosaPage(),
  ));
}
